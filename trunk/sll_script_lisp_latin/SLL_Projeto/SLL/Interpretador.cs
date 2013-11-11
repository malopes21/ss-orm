using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SLL_Projeto.Util;

namespace SLL_Projeto.SLL
{


    class Interpretador
    {
        public Node Raiz { get; set; }
        private Dictionary<string, Node> defs = new Dictionary<string, Node>();
        private Stack<Dictionary<Token, object>> stack = new Stack<Dictionary<Token, object>>();
        private Node main;
        public String EscopoAtual { get; set; }
        //para Memoization
        public bool Memoization { get; set; }
        public Dictionary<CallDef, object> memoTab = new Dictionary<CallDef, object>();
        //para Memoization

        public Interpretador(Node raiz, string[] args)
        {
            this.Raiz = raiz;
        }

        public void Executar()
        {
            TabelaSimbolos.GerarValoresPadrao();
            PreencheDefs(Raiz);
            if (defs.Count > 0)
            {
                Dictionary<Token, object> frame = new Dictionary<Token, object>();
                List<Token> parametros = TabelaSimbolos.getParams(main.GetFilho(2).Token);
                foreach (Token tok in parametros)
                {
                    frame.Add(tok, TabelaSimbolos.getValorPadrao(tok)); //os valores dos parêmetros do lançador vem do ambiente 
                }
                stack.Push(frame);
                try
                {
                    EscopoAtual = TabelaSimbolos.getTipo(main.GetFilho(2).Token);
                    Executar(main);
                }
                catch (RetornoException rex)
                {
                    Log.println("Terminou no RetornoException: " + rex.Valor, Level.DEBUG);
                }
                finally
                {
                    stack.Pop();
                }
                
            }

        }

        private void PreencheDefs(Node no)
        {
            if (no.Filhos.Count == 2)
            {
                String idDef = no.GetFilho(0).GetFilho(2).Token.Imagem; //pega o nome da Função
                defs.Add(idDef, no.GetFilho(0));
                main = no.GetFilho(0);  //pega o ultimo na sequencia recursiva - será o lançador
                PreencheDefs(no.GetFilho(1));
            }
        }

        private Object Executar(Node no)
        {
            switch (no.Tipo)
            {
                case TipoNode.Def:
                    return Def(no);

                case TipoNode.List_Coman:
                    return List_Coman(no);

                case TipoNode.Coman:
                    return Coman(no);

                case TipoNode.Coman_Interno:
                    return Coman_Interno(no);

                case TipoNode.Atrib:
                    return Atrib(no);

                case TipoNode.Expr_Atrib:
                    return Expr_Atrib(no);

                case TipoNode.Operan:
                    return Operan(no);

                case TipoNode.Expr_Atrib_Interna:
                    return Expr_Atrib_Interna(no);

                case TipoNode.Cond:
                    return Cond(no);

                case TipoNode.Senao:
                    return Senao(no);

                case TipoNode.Expr_Rel:
                    return Expr_Rel(no);

                case TipoNode.Laco:
                    return Laco(no);

                case TipoNode.Entrada:
                    return Entrada(no);

                case TipoNode.Saida:
                    return Saida(no);

                case TipoNode.Retorno:
                    return Retorno(no);

                case TipoNode.Chamada:
                    return Chamada(no);

                case TipoNode.List_Arg:
                    return List_Arg(no);

                case TipoNode.Expr_Ret:
                    return Expr_Ret(no);

                case TipoNode.Decl:
                    return null;

                default:
                    Console.WriteLine("Operação não existente: " + no.Tipo);
                    break;
            }
            return null;
        }

      

        /// <summary>
        /// <Def> ::=  '(' <Tipo> Identifier '[' <List_Param> ']' <List_Coman> ')' 
        /// </summary>
        private object Def(Node no)
        {
            List<Token> varsLocal = TabelaSimbolos.getVarsLocal(no.GetFilho(2).Token);
            Dictionary<Token, object> frame = stack.Peek();
            foreach (Token tok in varsLocal)
            {
                if (!frame.ContainsKey(tok))
                {
                    frame.Add(tok, TabelaSimbolos.getValorPadrao(tok));
                }

            }

