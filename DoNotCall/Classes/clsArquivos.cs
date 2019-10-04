using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using static DoNotCall.Classes.clsAtuProcon;


namespace DoNotCall.Classes
{
    class clsArquivos
    {

        public static List<AtuProcon> Arquivo_AL(string _cam)
        {
            return File.ReadAllLines(_cam)
                    .Select(a => a.Split('|'))
                    .Select(c => new AtuProcon()
                    {
                        Telefone = c[0].Replace('"', ' ').Trim(),
                        DataBloq = c[1].Replace('"', ' ').Trim(),
                    })
                    .ToList();
        }

        public static List<AtuProcon> Arquivo_CE(string _cam)
        {
            return File.ReadAllLines(_cam)
                    .Select(a => a.Split(';'))
                    .Select(c => new AtuProcon()
                    {
                        Telefone = c[0].Replace('"', ' ').Trim(),
                        DataBloq = c[1].Replace('"', ' ').Trim(),
                        Situacao = c[2].Replace('"', ' ').Trim(),
                    })
                    .ToList();
        }

        public static List<AtuProcon> Arquivo_MG(string _cam)
        {
            return File.ReadAllLines(_cam)
                    .Select(a => a.Split(','))
                    .Select(c => new AtuProcon()
                    {
                        DataBloq = c[0].Replace('"', ' ').Trim(),
                        DDD = c[1].Replace('"', ' ').Trim(),
                        Telefone = c[2].Replace('"', ' ').Trim(),
                    })
                    .ToList();
        }

        public static List<AtuProcon> Arquivo_MS(string _cam)
        {
            return File.ReadAllLines(_cam)
                    .Select(a => a.Split(';'))
                    .Select(c => new AtuProcon()
                    {
                        Nome = c[0].Replace('"', ' ').Trim(),
                        Telefone = c[3].Replace('"', ' ').Trim(),
                        DataBloq = c[5].Replace('"', ' ').Trim(),
                        ApartirDe = c[8].Replace('"', ' ').Trim(),
                        Situacao = c[11].Replace('"', ' ').Trim(),
                    })
                    .ToList();
        }

        public static List<AtuProcon> Arquivo_NP(string _cam)
        {
            return File.ReadAllLines(_cam)
                    .Select(a => a.Split(';'))
                    .Select(c => new AtuProcon()
                    {
                        Telefone = c[0].Replace('"', ' ').Trim(),
                        DataBloq = c[1].Replace('"', ' ').Trim(),
                        Situacao = c[2].Replace('"', ' ').Trim(),
                        ApartirDe = c[3].Replace('"', ' ').Trim(),
                        //uf = c[4].Replace('"', ' ').Trim(),
                    })
                    .ToList();
        }

        public static List<AtuProcon> Arquivo_PR(string _cam)
        {
            return File.ReadAllLines(_cam)
                    .Select(a => a.Split(';'))
                    .Select(c => new AtuProcon()
                    {
                        Telefone = c[0].Replace('"', ' ').Trim(),
                        DataBloq = c[1].Replace('"', ' ').Trim(),
                        Situacao = c[2].Replace('"', ' ').Trim(),
                        ApartirDe = c[3].Replace('"', ' ').Trim(),
                    })
                    .ToList();
        }

        public static List<AtuProcon> Arquivo_RN(string _cam)
        {
            return File.ReadAllLines(_cam)
                    .Select(a => a.Split(';'))
                    .Select(c => new AtuProcon()
                    {
                        Telefone = c[1].Replace('"', ' ').Trim(),
                        DataBloq = c[2].Replace('"', ' ').Trim(),
                        ApartirDe = c[4].Replace('"', ' ').Trim(),
                    })
                    .ToList();
        }

        public static List<AtuProcon> Arquivo_RS(string _cam)
        {
            return File.ReadAllLines(_cam)
                    .Select(a => a.Split(';'))
                    .Select(c => new AtuProcon()
                    {
                        DDD = c[0].Replace('"', ' ').Trim(),
                        Fone = c[1].Replace('"', ' ').Trim(),
                        DataBloq = c[2].Replace('"', ' ').Trim(),
                        ApartirDe = c[3].Replace('"', ' ').Trim(),
                    })
                    .ToList();
        }

        public static List<AtuProcon> Arquivo_SC(string _cam)
        {
            return File.ReadAllLines(_cam)
                    .Select(a => a.Split(','))
                    .Select(c => new AtuProcon()
                    {
                        Telefone = c[0].Replace('"', ' ').Trim(),
                        DataBloq = c[1].Replace('"', ' ').Trim(),
                    })
                    .ToList();
        }


    }
}
