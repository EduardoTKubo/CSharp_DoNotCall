using System;
using System.Linq;
using System.Text.RegularExpressions;


namespace DoNotCall.Classes
{
    class clsFuncoes
    {

        public static string MontaInsert(string _strDado, string _strTipo)
        {
            if (_strDado == "")
            {
                return " NULL ";
            }
            else
            {
                if (_strTipo == "TEXT")
                {
                    if (_strDado == "  /")
                    {
                        return " NULL ";
                    }
                    else
                    {
                        return " '" + _strDado.Trim().ToUpper() + "' ";
                    }
                }
                else if (_strTipo == "EMAIL")
                {
                    return " '" + _strDado.Trim().ToLower() + "' ";
                }
                else if (_strTipo == "INT")
                {
                    return " " + _strDado + " ";
                }
                else if (_strTipo == "REAL")
                {
                    _strDado = _strDado.Replace(".", "");
                    _strDado = _strDado.Replace(",", ".");
                    return " " + _strDado + " ";
                }
                else if (_strTipo == "DATE")
                {
                    if (_strDado == "  /  /")
                    {
                        return " NULL ";
                    }
                    else
                    {
                        return " '" + Convert.ToDateTime(_strDado).ToString("yyyy-MM-dd") + "' ";
                    }
                }
                else if (_strTipo == "BOO")
                {
                    if (_strDado == "True")
                    {
                        return " 1 ";
                    }
                    else
                    {
                        return " 0 ";
                    }
                }
                else
                {
                    return " NULL ";
                }
            }
        }


        public static string MontaUpdate(string _strcampo, string _strDado, string _strTipo)
        {
            if (_strDado == "")
            {
                return _strcampo + " = NULL ";
            }
            else
            {
                if (_strTipo == "TEXT")
                {
                    if (_strDado == "  /  /")
                    {
                        return _strcampo + " = NULL ";
                    }
                    else if (_strDado == "  /")
                    {
                        return _strcampo + " = NULL ";
                    }
                    else
                    {
                        return _strcampo + " = '" + _strDado.Trim().ToUpper() + "' ";
                    }
                }
                else if (_strTipo == "INT")
                {
                    return _strcampo + " = " + _strDado + " ";
                }
                else if (_strTipo == "REAL")
                {
                    _strDado = _strDado.Replace(".", "");
                    _strDado = _strDado.Replace(",", ".");
                    return _strcampo + " = " + _strDado + " ";
                }
                else if (_strTipo == "EMAIL")
                {
                    return _strcampo + " = '" + _strDado.Trim().ToLower() + "' ";
                }
                else if (_strTipo == "BOO")
                {
                    if (_strDado == "True")
                    {
                        return _strcampo + " = 1 ";
                    }
                    else
                    {
                        return _strcampo + " = 0 ";
                    }
                }
                else if (_strTipo == "DATE")
                {
                    if (_strDado == "  /  /")
                    {
                        return _strcampo + " = NULL ";
                    }
                    else
                    {
                        return _strcampo + " = '" + Convert.ToDateTime(_strDado).ToString("yyyy-MM-dd") + "' ";
                    }
                }
                else
                {
                    return _strcampo + " = NULL ";
                }
            }
        }

        public static string RetornaDDD ( string _uf)
        {
            string result = "";

            switch (_uf)
            {
                case "AL":
                    result = "82";
                    break;
                case "MS":
                    result = "67";
                    break;
                case "PB":
                    result = "83";
                    break;
                case "RN":
                    result = "84";
                    break;
                default:
                    break;
            }

            return result;
        }

        public static string RetornaCelular(string _ddd, string _fone)
        {
            string result = _fone;

            if (result.Length == 8)
            {
                switch (_ddd)
                {
                    case var s when new[] { "11", "12", "13", "14", "15", "16", "17", "18", "19", "21", "22", "24", "27", "28", "31", "32", "33", "34", "35", "37", "38", "41", "42", "43", "44", "45", "46", "47", "48", "49", "51", "53", "54", "55", "61", "62", "63", "64", "65", "66", "67", "68", "69", "71", "73", "74", "75", "77", "79", "81", "82", "83", "84", "85", "86", "87", "88", "89", "91", "92", "93", "94", "95", "96", "97", "98", "99" }.Contains(s):

                        switch (_fone.Substring(0, 1))
                        {
                            case var s1 when new[] { "6", "7", "8", "9" }.Contains(s1):
                                result = "9" + result;
                                break;

                            default:
                                break;
                        }

                        break;

                    default:
                        break;
                }
            }            

            return result;
        }


        public static string RetornaNumero(string _texto)
        {
            Regex r = new Regex(@"\d+");

            string result = "";

            foreach (Match m in r.Matches(_texto))
            {
                result += m.Value;
            }

            if(result != "")
            {
                Double i = 0;
                i = Convert.ToDouble(result);

                result = i.ToString();
            }
            else
            {
                result = "0";
            }

            return result;
        }


    }
}
