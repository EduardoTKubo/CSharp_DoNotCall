using System;

namespace DoNotCall.Classes
{
    class clsVariaveis
    {
        // SRV_DB03
        private static string conexao = @"Data Source=10.0.32.63;Initial Catalog=PROCON; User ID=sa; Password=SRV@admin2012;";

        public static string Conexao
        {
            get { return clsVariaveis.conexao; }
        }


        private static string gstrSQL = string.Empty;
        public static string GstrSQL
        {
            get { return clsVariaveis.gstrSQL; }
            set { clsVariaveis.gstrSQL = value; }
        }

        private static string gUFLido = string.Empty;
        public static string GUFLido
        {
            get { return clsVariaveis.gUFLido; }
            set { clsVariaveis.gUFLido = value; }
        }

        private static int gContador = 0;
        public static int GContador
        {
            get { return clsVariaveis.gContador; }
            set { clsVariaveis.gContador = value; }
        }

        private static Boolean gBoolOK = false;
        public static Boolean GBoolOK
        {
            get { return clsVariaveis.gBoolOK; }
            set { clsVariaveis.gBoolOK = value; }
        }

        private static string gStrDDD = "";
        public static string GStrDDD
        {
            get { return clsVariaveis.gStrDDD; }
            set { clsVariaveis.gStrDDD = value; }
        }


        private static string gStrTel = "";
        public static string GStrTel
        {
            get { return clsVariaveis.gStrTel; }
            set { clsVariaveis.gStrTel = value; }
        }

        private static int gintImportado = 0;
        public static int GintImportado
        {
            get { return clsVariaveis.gintImportado; }
            set { clsVariaveis.gintImportado = value; }
        }

    }
}
