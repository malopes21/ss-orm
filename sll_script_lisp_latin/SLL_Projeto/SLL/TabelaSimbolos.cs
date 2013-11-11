using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SLL_Projeto.SLL
{
    class TabelaSimbolos
    {

        private static List<Simbolo> simbolos = new List<Simbolo>();

        public static void addSimbolo(Token token, String escopo)
        {
            Simbolo simboloBuscado = getSimbolo(token, escopo);
            if (simboloBuscado == null)
            {
                Simbolo simboloNovo = new Simbolo(token, escopo);
                simbolos.Add(simboloNovo);
                token.Indice = simbolos.IndexOf(simboloNovo);
            }
            else
            {
                token.Indice = simbolos.IndexOf(simboloBuscado);
            }
        }

        private static Simbolo getSimbolo(Token token, string escopo)
        {
            foreach(Simbolo simb in simbolos)
            {
                if(simb.Token.Imagem.Equals(token.Imagem) && simb.Escopo.Equals(escopo)) 
                {
                    return simb;
                }
            }
            return null;
        }

        /// <summary>
        /// usado pela Analisador Semantico
        /// </summary>
        public static String getTipo(Token tok)
        {
            if (tok.Classe == ClasseToken.Identificador)
            {
                return simbolos[tok.Indice].Tipo;
            }
            else if(tok.Classe == ClasseToken.ConstanteLiteralInteira)
            {
                return "totum";
            }
            else if (tok.Classe == ClasseToken.ConstanteLiteralReal)
            {
                return "verus";
            }
            else if (tok.Classe == ClasseToken.ConstanteLiteralString)
            {
                return "chorda";
            }
            else if (tok.Classe == ClasseToken.ConstanteLiteralBooleana)
            {
                return "mus";
            }
            else
            {
                throw new Exception("Erro de tipagem de dados!");
            }

        }

        public static String getTipoDef(String defImagem)
        {
            foreach(Simbolo simb in simbolos)
            {
                if(defImagem.Equals(simb.Token.Imagem) &&  defImagem.Equals(simb.Escopo))
                {
                    return simb.Tipo;
                }
            }
            return null;
        }

        public static void setParams(Token id, List<Token> parametros)
        {
            simbolos[id.Indice].Params = parametros;
        }

        public static List<Token> getParams(Token id)
        {
            return getSimbolo(id, id.Imagem).Params;
        }

        public static List<Token> getVarsLocal(Token id)
        {
            List<Token> varsLocal = new List<Token>();
            foreach (Simbolo simb in simbolos)
            {
                if(simb.Escopo.Equals(id.Imagem))
                {
                    varsLocal.Add(simb.Token);
                }
            }
            return varsLocal;
        }

        /// <summary>
        /// usado pelo Analisador Semantico
        /// </summary>
        public static void setTipo(Token tok, String tipo)
        {
            simbolos[tok.Indice].Tipo = tipo;
        }

        public static void MostraSimbolos()
        {
            foreach (Simbolo simb in simbolos)
            {
                Console.WriteLine(simbolos.IndexOf(simb) + " " + simb);
            }
        }


        public static void GerarValoresPadrao()
        {
            foreach (Simbolo simb in simbolos)
            {
                if("totum".Equals(simb.Tipo))
                {
                    simb.ValorPadrao = new Int64();
                }
                else if ("verus".Equals(simb.Tipo))
                {
                    simb.ValorPadrao = new Double();
                }
                else if ("chorda".Equals(simb.Tipo))
                {
                    simb.ValorPadrao = "";
                }
                else if ("mus".Equals(simb.Tipo))
                {
                    simb.ValorPadrao = new Boolean();
                }
            }
        }

        public static object getValorPadrao(Token tok)
        {
            return simbolos[tok.Indice].ValorPadrao;
        }
    }
}
