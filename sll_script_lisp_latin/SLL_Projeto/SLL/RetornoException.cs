using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SLL_Projeto.SLL
{
    public class RetornoException : Exception
    {
        public object Valor { get; set; }

        public RetornoException()
        {
        }

        public RetornoException(object valor)
        {
            this.Valor = valor;
        }

    }
}
