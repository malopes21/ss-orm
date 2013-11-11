using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SLL_Projeto.SLL
{
    class TabelasEstaticas
    {
        private static List<String> palavrasReservadas = new List<String>();
        private static List<String> delimitadores = new List<String>();
        private static List<String> opAritmeticos = new List<String>();
        private static List<String> opRelacionais = new List<String>();
        private static List<String> cteLiteralBool = new List<String>();

        static TabelasEstaticas()
        {
            palavrasReservadas.Add("totum"); //integer
            palavrasReservadas.Add("verus"); //real
            palavrasReservadas.Add("chorda"); //string
            palavrasReservadas.Add("vacum"); //void
            palavrasReservadas.Add("mus"); //boolean

            palavrasReservadas.Add("reditus"); //return
            palavrasReservadas.Add("autem"); //while
            palavrasReservadas.Add("si"); //if
            
            palavrasReservadas.Add("noto"); //write
            palavrasReservadas.Add("lego"); //read

            cteLiteralBool.Add("falsum"); //false
            cteLiteralBool.Add("verum"); //true

            delimitadores.Add("(");
            delimitadores.Add(")");
            delimitadores.Add("[");
            delimitadores.Add("]");
            delimitadores.Add("="); //atribuição

            opAritmeticos.Add("+");
            opAritmeticos.Add("-");
            opAritmeticos.Add("*");
            opAritmeticos.Add("/");
            opAritmeticos.Add("&"); //concatenação

            opRelacionais.Add(">");
            opRelacionais.Add(">=");
            opRelacionais.Add("<");
            opRelacionais.Add("<=");
            opRelacionais.Add("==");

        }

        public static bool EhPalavraReservada(String lexema)
        {
            return palavrasReservadas.Contains(lexema);
        }

        public static bool EhDelimitador(String lexema)
        {
            return delimitadores.Contains(lexema);
        }

        public static bool EhOperadorAritmetico(String lexema)
        {
            return opAritmeticos.Contains(lexema);
        }

        public static bool EhOperadorRelacional(String lexema)
        {
            return opRelacionais.Contains(lexema);
        }

        public static bool EhCteLiteralBool(String lexema)
        {
            return cteLiteralBool.Contains(lexema);
        }

    }
}
