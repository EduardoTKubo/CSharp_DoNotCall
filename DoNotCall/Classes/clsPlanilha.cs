using Spire.Xls;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace DoNotCall.Classes
{
    class clsPlanilha
    {
        private static SqlConnection sqlCon;
        private static DataTable DtXls = null;

 
        public static async Task<bool> LePlanilhaAsync(string _cam, string _uf)
        {
            // lendo planilha ,importar para [Fech_01] ,devolver datatable
            try
            {
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


                Workbook wkb = new Workbook();
                wkb.LoadFromFile(_cam);                      // abre arquivo .xlsx

                Worksheet wksh = wkb.Worksheets[0];          // lendo aba e gerando um datatable Dt
                DtXls = wksh.ExportDataTable();


                // inclui o datatable em Atu_Procon, via sqlbulk 
                switch (_uf)
                {
                    case "CE":
                        // gerando Dt2 a partir de Dt ,para tratamento de campos.
                        foreach (DataRow item in DtXls.Rows)
                        {
                            if (item["Numero"].ToString() != "Numero")
                            {
                                if (DateTime.Parse(item["A partir de:"].ToString()) > DateTime.Parse("01/01/2019"))
                                {
                                    DataRow dr = DT.NewRow();
                                    dr["ORIGEM"] = "PROCON";
                                    dr["UF"] = "CE";
                                    dr["TELEFONE"] = clsFuncoes.RetornaNumero(item["Numero"].ToString());
                                    dr["DATA"] = DateTime.Parse(item["A partir de:"].ToString());
                                    dr["SITUACAO"] = item["Status"].ToString();
                                    dr["APARTIRDE"] = DateTime.Parse(item["A partir de:"].ToString());
                                    DT.Rows.Add(dr);
                                }
                            }
                        }
                        break;

                    case "MS":// gerando Dt2 a partir de Dt ,para tratamento de campos.
                        foreach (DataRow item in DtXls.Rows)
                        {
                            if (item["Telefone:"].ToString() != "Telefone:")
                            {
                                if (item["Telefone:"].ToString() != "")
                                {
                                    string Lido = item["Telefone:"].ToString();
                                    Lido = Lido.Substring(1, 1);
                                    if (char.IsNumber(Convert.ToChar(Lido)))
                                    {
                                        if (DateTime.Parse(item["Cadastrado em:"].ToString()) > DateTime.Parse("01/01/2019"))
                                        {
                                            DataRow dr = DT.NewRow();
                                            dr["ORIGEM"] = "PROCON";
                                            dr["UF"] = "MS";
                                            dr["NOME"] = item["Nome / Razão Social:"];
                                            dr["TELEFONE"] = clsFuncoes.RetornaNumero(item["Telefone:"].ToString());
                                            dr["DATA"] = DateTime.Parse(item["Cadastrado em:"].ToString());
                                            dr["ApartirDe"] = DateTime.Parse(item["Bloqueado em:"].ToString());
                                            dr["SITUACAO"] = item["Situação:"].ToString();
                                            DT.Rows.Add(dr);
                                        }
                                    }
                                }
                            }
                        }
                        break;

                    case "RN":// gerando Dt2 a partir de Dt ,para tratamento de campos.
                        foreach (DataRow item in DtXls.Rows)
                        {
                            if (item["Telefone (DDD/Numero)"].ToString() != "Telefone (DDD/Numero)")
                            {
                                if (DateTime.Parse(item["Data Ativação"].ToString()) > DateTime.Parse("01/01/2019"))
                                {
                                    DataRow dr = DT.NewRow();
                                    dr["ORIGEM"] = "PROCON";
                                    dr["UF"] = "RN";
                                    dr["NOME"] = item["Nome"];
                                    dr["TELEFONE"] = clsFuncoes.RetornaNumero(item["Telefone (DDD/Numero)"].ToString());
                                    dr["DATA"] = DateTime.Parse(item["Data Ativação"].ToString());
                                    dr["ApartirDe"] = DateTime.Parse(item["Dt.Lim.Recebimento Chamada"].ToString());
                                    DT.Rows.Add(dr);
                                }
                            }
                        }
                        break;
                }
                clsVariaveis.GBoolOK = await SqlBulkAsync(DT, _uf);
            }
            catch (System.Exception e)
            {
                MessageBox.Show(e.Message, "Lendo planilha", MessageBoxButtons.OK, MessageBoxIcon.Information);
                clsVariaveis.GBoolOK = false;
            }
            finally
            {
                //if (sqlCon.State == ConnectionState.Open) sqlCon.Close();
            }
            return clsVariaveis.GBoolOK;
        }


        public static async Task<bool> SqlBulkAsync(DataTable _dt, string _uf)
        {
            try
            {
                // incluindo dados da datatable para sql via slqBulkCopy
                using (SqlBulkCopy s = new SqlBulkCopy(Classes.clsVariaveis.Conexao))
                {
                    s.BatchSize = 1000;
                    s.NotifyAfter = 5000;

                    switch (_uf)
                    {
                        case "CE":
                        case "MS":
                            s.DestinationTableName = "Atu_Procon";
                            s.ColumnMappings.Add("ORIGEM", "ORIGEM");       // ORIGEM  DESTINO
                            s.ColumnMappings.Add("UF", "UF");
                            s.ColumnMappings.Add("TELEFONE", "TELEFONE");
                            s.ColumnMappings.Add("DATA", "DATA");
                            s.ColumnMappings.Add("SITUACAO", "SITUACAO");
                            s.ColumnMappings.Add("APARTIRDE", "APARTIRDE");
                            await s.WriteToServerAsync(_dt);

                            break;

                        case "RN":
                            s.DestinationTableName = "Atu_Procon";
                            s.ColumnMappings.Add("ORIGEM", "ORIGEM");       // ORIGEM  DESTINO
                            s.ColumnMappings.Add("UF", "UF");
                            s.ColumnMappings.Add("TELEFONE", "TELEFONE");
                            s.ColumnMappings.Add("DATA", "DATA");
                            s.ColumnMappings.Add("APARTIRDE", "APARTIRDE");
                            await s.WriteToServerAsync(_dt);

                            break;
                    }
                }
                return true;
            }
            catch (Exception eb)
            {
                MessageBox.Show(eb.Message, "sql bulk", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return false;
            }
        }


    }
}
