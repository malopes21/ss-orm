using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SLL_Projeto.SLL
{
    class Simbolo
    {
        public Token Token { get; set; }
        public String Escopo { get; set; }
        public String Tipo { get; set; }
        public List<Token> Params { get; set; }
        public object ValorPadrao { get; set; }

        public Simbolo()
        {
        }

        public Simbolo(Token token)
        {
            this.Token = token;
        }

        public Simbolo(Token token, String escopo)
        {
            this.Token = token;
            this.Escopo = escopo;
        }

        public override string ToString()
        {
            return Token.Imagem + " " + Escopo + " " + Tipo;
        }
     }


}
