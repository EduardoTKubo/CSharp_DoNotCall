namespace LendoTxt
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.openFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.cboUF = new System.Windows.Forms.ComboBox();
            this.btnLoc = new System.Windows.Forms.Button();
            this.txtArquivo = new System.Windows.Forms.TextBox();
            this.btnImportar = new System.Windows.Forms.Button();
            this.lblImport = new System.Windows.Forms.Label();
            this.btnTrataTxt = new System.Windows.Forms.Button();
            this.lblAtu = new System.Windows.Forms.Label();
            this.btnAtu = new System.Windows.Forms.Button();
            this.progressBar1 = new System.Windows.Forms.ProgressBar();
            this.SuspendLayout();
            // 
            // openFileDialog
            // 
            this.openFileDialog.FileName = "openFileDialog";
            // 
            // cboUF
            // 
            this.cboUF.FormattingEnabled = true;
            this.cboUF.Location = new System.Drawing.Point(40, 28);
            this.cboUF.Name = "cboUF";
            this.cboUF.Size = new System.Drawing.Size(63, 21);
            this.cboUF.TabIndex = 0;
            this.cboUF.SelectedIndexChanged += new System.EventHandler(this.cboUF_SelectedIndexChanged);
            // 
            // btnLoc
            // 
            this.btnLoc.Location = new System.Drawing.Point(119, 26);
            this.btnLoc.Name = "btnLoc";
            this.btnLoc.Size = new System.Drawing.Size(86, 23);
            this.btnLoc.TabIndex = 1;
            this.btnLoc.Text = "Localizar";
            this.btnLoc.UseVisualStyleBackColor = true;
            this.btnLoc.Click += new System.EventHandler(this.btnLoc_Click);
            // 
            // txtArquivo
            // 
            this.txtArquivo.Location = new System.Drawing.Point(40, 69);
            this.txtArquivo.Name = "txtArquivo";
            this.txtArquivo.Size = new System.Drawing.Size(532, 20);
            this.txtArquivo.TabIndex = 2;
            // 
            // btnImportar
            // 
            this.btnImportar.Location = new System.Drawing.Point(86, 106);
            this.btnImportar.Name = "btnImportar";
            this.btnImportar.Size = new System.Drawing.Size(119, 23);
            this.btnImportar.TabIndex = 3;
            this.btnImportar.Text = "Importar";
            this.btnImportar.UseVisualStyleBackColor = true;
            this.btnImportar.Click += new System.EventHandler(this.btnImportar_Click);
            // 
            // lblImport
            // 
            this.lblImport.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.lblImport.Location = new System.Drawing.Point(231, 111);
            this.lblImport.Name = "lblImport";
            this.lblImport.Size = new System.Drawing.Size(341, 18);
            this.lblImport.TabIndex = 5;
            // 
            // btnTrataTxt
            // 
            this.btnTrataTxt.Enabled = false;
            this.btnTrataTxt.Location = new System.Drawing.Point(625, 155);
            this.btnTrataTxt.Name = "btnTrataTxt";
            this.btnTrataTxt.Size = new System.Drawing.Size(119, 23);
            this.btnTrataTxt.TabIndex = 6;
            this.btnTrataTxt.Text = "Trata .txt";
            this.btnTrataTxt.UseVisualStyleBackColor = true;
            // 
            // lblAtu
            // 
            this.lblAtu.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.lblAtu.Location = new System.Drawing.Point(231, 155);
            this.lblAtu.Name = "lblAtu";
            this.lblAtu.Size = new System.Drawing.Size(341, 18);
            this.lblAtu.TabIndex = 7;
            // 
            // btnAtu
            // 
            this.btnAtu.Enabled = false;
            this.btnAtu.Location = new System.Drawing.Point(86, 150);
            this.btnAtu.Name = "btnAtu";
            this.btnAtu.Size = new System.Drawing.Size(119, 23);
            this.btnAtu.TabIndex = 8;
            this.btnAtu.Text = "Atualiza PROCON";
            this.btnAtu.UseVisualStyleBackColor = true;
            this.btnAtu.Click += new System.EventHandler(this.btnAtu_Click);
            // 
            // progressBar1
            // 
            this.progressBar1.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.progressBar1.Location = new System.Drawing.Point(86, 197);
            this.progressBar1.Name = "progressBar1";
            this.progressBar1.Size = new System.Drawing.Size(486, 23);
            this.progressBar1.TabIndex = 4;
            this.progressBar1.Visible = false;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Silver;
            this.ClientSize = new System.Drawing.Size(593, 245);
            this.Controls.Add(this.progressBar1);
            this.Controls.Add(this.btnAtu);
            this.Controls.Add(this.lblAtu);
            this.Controls.Add(this.btnTrataTxt);
            this.Controls.Add(this.lblImport);
            this.Controls.Add(this.btnImportar);
            this.Controls.Add(this.txtArquivo);
            this.Controls.Add(this.btnLoc);
            this.Controls.Add(this.cboUF);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "DoNotCall";
            this.Resize += new System.EventHandler(this.Form1_Resize);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.OpenFileDialog openFileDialog;
        private System.Windows.Forms.ComboBox cboUF;
        private System.Windows.Forms.Button btnLoc;
        private System.Windows.Forms.TextBox txtArquivo;
        private System.Windows.Forms.Button btnImportar;
        private System.Windows.Forms.Label lblImport;
        private System.Windows.Forms.Button btnTrataTxt;
        private System.Windows.Forms.Label lblAtu;
        private System.Windows.Forms.Button btnAtu;
        private System.Windows.Forms.ProgressBar progressBar1;
    }
}

