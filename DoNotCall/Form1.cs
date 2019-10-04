using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Windows.Forms;
using DoNotCall.Classes;


namespace LendoTxt
{
    public partial class Form1 : Form
    {

        public Form1()
        {
            InitializeComponent();

            this.Text = Application.ProductName.ToString() + " ".PadLeft(95) + Application.ProductVersion;

            // preenchendo combo uf
            cboUF.Items.Clear();
            foreach (DataRow item in clsBanco.Consulta("select UF from UF_Ativo where Ativo = 1 order by UF").Rows)
            {
                cboUF.Items.Add(item[0].ToString());
            }
        }


        private void IniciaCampos()
        {
            txtArquivo.Text = "";
            btnImportar.Enabled = true;
            lblImport.Text = "";
            btnAtu.Enabled = false;
            lblAtu.Text = "";
        }


        private void btnLoc_Click(object sender, EventArgs e)
        {
            IniciaCampos();

            String currentPath = Path.GetDirectoryName(System.AppDomain.CurrentDomain.BaseDirectory.ToString()) + @"\" + cboUF.Text;

            openFileDialog.Title = cboUF.Text;
            openFileDialog.InitialDirectory = currentPath;
            openFileDialog.Filter = "All files (*.*)|*.*|All files (*.*)|*.*";
            openFileDialog.FilterIndex = 2;
            openFileDialog.RestoreDirectory = true;
            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                txtArquivo.Text = openFileDialog.FileName;
            }
        }


        private async void btnImportar_Click(object sender, EventArgs e)
        {
            if (txtArquivo.Text != "")
            {
                btnImportar.Enabled = false;
                this.Cursor = Cursors.WaitCursor;
                clsVariaveis.GintImportado = 0;

                clsVariaveis.GBoolOK = false;
                clsVariaveis.GBoolOK = await clsAtuProcon. ImportarArquivoAsync(cboUF.Text, txtArquivo.Text);
                if (clsVariaveis.GBoolOK)
                {                    
                    MessageBox.Show("Importado com sucesso  ", cboUF.Text, MessageBoxButtons.OK, MessageBoxIcon.Information);
                    lblImport.Text = clsVariaveis.GintImportado.ToString() +  " registros importados";
                    btnAtu.Enabled = true;
                }                

                this.Cursor = Cursors.Default;
            }
        }


        private async void btnAtu_Click(object sender, EventArgs e)
        {
            if (clsVariaveis.GintImportado > 0  && cboUF.Text != "NP")
            {
                DialogResult dialogResult = MessageBox.Show("Deseja iniciar o processo ?", btnAtu.Text, MessageBoxButtons.YesNo);
                if (dialogResult == DialogResult.Yes)
                {
                    btnAtu.Enabled = false;
                    this.Cursor = Cursors.WaitCursor;

                    lblAtu.Text = await clsAtuProcon.AtualizaDoNotCallAsync(cboUF.Text);

                    if(lblAtu.Text != "ERRO")
                    {
                        MessageBox.Show("DoNotCall Atualizado com sucesso", cboUF.Text, MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }

                    this.Cursor = Cursors.Default;
                }
            }
        }


        private void cboUF_SelectedIndexChanged(object sender, EventArgs e)
        {
            IniciaCampos();
        }

        private void Form1_Resize(object sender, EventArgs e)
        {
            if (this.WindowState == System.Windows.Forms.FormWindowState.Maximized)
            {
                this.WindowState = System.Windows.Forms.FormWindowState.Normal;
            }
        }
    }
}
