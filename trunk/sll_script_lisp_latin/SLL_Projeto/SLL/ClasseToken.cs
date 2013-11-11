using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SLL_Projeto.SLL
{
    enum ClasseToken
    {
        Identificador, 
        PalavraReservada,
        Delimitador,
        ConstanteLiteralInteira,
        ConstanteLiteralReal,
        ConstanteLiteralString,
        ConstanteLiteralBooleana,
        OperadorAritmetico,
        OperadorRelacional,
        OperadorLogico,
        MarcadorFinalCadeia
    }
}
