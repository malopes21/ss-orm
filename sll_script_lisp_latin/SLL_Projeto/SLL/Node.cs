using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SLL_Projeto.SLL
{
    class Node
    {
        public Node Pai { get; set; }
        private List<Node> filhos = new List<Node>();
        public List<Node> Filhos { 
            get { return filhos; }
            set { filhos = value; }
        }
        public TipoNode Tipo { get; set; }
        public Token Token {get; set; }

        public Node(TipoNode tipo)
        {
            this.Tipo = tipo;
        }

        public Node(Token token)
        {
            this.Token = token;
            this.Tipo = TipoNode.Token;
        }

        public void AddFilho(Node filho)
        {
            if(filho != null)
            {
                filho.Pai = this;
                Filhos.Add(filho);
            }
        }

        public Node GetFilho(int indice)
        {
            return Filhos[indice];
        }

        public override string ToString()
        {
            if(Tipo == TipoNode.Token)
            {
                return Token.Imagem;
            }
            else
            {
                return Tipo.ToString();
            }
            
        }
    }
}