            Executar(no.GetFilho(6));
            return null;
        }

        /// <summary>
        /// <List_Coman> ::= <Coman> <List_Coman> |  
        /// </summary>
        private object List_Coman(Node no)
        {
            if (no.Filhos.Count == 2)
            {
                Executar(no.GetFilho(0));
                Executar(no.GetFilho(1));
            }
            return null;
        }


        /// <summary>
        /// <Coman> ::= '(' <Coman_Interno> ')' 
        /// </summary>
        private object Coman(Node no)
        {
            return Executar(no.GetFilho(1));
        }

        /// <summary>
        /// <Coman_Interno> ::= <Decl> | <Atrib> | <Cond> | <Laco> | <Entrada> | <Saida> | <Chamada> | <Retorno> | <List_Coman>       
        /// </summary>
        private object Coman_Interno(Node no)
        {
            return Executar(no.GetFilho(0));
        }

        /// <summary>
        /// <Atrib> ::= '=' Identifier <Expr_Atrib>       
        /// </summary>
        private object Atrib(Node no)
        {
            Token tok = no.GetFilho(1).Token;
            object valorExprAtrib = Executar(no.GetFilho(2));
            setValor(tok, valorExprAtrib);
            return null;
        }

        /// <summary>
        /// <Expr_Atrib> ::= <Operan> | '(' <Expr_Atrib_Interna> ')'
        /// </summary>
        private object Expr_Atrib(Node no)
        {
            if (no.Filhos.Count == 1)
            {
                return Executar(no.GetFilho(0));
            }
            else
            {
                return Executar(no.GetFilho(1));
            }
        }

        /// <summary>
        /// <Operan> ::= Identifier | IntegerLiteral | RealLiteral | StringLiteral | BoolLiteral  
        /// </summary>
        private object Operan(Node no)
        {
            Token operan = no.GetFilho(0).Token;
            if (operan.Classe == ClasseToken.Identificador)
            {
                return getValor(operan);
            }
            else if (operan.Classe == ClasseToken.ConstanteLiteralInteira)
            {
                return Int64.Parse(operan.Imagem);
            }
            else if (operan.Classe == ClasseToken.ConstanteLiteralReal)
            {
                return Double.Parse(operan.Imagem.Replace(".", ","));
            }
            else if (operan.Classe == ClasseToken.ConstanteLiteralBooleana)
            {
                if (operan.Imagem.Equals("verum"))
                {
                    return true;
                }
                else if (operan.Imagem.Equals("falsum"))
                {
                    return false;
                }
            }
            else if (operan.Classe == ClasseToken.ConstanteLiteralString)
            {
                return operan.Imagem;
            }
            Console.WriteLine("Erro em Interpretador.Operan(): Classe inválida nesse contexto! Linha: " + operan.Linha + ", Coluna: " + operan.Coluna);
            return null;
        }

        /// <summary>
        /// <Expr_Atrib_Interna>  ::=  <Op_Arit> <Expr_Atrib> <Expr_Atrib> | <Chamada>  
        /// </summary>
        private object Expr_Atrib_Interna(Node no)
        {
            if (no.Filhos.Count == 3)
            {
                Token opArit = no.GetFilho(0).GetFilho(0).Token; //poderia invovar o Executar aqui!
                object valorExprAtrib1 = Executar(no.GetFilho(1));
                object valorExprAtrib2 = Executar(no.GetFilho(2));
                return calcula(opArit.Imagem, valorExprAtrib1, valorExprAtrib2);
            }
            else
            {
                return Executar(no.GetFilho(0));
            }
        }

        private object calcula(string op, object valorExprAtrib1, object valorExprAtrib2)
        {
            if(op.Equals("+")) 
            {
                return soma(valorExprAtrib1, valorExprAtrib2);
            }
            else if (op.Equals("-"))
            {
                return subt(valorExprAtrib1, valorExprAtrib2);
            }
            else if (op.Equals("*"))
            {
                return mult(valorExprAtrib1, valorExprAtrib2);
            }
            else if (op.Equals("/"))
            {
                return divi(valorExprAtrib1, valorExprAtrib2);
            }
            Console.WriteLine("Erro em Interpretador.calcula(): Operação inválida nesse contexto!");
            return null;
        }

