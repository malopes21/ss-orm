using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace SLL_Projeto.Util
{
    class StringTokenizer
    {
        private String linha;
        private int posicao = 0;
        private List<String> itens = new List<string>();

        public StringTokenizer(String linha)
        {
            this.linha = linha.Trim();
            char[] seps = { ' ', '\t', '\n', '\r' };
            String[] itensArray = linha.Split(seps);
            foreach (var item in itensArray)
            {
                if(!item.Equals(""))
                {
                    itens.Add(item);
                }
            }
        }

        public bool hasNext()
        {
            if (posicao < itens.Count)
            {
                return true;
            }
            return false;
        }

        public String next()
        {
            String item = itens[posicao];
            posicao++;
            return item;
        }
    }
}
