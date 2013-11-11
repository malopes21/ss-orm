using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SLL_Projeto.SLL
{
    class Token
    {
        public string Imagem { get; set; }
        public ClasseToken Classe { get; set; }
        public int Indice { get; set; }
        public int Linha { get; set; }
        public int Coluna { get; set; }

        public Token()
        {
        }

        public Token(String imagem, ClasseToken classe, int indice, int linha, int coluna)
        {
            this.Imagem = imagem;
            this.Classe = classe;
            this.Indice = indice;
            this.Linha = linha;
            this.Coluna = coluna;
        }

        public override string ToString()
        {
            return Imagem + " " + Classe + " " + Indice + " " + Linha;
        }

        public override bool Equals(object obj)
        {
            if (this == obj)
                return true;
            if (obj == null)
                return false;

            if (GetType() != obj.GetType())
                return false;
            Token other = (Token)obj;
            if (Classe != other.Classe)
                return false;
            if (Imagem != other.Imagem)
                return false;
            return true;
        }

        public override int GetHashCode()
        {
            int prime = 31;
            int result = 1;
            result = prime * result + Classe.GetHashCode();
            result = prime * result + Imagem.GetHashCode();
            return result;
        }
    }
}