        private object soma(object valorExprAtrib1, object valorExprAtrib2)
        {
            if (valorExprAtrib1.GetType() == typeof(Int64))
            {
                return (Int64)valorExprAtrib1 + (Int64)valorExprAtrib2;
            }
            else if (valorExprAtrib1.GetType() == typeof(Double))
            {
                return (Double)valorExprAtrib1 + (Double)valorExprAtrib2;
            }
            Console.WriteLine("Erro em Interpretador.soma(): Tipo inválido nesse contexto!");
            return null;
         }

        private object subt(object valorExprAtrib1, object valorExprAtrib2)
        {
            if (valorExprAtrib1.GetType() == typeof(Int64))
            {
                return (Int64)valorExprAtrib1 - (Int64)valorExprAtrib2;
            }
            else if (valorExprAtrib1.GetType() == typeof(Double))
            {
                return (Double)valorExprAtrib1 - (Double)valorExprAtrib2;
            }
            Console.WriteLine("Erro em Interpretador.soma(): Tipo inválido nesse contexto!");
            return null;
        }

        private object mult(object valorExprAtrib1, object valorExprAtrib2)
        {
            if (valorExprAtrib1.GetType() == typeof(Int64))
            {
                return (Int64)valorExprAtrib1 * (Int64)valorExprAtrib2;
            }
            else if (valorExprAtrib1.GetType() == typeof(Double))
            {
                return (Double)valorExprAtrib1 * (Double)valorExprAtrib2;
            }
            Console.WriteLine("Erro em Interpretador.soma(): Tipo inválido nesse contexto!");
            return null;
        }

        private object divi(object valorExprAtrib1, object valorExprAtrib2)
        {
            if (valorExprAtrib1.GetType() == typeof(Int64))
            {
                return (Int64)valorExprAtrib1 / (Int64)valorExprAtrib2;
            }
            else if (valorExprAtrib1.GetType() == typeof(Double))
            {
                return (Double)valorExprAtrib1 / (Double)valorExprAtrib2;
            }
            Console.WriteLine("Erro em Interpretador.soma(): Tipo inválido nesse contexto!");
            return null;
        }

        /// <summary>
        /// <Cond> ::= 'si' <Expr_Rel> <Coman> <Senao>
        /// </summary>
        private object Cond(Node no)
        {
            Boolean exprRel = (Boolean) Executar(no.GetFilho(1));
            if (exprRel)
            {
                Executar(no.GetFilho(2));
            }
            else
            {
                Executar(no.GetFilho(3));
            }
            return null;
        }

        /// <summary>
        /// <Senao> ::= <Coman> | 
        /// </summary>
        private object Senao(Node no)
        {
            if(no.Filhos.Count == 1)
            {
                Executar(no.GetFilho(0));
            }
            return null;
        }

        /// <summary>
        /// <Expr_Rel> ::= '(' <Op_Rel> <Operan> <Operan> ')'  
        /// </summary>
        private object Expr_Rel(Node no)
        {
            Token opRel = no.GetFilho(1).GetFilho(0).Token; //poderia invovar o Executar aqui!
            object valorOperan1 = Executar(no.GetFilho(2));
            object valorOperan2 = Executar(no.GetFilho(3));
            return compara(opRel.Imagem, valorOperan1, valorOperan2);
        }

        private object compara(string op, object valorOperan1, object valorOperan2)
        {
            if(op.Equals(">"))
            {
                return maior(valorOperan1, valorOperan2);
            }
            else if (op.Equals(">="))
            {
                return maiorOuIgual(valorOperan1, valorOperan2);
            }
            else if (op.Equals("<"))
            {
                return menor(valorOperan1, valorOperan2);
            }
            else if (op.Equals("<="))
            {
                return menorOuIgual(valorOperan1, valorOperan2);
            }
            else if (op.Equals("=="))
            {
                return igual(valorOperan1, valorOperan2);
            }
            else if (op.Equals("!="))
            {
                return diferente(valorOperan1, valorOperan2);
            }
            Console.WriteLine("Erro em Interpretador.compara(): Operação inválida nesse contexto!");
            return null;
        }

