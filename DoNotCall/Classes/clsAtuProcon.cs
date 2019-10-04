using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DoNotCall.Classes;

namespace DoNotCall.Classes
{
    class clsAtuProcon
    {
        public class AtuProcon
        {
            public string Origem { get; set; }
            public string UF { get; set; }
            public string Nome { get; set; }
            public string DDD { get; set; }
            public string Fone { get; set; }
            public string Telefone { get; set; }
            public string DataBloq { get; set; }
            public string ApartirDe { get; set; }
            public string Situacao { get; set; }

            //public AtuProcon(string origem, string uF, string nome, string dDD, string fone, string telefone, string dataBloq, string apartirDe, string situacao)
            //{
            //    Origem = origem;
            //    UF = uF;
            //    Nome = nome;
            //    DDD = dDD;
            //    Fone = fone;
            //    Telefone = telefone;
            //    DataBloq = dataBloq;
            //    ApartirDe = apartirDe;
            //    Situacao = situacao;
            //}
        }


        private static SqlConnection sqlCon;

        public static async Task<bool> SqlBulkAsync(DataTable _dt)
        {
            try
            {
                // incluindo dados da datatable para sql via slqBulkCopy
                using (SqlBulkCopy s = new SqlBulkCopy(Classes.clsVariaveis.Conexao))
                {
                    s.BatchSize = 2500;
                    s.NotifyAfter = 5000;

                    s.DestinationTableName = "Atu_Procon";
                    s.ColumnMappings.Add("ORIGEM", "ORIGEM");
                    s.ColumnMappings.Add("UF", "UF");
                    s.ColumnMappings.Add("NOME", "NOME");
                    s.ColumnMappings.Add("DDD", "DDD");
                    s.ColumnMappings.Add("FONE", "FONE");
                    s.ColumnMappings.Add("TELEFONE", "TELEFONE");
                    s.ColumnMappings.Add("DATA", "DATA");
                    s.ColumnMappings.Add("SITUACAO", "SITUACAO");
                    s.ColumnMappings.Add("ApartirDe", "APARTIRDE");
                    await s.WriteToServerAsync(_dt);
                }
                return true;
            }
            catch (Exception eb)
            {
                MessageBox.Show(eb.Message, "sql bulk", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return false;
            }
        }

        public static async Task<bool> ImportarArquivoAsync(string _uf, string _cam)
        {
            try
            {
                clsVariaveis.GContador = 0;

                // criando datatable
                DataTable DT = new DataTable();
                DT.Columns.Add("ORIGEM", typeof(string));
                DT.Columns.Add("UF", typeof(string));
                DT.Columns.Add("NOME", typeof(string));
                DT.Columns.Add("DDD", typeof(string));
                DT.Columns.Add("FONE", typeof(string));
                DT.Columns.Add("TELEFONE", typeof(string));
                DT.Columns.Add("DATA", typeof(DateTime));
                DT.Columns.Add("SITUACAO", typeof(string));
                DT.Columns.Add("ApartirDe", typeof(DateTime));

                SqlConnection sqlconnection = new SqlConnection();
                sqlCon = sqlconnection;
                sqlCon.ConnectionString = Classes.clsVariaveis.Conexao;
                await sqlCon.OpenAsync();


                var cmd = new SqlCommand("truncate table Atu_Procon", sqlCon);
                await cmd.ExecuteNonQueryAsync();


                switch (_uf)
                {
                    case "AL":
                        // gerando list a partir do arquivo texto
                        List<AtuProcon> listAL = clsArquivos.Arquivo_AL(_cam);

                        // passando dados da list para um datatable
                        foreach (AtuProcon item in listAL)
                        {
                            if (item.Telefone != "telefone")
                            {
                                if (DateTime.Parse(item.DataBloq) > DateTime.Parse("01/01/2019"))
                                {
                                    DataRow dr = DT.NewRow();
                                    dr["ORIGEM"] = "PROCON";
                                    dr["UF"] = "AL";
                                    dr["TELEFONE"] = clsFuncoes.RetornaNumero(item.Telefone);
                                    dr["DATA"] = DateTime.Parse(item.DataBloq);
                                    DT.Rows.Add(dr);
                                }
                            }
                        }

                        // incluindo dados da datatable para sql via slqBulkCopy
                        clsVariaveis.GBoolOK = await SqlBulkAsync(DT);

                        listAL.Clear();
                        break;

                    case "CE":
                    case "MS":
                    case "RN":
                        // incluindo dados a partir de arquivo xlsx
                        Boolean booOK = await clsPlanilha.LePlanilhaAsync(_cam, _uf);
                        break;
                        
                        //// gerando list a partir do arquivo texto
                        //List<AtuProcon> listCE = clsArquivos.Arquivo_CE(_cam);

                        //// passando dados da list para o datatable
                        //foreach (AtuProcon item in listCE)
                        //{
                        //    if (item.Telefone != "Numero")
                        //    {
                        //        if (DateTime.Parse(item.DataBloq) > DateTime.Parse("01/01/2019"))
                        //        {
                        //            DataRow dr = DT.NewRow();
                        //            dr["ORIGEM"] = "PROCON";
                        //            dr["UF"] = "CE";
                        //            dr["TELEFONE"] = clsFuncoes.RetornaNumero(item.Telefone);
                        //            dr["DATA"] = DateTime.Parse(item.DataBloq);
                        //            dr["SITUACAO"] = item.Situacao;
                        //            DT.Rows.Add(dr);
                        //        }
                        //    }
                        //}

                        //// incluindo dados da datatable para sql via slqBulkCopy
                        //clsVariaveis.GBoolOK = await SqlBulkAsync(DT);

                        //listCE.Clear();
                        //break;

                    case "GO":
                        using (StreamReader Texto = new StreamReader(_cam))
                        {
                            while (true)
                            {
                                string linhaTexto = Texto.ReadLine();

                                try
                                {
                                    string[] fones = linhaTexto.Split(new char[] { ';' });

                                    List<string> listGO = new List<string>();
                                    listGO.AddRange(fones);

                                    // passando dados da list para o datatable
                                    foreach (string item in listGO)
                                    {
                                        DataRow dr = DT.NewRow();
                                        dr["ORIGEM"] = "PROCON";
                                        dr["UF"] = "GO";
                                        dr["TELEFONE"] = clsFuncoes.RetornaNumero(item);
                                        DT.Rows.Add(dr);
                                    }

                                    // incluindo dados da datatable para sql via slqBulkCopy
                                    clsVariaveis.GBoolOK = await SqlBulkAsync(DT);

                                    listGO.Clear();

                                }
                                catch (System.Exception eT)
                                {
                                    MessageBox.Show(eT.Message, "GO", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                }
                                break;
                            }
                        }
                        break;

                    case "MG":
                        // gerando list a partir do arquivo texto
                        List<AtuProcon> listMG = clsArquivos.Arquivo_MG(_cam);

                        // passando dados da list para o datatable
                        foreach (AtuProcon item in listMG)
                        {
                            if (item.Telefone != "telefone")
                            {
                                if (DateTime.Parse(item.DataBloq) > DateTime.Parse("01/01/2019"))
                                {
                                    DataRow dr = DT.NewRow();
                                    dr["ORIGEM"] = "PROCON";
                                    dr["UF"] = "MG";
                                    dr["DDD"] = clsFuncoes.RetornaNumero(item.DDD);
                                    dr["FONE"] = clsFuncoes.RetornaNumero(item.Telefone);
                                    dr["DATA"] = DateTime.Parse(item.DataBloq);
                                    DT.Rows.Add(dr);
                                }
                            }
                        }

                        // incluindo dados da datatable para sql via slqBulkCopy
                        clsVariaveis.GBoolOK = await SqlBulkAsync(DT);

                        listMG.Clear();
                        break;


                    //case "MS":
                    //    // gerando list a partir do arquivo texto
                    //    List<AtuProcon> listMS = clsArquivos.Arquivo_MS(_cam);

                    //    // passando dados da list para o datatable
                    //    foreach (AtuProcon item in listMS)
                    //    {
                    //        if (item.Telefone != "")
                    //        {
                    //            string Lido = item.Telefone;
                    //            Lido = Lido.Substring(1, 1);
                    //            if (char.IsNumber(Convert.ToChar(Lido)))
                    //            {
                    //                if (DateTime.Parse(item.DataBloq) > DateTime.Parse("01/01/2019"))
                    //                {
                    //                    DataRow dr = DT.NewRow();
                    //                    dr["ORIGEM"] = "PROCON";
                    //                    dr["UF"] = "MS";
                    //                    dr["NOME"] = item.Nome;
                    //                    dr["TELEFONE"] = clsFuncoes.RetornaNumero(item.Telefone);
                    //                    dr["DATA"] = DateTime.Parse(item.DataBloq);
                    //                    dr["ApartirDe"] = DateTime.Parse(item.ApartirDe);
                    //                    dr["SITUACAO"] = item.Situacao;
                    //                    DT.Rows.Add(dr);
                    //                }
                    //            }
                    //        }
                    //    }

                    //    // incluindo dados da datatable para sql via slqBulkCopy
                    //    clsVariaveis.GBoolOK = await SqlBulkAsync(DT);

                    //    listMS.Clear();
                    //    break;

                    case "NP":
                        // gerando list a partir do arquivo texto
                        List<AtuProcon> listNP = clsArquivos.Arquivo_NP(_cam);

                        // passando dados da list para o datatable
                        foreach (AtuProcon item in listNP)
                        {
                            string Lido = item.Telefone;
                            if (Lido.Length > 1)
                            {
                                Lido = Lido.Substring(1, 1);
                                if (char.IsNumber(Convert.ToChar(Lido)))
                                {
                                    DataRow dr = DT.NewRow();
                                    dr["ORIGEM"] = "NaoMePerturbe";
                                    dr["UF"] = item.UF; ;
                                    dr["TELEFONE"] = clsFuncoes.RetornaNumero(item.Telefone);
                                    dr["DATA"] = DateTime.Parse(item.DataBloq);
                                    dr["SITUACAO"] = item.Situacao;
                                    dr["ApartirDe"] = DateTime.Parse(item.ApartirDe);
                                    DT.Rows.Add(dr);
                                }
                            }
                        }

                        // incluindo dados da datatable para sql via slqBulkCopy
                        clsVariaveis.GBoolOK = await SqlBulkAsync(DT);

                        listNP.Clear();
                        break;

                    case "ES":
                    case "PR":
                    case "SP":
                        // gerando list a partir do arquivo texto
                        List<AtuProcon> listPR = clsArquivos.Arquivo_PR(_cam);

                        // passando dados da list para o datatable
                        foreach (AtuProcon item in listPR)
                        {
                            string Lido = item.Telefone;
                            Lido = Lido.Substring(1, 1);
                            if (char.IsNumber(Convert.ToChar(Lido)))
                            {
                                if (DateTime.Parse(item.DataBloq) > DateTime.Parse("01/01/2019"))
                                {
                                    DataRow dr = DT.NewRow();
                                    dr["ORIGEM"] = "PROCON";
                                    dr["UF"] = _uf;
                                    dr["TELEFONE"] = clsFuncoes.RetornaNumero(item.Telefone);
                                    dr["DATA"] = DateTime.Parse(item.DataBloq);
                                    dr["SITUACAO"] = item.Situacao;
                                    dr["ApartirDe"] = DateTime.Parse(item.ApartirDe);
                                    DT.Rows.Add(dr);
                                }
                            }
                        }

                        // incluindo dados da datatable para sql via slqBulkCopy
                        clsVariaveis.GBoolOK = await SqlBulkAsync(DT);

                        listPR.Clear();
                        break;

                    //case "RN":
                    //    // gerando list a partir do arquivo texto
                    //    List<AtuProcon> listRN = clsArquivos.Arquivo_RN(_cam);

                    //    // passando dados da list para o datatable
                    //    foreach (AtuProcon item in listRN)
                    //    {
                    //        string Lido = item.Telefone;
                    //        Lido = Lido.Substring(1, 1);
                    //        if (char.IsNumber(Convert.ToChar(Lido)))
                    //        {
                    //            DataRow dr = DT.NewRow();
                    //            dr["ORIGEM"] = "PROCON";
                    //            dr["UF"] = "RN";
                    //            dr["TELEFONE"] = clsFuncoes.RetornaNumero(item.Telefone);
                    //            dr["DATA"] = DateTime.Parse(item.DataBloq);
                    //            dr["ApartirDe"] = DateTime.Parse(item.ApartirDe);
                    //            DT.Rows.Add(dr);
                    //        }
                    //    }

                    //    // incluindo dados da datatable para sql via slqBulkCopy
                    //    clsVariaveis.GBoolOK = await SqlBulkAsync(DT);

                    //    listRN.Clear();
                    //    break;

                    case "RS":
                        // gerando list a partir do arquivo texto
                        List<AtuProcon> listRS = clsArquivos.Arquivo_RS(_cam);

                        // passando dados da list para o datatable
                        foreach (AtuProcon item in listRS)
                        {
                            string Lido = item.DDD;
                            Lido = Lido.Substring(1, 1);
                            if (char.IsNumber(Convert.ToChar(Lido)))
                            {
                                if (DateTime.Parse(item.DataBloq) > DateTime.Parse("01/01/2019"))
                                {
                                    DataRow dr = DT.NewRow();
                                    dr["ORIGEM"] = "PROCON";
                                    dr["UF"] = "RS";
                                    dr["DDD"] = clsFuncoes.RetornaNumero(item.DDD);
                                    dr["FONE"] = clsFuncoes.RetornaNumero(item.Fone);
                                    dr["DATA"] = DateTime.Parse(item.DataBloq);
                                    if (item.ApartirDe != "")
                                    {
                                        dr["ApartirDe"] = DateTime.Parse(item.ApartirDe);
                                    }

                                    DT.Rows.Add(dr);
                                }
                            }
                        }

                        // incluindo dados da datatable para sql via slqBulkCopy
                        clsVariaveis.GBoolOK = await SqlBulkAsync(DT);

                        listRS.Clear();
                        break;

                    case "PB":
                    case "SC":
                        // gerando list a partir do arquivo texto
                        List<AtuProcon> listSC = clsArquivos.Arquivo_SC(_cam);

                        // passando dados da list para o datatable
                        foreach (AtuProcon item in listSC)
                        {
                            string Lido = item.Telefone;
                            if (Lido.Length > 1)
                            {
                                Lido = Lido.Substring(1, 1);
                                if (char.IsNumber(Convert.ToChar(Lido)))
                                {
                                    if (DateTime.Parse(item.DataBloq) > DateTime.Parse("01/01/2019"))
                                    {
                                        DataRow dr = DT.NewRow();
                                        dr["ORIGEM"] = "PROCON";
                                        dr["UF"] = _uf;
                                        dr["TELEFONE"] = clsFuncoes.RetornaNumero(item.Telefone);
                                        dr["DATA"] = DateTime.Parse(item.DataBloq);
                                        DT.Rows.Add(dr);
                                    }
                                }
                            }
                        }

                        // incluindo dados da datatable para sql via slqBulkCopy
                        clsVariaveis.GBoolOK = await SqlBulkAsync(DT);

                        listSC.Clear();
                        break;

                    default:
                        break;
                }
            }
            catch(Exception e)
            {
                MessageBox.Show(e.Message, "Trata Atu Procon", MessageBoxButtons.OK, MessageBoxIcon.Information);
                clsVariaveis.GBoolOK = false;
            }
            finally
            {
                //if (sqlCon.State == ConnectionState.Open) sqlCon.Close();
            }

            if (clsVariaveis.GBoolOK)
            {
                DataTable dtPesq = new DataTable();
                dtPesq = Classes.clsBanco.Consulta("select count(*) qtd from Atu_Procon");
                if (dtPesq.Rows.Count != 0)
                {
                    clsVariaveis.GintImportado = Convert.ToInt32(dtPesq.Rows[0]["qtd"].ToString());
                }
            }

            return clsVariaveis.GBoolOK;
        }


        public static async Task<Boolean> TrataAtuProconAsync(Form _form, string _uf)
        {
            try
            {
                SqlConnection sqlconnection = new SqlConnection();
                sqlCon = sqlconnection;
                sqlCon.ConnectionString = Classes.clsVariaveis.Conexao;
                await sqlCon.OpenAsync();

                switch (_uf)
                {
                    case "MG":
                    case "PB":
                    case "RS":
                        clsVariaveis.GstrSQL = "update Atu_Procon set telefone = ddd + fone where UF = '" + _uf + "' ";
                        clsVariaveis.GBoolOK = clsBanco.ExecuteQuery(clsVariaveis.GstrSQL);
                        break;
                }


                clsVariaveis.GstrSQL = "select * from Atu_Procon where UF = '" + _uf + "' and Obs is null order by id";
                DataTable dtPesq = new DataTable();
                dtPesq = Classes.clsBanco.Consulta(clsVariaveis.GstrSQL);

                if (dtPesq.Rows.Count != 0)
                {
                    //criando progressbar no form
                    ProgressBar pgb1 = new ProgressBar
                    {
                        Name = "pgb1",
                        Left = 86,
                        Top = 243,
                        Width = 486,
                        Minimum = 0,
                        Maximum = dtPesq.Rows.Count,
                        Step = 1
                    };
                    _form.Controls.Add(pgb1);


                    foreach (DataRow item in dtPesq.Rows)
                    {
                        string tst = item["telefone"].ToString();
                        if (tst != "")
                        {
                            string foneValido = clsFuncoes.RetornaNumero(item["telefone"].ToString());

                            clsVariaveis.GStrDDD = "";
                            clsVariaveis.GStrTel = "";

                            switch (foneValido.Length)
                            {
                                case 8:
                                    switch (_uf)
                                    {
                                        case var s1 when new[] { "AL", "MS", "PB", "RN" }.Contains(s1):
                                            clsVariaveis.GStrDDD = clsFuncoes.RetornaDDD(_uf);
                                            clsVariaveis.GStrTel = clsFuncoes.RetornaCelular(clsVariaveis.GStrDDD, foneValido);
                                            break;

                                        default:
                                            break;
                                    }
                                    break;

                                case 10:
                                    clsVariaveis.GStrDDD = foneValido.Substring(0, 2);
                                    clsVariaveis.GStrTel = foneValido.Substring(2);

                                    clsVariaveis.GStrTel = clsFuncoes.RetornaCelular(clsVariaveis.GStrDDD, clsVariaveis.GStrTel);
                                    break;

                                case 11:
                                    clsVariaveis.GStrDDD = foneValido.Substring(0, 2);
                                    clsVariaveis.GStrTel = foneValido.Substring(2);

                                    break;

                                default:
                                    break;
                            }


                            //await Task.Run(() =>
                            //{
                            if (clsVariaveis.GStrTel != "")
                            {
                                clsVariaveis.GstrSQL = "update Atu_Procon set DDD = '" + clsVariaveis.GStrDDD + "' ,Fone = '" + clsVariaveis.GStrTel + "' where ID = " + item["ID"];
                                var cmd = new SqlCommand(clsVariaveis.GstrSQL, sqlCon);
                                await cmd.ExecuteNonQueryAsync();
                            }
                            else
                            {
                                clsVariaveis.GstrSQL = "update Atu_Procon set Obs = 'fone invalido' where ID = " + item["ID"];
                                var cmd = new SqlCommand(clsVariaveis.GstrSQL, sqlCon);
                                await cmd.ExecuteNonQueryAsync();
                            }

                            //});
                        }
                        pgb1.PerformStep();
                    }
                    _form.Controls.Remove(pgb1);
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message, "Trata Atu Procon", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return false;
            }
            finally
            {
                //if (sqlCon.State == ConnectionState.Open) sqlCon.Close();
            }
        }


        public static async Task<string> AtualizaDoNotCallAsync(string _uf)
        {
            string strResp = string.Empty;

            try
            {
                SqlConnection sqlconnection = new SqlConnection();
                sqlCon = sqlconnection;
                sqlCon.ConnectionString = clsVariaveis.Conexao;
                await sqlCon.OpenAsync();

                SqlCommand command = new SqlCommand("[dbo].[sp_Atu_DoNotCall_II]", sqlCon)
                {
                    CommandType = CommandType.StoredProcedure
                };
                command.Parameters.Add(new SqlParameter("@uf", SqlDbType.VarChar)).Value = _uf;

                // usando sincrono para poder esperar o resultado do stored procedure
                //strResp = command.ExecuteScalarAsync().ToString() + " registros incluídos";
                strResp = command.ExecuteScalar().ToString() + " registros incluídos";
            }
            catch(Exception e)
            {
                strResp = "ERRO";
                MessageBox.Show(e.Message, "Atualiza DoNotCall", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            finally
            {
                if (sqlCon.State == ConnectionState.Open) sqlCon.Close();
            }

            return strResp.ToString();
        }


    }
}