        private object maior(object valorOperan1, object valorOperan2)
        {
            if (valorOperan1.GetType() == typeof(Int64))
            {
                return (Int64)valorOperan1 > (Int64)valorOperan2;
            }
            else if (valorOperan1.GetType() == typeof(Double))
            {
                return (Double)valorOperan1 > (Double)valorOperan2;
            }
            else if (valorOperan1.GetType() == typeof(String))
            {
                return String.Compare((String)valorOperan1, (String)valorOperan2) == 1;
            }
            Console.WriteLine("Erro em Interpretador.maior(): Tipo inválido nesse contexto!");
            return null;
        }

        private object maiorOuIgual(object valorOperan1, object valorOperan2)
        {
            if (valorOperan1.GetType() == typeof(Int64))
            {
                return (Int64)valorOperan1 >= (Int64)valorOperan2;
            }
            else if (valorOperan1.GetType() == typeof(Double))
            {
                return (Double)valorOperan1 >= (Double)valorOperan2;
            }
            else if (valorOperan1.GetType() == typeof(String))
            {
                return String.Compare((String)valorOperan1, (String)valorOperan2) >= 0;
            }
            Console.WriteLine("Erro em Interpretador.maior(): Tipo inválido nesse contexto!");
            return null;
        }

        private object menor(object valorOperan1, object valorOperan2)
        {
            if (valorOperan1.GetType() == typeof(Int64))
            {
                return (Int64)valorOperan1 < (Int64)valorOperan2;
            }
            else if (valorOperan1.GetType() == typeof(Double))
            {
                return (Double)valorOperan1 < (Double)valorOperan2;
            }
            else if (valorOperan1.GetType() == typeof(String))
            {
                return String.Compare((String)valorOperan1, (String)valorOperan2) == -1;
            }
            Console.WriteLine("Erro em Interpretador.maior(): Tipo inválido nesse contexto!");
            return null;
        }

        private object menorOuIgual(object valorOperan1, object valorOperan2)
        {
            if (valorOperan1.GetType() == typeof(Int64))
            {
                return (Int64)valorOperan1 <= (Int64)valorOperan2;
            }
            else if (valorOperan1.GetType() == typeof(Double))
            {
                return (Double)valorOperan1 <= (Double)valorOperan2;
            }
            else if (valorOperan1.GetType() == typeof(String))
            {
                return String.Compare((String)valorOperan1, (String)valorOperan2) <= 0;
            }
            Console.WriteLine("Erro em Interpretador.maior(): Tipo inválido nesse contexto!");
            return null;
        }

        private object igual(object valorOperan1, object valorOperan2)
        {
            if (valorOperan1.GetType() == typeof(Int64))
            {
                return ((Int64)valorOperan1).Equals((Int64)valorOperan2);
            }
            else if (valorOperan1.GetType() == typeof(Double))
            {
                return ((Double)valorOperan1).Equals( (Double)valorOperan2);
            }
            else if (valorOperan1.GetType() == typeof(String))
            {
                return ((String)valorOperan1).Equals((String)valorOperan2);
            }
            Console.WriteLine("Erro em Interpretador.maior(): Tipo inválido nesse contexto!");
            return null;
        }

        private object diferente(object valorOperan1, object valorOperan2)
        {
            if (valorOperan1.GetType() == typeof(Int64))
            {
                return !((Int64)valorOperan1).Equals((Int64)valorOperan2);
            }
            else if (valorOperan1.GetType() == typeof(Double))
            {
                return !((Double)valorOperan1).Equals((Double)valorOperan2);
            }
            else if (valorOperan1.GetType() == typeof(String))
            {
                return !((String)valorOperan1).Equals((String)valorOperan2);
            }
            Console.WriteLine("Erro em Interpretador.maior(): Tipo inválido nesse contexto!");
            return null;
        }

        /// <summary>
        /// <Laco> ::= 'autem' <Expr_Rel> <List_Coman> 
        /// </summary>
        private object Laco(Node no)
        {
            while ((Boolean)Executar(no.GetFilho(1)))
            {
                Executar(no.GetFilho(2));
            }
            return null;
        }

        /// <summary>
        /// <Entrada> ::= 'lego' Identifier   
        /// </summary>
        private object Entrada(Node no)
        {
            Token id = no.GetFilho(1).Token;
            String tipo = TabelaSimbolos.getTipo(id);
            String entrada = Console.ReadLine();    //TODO: melhorar isso aqui!
            if("totum".Equals(tipo))
            {
                setValor(id, Convert.ToInt64(entrada));
            }
            else if("verus".Equals(tipo))
            {
                setValor(id, Convert.ToDouble(entrada));
            }
            else if ("chorda".Equals(tipo))
            {
                setValor(id, entrada);
            }
            else if ("mus".Equals(tipo))
            {
                setValor(id, Convert.ToBoolean(entrada));
            }
            return null;
        }

        /// <summary>
        /// <Saida> ::= 'noto' <Operan>
        /// </summary>
        private object Saida(Node no)
        {
            Object operan = Executar(no.GetFilho(1));
            Console.Write(operan);
            return null;
        }

        /// <summary>
        /// <Retorno> ::= 'reditus' <Expr_Ret>
        /// </summary>
        private object Retorno(Node no)
        {
            if(!EscopoAtual.Equals("vacum"))
            {
                object exprRet = Executar(no.GetFilho(1));
                throw new RetornoException(exprRet);
            }
            throw new RetornoException();
        }

        /// <summary>
        /// <Chamada> ::= Identifier <List_Arg>
        /// </summary>
        private object Chamada(Node no)
        {
            object retorno = null;
            string EscopoAtualBak = EscopoAtual;
            Dictionary<Token, object> frame = new Dictionary<Token, object>();
            List<Token> parametros = TabelaSimbolos.getParams(no.GetFilho(0).Token);
            List<object> argumentos = (List<object>)Executar(no.GetFilho(1));
            argumentos.Reverse();

            //verificação para Memoization
            CallDef callDef = new CallDef();
            callDef.NomeDef = no.GetFilho(0).Token.Imagem;
            callDef.ParValues = argumentos;
            if (memoTab.ContainsKey(callDef))
            {
                return memoTab[callDef];
                //if (valor != null)
                //{
                //    return valor; //valor encontrado na tabela da Memoization
                //}
            }
            
            //termina verificação para Memoization

            for(int i=0; i<parametros.Count; i++)
            {
                frame.Add(parametros[i], argumentos[i]);
            }
            stack.Push(frame);
            try
            {
                EscopoAtual = TabelaSimbolos.getTipo(no.GetFilho(0).Token);
                Executar(defs[no.GetFilho(0).Token.Imagem]);
            }
            catch (RetornoException rex)
            {
                Log.println("Terminou no RetornoException: " + rex.Valor, Level.DEBUG);
                retorno = rex.Valor;
                //para Memoization
                memoTab[callDef] = retorno;
                //fim para Memoization
            }
            finally
            {
                stack.Pop();
                EscopoAtual = EscopoAtualBak;
            }
            return retorno;
        }

        /// <summary>
        /// <List_Arg> ::= <Expr_Atrib> <List_Arg> |   //mudança malopes
        /// </summary>
        private object List_Arg(Node no)
        {
            if (no.Filhos.Count == 2)
            {
                object operan = Executar(no.GetFilho(0));
                List<object> argumentos = (List<object>)Executar(no.GetFilho(1));
                argumentos.Add(operan);
                return argumentos;
            }
            else
            {
                return new List<object>();
            }
        }

        /// <summary>
        /// <Expr_Ret> ::= <Expr_Atrib> | 
        /// </summary>
        private object Expr_Ret(Node no)
        {
            if(no.Filhos.Count == 1)
            {
                return Executar(no.GetFilho(0));
            }
            return null;
        }
      

        private void setValor(Token tok, object valor)
        {
            stack.Peek()[tok] = valor;
        }

        private object getValor(Token tok)
        {
            return stack.Peek()[tok];
        }

        
    }
}
