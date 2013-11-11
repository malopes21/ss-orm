using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SLL_Projeto.SLL
{
    class AnalisadorSintatico
    {

        private List<Token> tokens;
        private int pToken;
        private List<String> erros = new List<String>();
        private Token token;
        private String escopo;

        public AnalisadorSintatico(List<Token> tokens)
        {
            this.tokens = tokens;
        }

        public List<Token> Tokens
        {
            get { return tokens; }
            set { tokens = value; }
        }

        private void LeToken()
        {
            if (token != null &&  token.Classe == ClasseToken.Identificador)
            {
                TabelaSimbolos.addSimbolo(token, escopo);
            }
            token = tokens[pToken++];
           
            
        }

        public void Analisar()
        {
            pToken = 0;
            LeToken();
            List_Def();
            if(token.Classe != ClasseToken.MarcadorFinalCadeia) 
            {
                erros.Add("Esperado EOF.");
            }

        }


        /// <summary>
        /// <List_Def> ::= <Def> <List_Def> | 
        /// </summary>
        private void List_Def()
        {
            if(token.Imagem.Equals("("))
            {
                Def();
                List_Def();
            }
        }

        /// <summary>
        /// <Def> ::=  '(' <Tipo> Identifier '[' <List_Param> ']' <List_Coman> ')'          
        /// </summary>
        private void Def()
        {
            if (token.Imagem.Equals("("))
            {
                LeToken();
                Tipo();
                if (token.Classe == ClasseToken.Identificador)
                {
                    escopo = token.Imagem;  //armazena o escopo (id da função)
                    LeToken();
                    if (token.Imagem.Equals("["))
                    {
                        LeToken();
                        List_Param();
                        if (token.Imagem.Equals("]"))
                        {
                            LeToken();
                            List_Coman();
                            if (token.Imagem.Equals(")"))
                            {
                                LeToken();
                            }
                            else
                            {
                                erros.Add("Esperado ')'. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
                            }
                        }
                        else
                        {
                            erros.Add("Esperado ']'. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
                        }
                    }
                    else
                    {
                        erros.Add("Esperado '['. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
                    }
                }
                else
                {
                    erros.Add("Esperado ID. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
                }
            }
            else
            {
                erros.Add("Esperado '('. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
        }

        /// <summary>
        /// <Tipo> ::= 'verus' | 'totum' | 'chorda' | 'mus' | 'vacum'     
        /// </summary>
        private void Tipo()
        {
            if (token.Imagem.Equals("verus") ||
               token.Imagem.Equals("totum") ||
               token.Imagem.Equals("chorda") ||
               token.Imagem.Equals("mus") ||
               token.Imagem.Equals("vacum"))
            {
                LeToken();
            }
            else
            {
                erros.Add("Esperado 'verus', 'totum', 'chorda', 'mus' ou 'vacum'. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
        }


        /// <summary>
        /// <List_Param> ::= <Param> <List_Param> |      
        /// </summary>
        private void List_Param()
        {
            if (token.Imagem.Equals("("))
            {
                Param();
                List_Param();
            }
        }

        /// <summary>
        /// <Param> ::= '(' <Tipo> Identifier ')'
        /// </summary>
        private void Param()
        {
            if(token.Imagem.Equals("(")) 
            {
                LeToken();
                Tipo();
                if (token.Classe == ClasseToken.Identificador)
                {
                    LeToken();
                    if (token.Imagem.Equals(")"))
                    {
                        LeToken();
                    }
                    else
                    {
                        erros.Add("Esperado ')'. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
                    }
                }
                else
                {
                    erros.Add("Esperado ID. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
                }
            } else 
            {
                erros.Add("Esperado '('. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
        }

        /// <summary>
        /// <List_Coman> ::= <Coman> <List_Coman> |  
        /// </summary>
        private void List_Coman()
        {
            if(token.Imagem.Equals("(")) 
            {
                Coman();
                List_Coman();
            }
        }

        /// <summary>
        /// <Coman> ::= '(' <Coman_Interno> ')'    
        /// </summary>
        private void Coman()
        {
            if (token.Imagem.Equals("("))
            {
                LeToken();
                Coman_Interno();
                if(token.Imagem.Equals(")"))
                {
                    LeToken();
                }
                else 
                {
                    erros.Add("Esperado ')'. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
                }
            }
            else
            {
                erros.Add("Esperado '('. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
        }

        /// <summary>
        /// <Coman_Interno> ::= <Decl> | <Atrib> | <Cond> | <Laco> | <Entrada> | <Saida> | <Chamada> | <Retorno> | <List_Coman>       
        /// </summary>
        private void Coman_Interno()
        {
            if (token.Imagem.Equals("verus") ||
               token.Imagem.Equals("totum") ||
               token.Imagem.Equals("chorda") ||
               token.Imagem.Equals("mus") ||
               token.Imagem.Equals("vacum"))
            {
                Decl();
            } 
            else if(token.Imagem.Equals("="))
            {
                Atrib();
            }
            else if(token.Imagem.Equals("si"))
            {
                Cond();
            }
            else if(token.Imagem.Equals("autem"))
            {
                Laco();
            }
            else if (token.Imagem.Equals("lego"))
            {
                Entrada();
            }
            else if (token.Imagem.Equals("noto"))
            {
                Saida();
            }
            else if (token.Classe == ClasseToken.Identificador)
            {
                Chamada();
            }
            else if (token.Imagem.Equals("reditus"))
            {
                Retorno();
            }
            else if (token.Imagem.Equals("("))
            {
                List_Coman();
            }
            else
            {
                //erros.Add("Esperado 'verus', 'totum', 'chorda', 'mus' ou 'vacum', '=', 'si', 'autem', 'lego', 'noto', ID, 'reditus', ou '('. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
                //sai pela cadeia vazia
            }

        }

        /// <summary>
        /// <Decl> ::= <Tipo> <List_Id>
        /// </summary>
        private void Decl()
        {
            Tipo();
            List_Id();
        }

        /// <summary>
        /// <List_Id> ::= Identifier <List_Id2>
        /// </summary>
        private void List_Id()
        {
            if (token.Classe == ClasseToken.Identificador)
            {
                LeToken();
                List_Id2();
            }
            else
            {
                erros.Add("Esperado ID. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
        }

        /// <summary>
        /// <List_Id2> ::= Identifier <List_Id2> | 
        /// </summary>
        private void List_Id2()
        {
            if (token.Classe == ClasseToken.Identificador)
            {
                LeToken();
                List_Id2();
            }
        }

        /// <summary>
        /// <Atrib> ::= '=' Identifier <Expr_Atrib>    
        /// </summary>
        private void Atrib()
        {
            if (token.Imagem.Equals("="))
            {
                LeToken();
                if (token.Classe == ClasseToken.Identificador)
                {
                    LeToken();
                    Expr_Atrib();
                }
                else
                {
                    erros.Add("Esperado ID. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
                }
            }
            else
            {
                erros.Add("Esperado '='. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
        }

        /// <summary>
        /// <Expr_Atrib> ::= <Operan> | '(' <Expr_Atrib_Interna> ')'
        /// </summary>
        private void Expr_Atrib()
        {
            if (token.Classe == ClasseToken.Identificador ||
                token.Classe == ClasseToken.ConstanteLiteralInteira ||
                token.Classe == ClasseToken.ConstanteLiteralReal ||
                token.Classe == ClasseToken.ConstanteLiteralString ||
                token.Classe == ClasseToken.ConstanteLiteralBooleana)
            {
                Operan();
            }
            else if (token.Imagem.Equals("("))
            {
                LeToken();
                Expr_Atrib_Interna();
                if (token.Imagem.Equals(")"))
                {
                    LeToken();
                }
                else
                {
                    erros.Add("Esperado ')'. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
                }
            }
            else
            {
                erros.Add("Esperado ID, CLI, CLR, CLS, CLB ou '('. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
        }

        /// <summary>
        /// <Expr_Atrib_Interna>  ::=  <Op_Arit> <Expr_Atrib> <Expr_Atrib> | <Chamada>
        /// </summary>
        private void Expr_Atrib_Interna()
        {
            if (token.Imagem.Equals("+") ||
               token.Imagem.Equals("-") ||
               token.Imagem.Equals("*") ||
               token.Imagem.Equals("/") ||
               token.Imagem.Equals("&") ||
               token.Imagem.Equals("%"))
            {
                Op_Arit();
                Expr_Atrib();
                Expr_Atrib();
            }
            else if(token.Classe == ClasseToken.Identificador)
            {
                Chamada();
            }
            else
            {
                erros.Add("Esperado '+', '-', '*', '/', '&', '%' ou ID. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
        }

        /// <summary>
        /// <Operan> ::= Identifier | IntegerLiteral | RealLiteral | StringLiteral | BoolLiteral 
        /// </summary>
        private void Operan()
        {
            if (token.Classe == ClasseToken.Identificador ||
                token.Classe == ClasseToken.ConstanteLiteralInteira ||
                token.Classe == ClasseToken.ConstanteLiteralReal ||
                token.Classe == ClasseToken.ConstanteLiteralString ||
                token.Classe == ClasseToken.ConstanteLiteralBooleana)
            {
                LeToken();
            }
            else
            {
                erros.Add("Esperado ID, CLI, CLR, CLS ou CLB. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
        }

        /// <summary>
        /// <Cond> ::= 'si' <Expr_Rel> <Coman> <Senao>
        /// </summary>
        private void Cond()
        {
            if(token.Imagem.Equals("si")) 
            {
                LeToken();
                Expr_Rel();
                Coman();
                Senao();
            }
            else
            {
                erros.Add("Esperado 'si'. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
        }

        /// <summary>
        /// <Senao> ::= <Coman> | 
        /// </summary>
        private void Senao()
        {
            if(token.Imagem.Equals("("))
            {
                Coman();
            }
        }

        /// <summary>
        /// <Laco> ::= 'autem' <Expr_Rel> <List_Coman>
        /// </summary>
        private void Laco()
        {
            if (token.Imagem.Equals("autem"))
            {
                LeToken();
                Expr_Rel();
                List_Coman();
            }
            else
            {
                erros.Add("Esperado 'autem'. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
        }

        /// <summary>
        /// <Expr_Rel> ::= '(' <Op_Rel> <Operan> <Operan> ')'
        /// </summary>
        private void Expr_Rel()
        {
            if (token.Imagem.Equals("("))
            {
                LeToken();
                Op_Rel();
                Operan();
                Operan();
                if (token.Imagem.Equals(")"))
                {
                    LeToken();
                }
                else
                {
                    erros.Add("Esperado ')'. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
                }
            }
            else
            {
                erros.Add("Esperado '('. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
        }

        /// <summary>
        /// <Op_Arit> ::= '+' | '-' | '*' | '/' | '&' | '%'
        /// </summary>
        private void Op_Arit()
        {
            if (token.Imagem.Equals("+") ||
               token.Imagem.Equals("-") ||
               token.Imagem.Equals("*") ||
               token.Imagem.Equals("/") ||
               token.Imagem.Equals("&") ||
               token.Imagem.Equals("%"))
            {
                LeToken();
            }
            else
            {
                erros.Add("Esperado '+', '-', '*', '/', '&' ou '%'. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
        }

        /// <summary>
        /// <Op_Rel> ::= '>' | '<' | '<=' | '>=' | '==' | '!='
        /// </summary>
        private void Op_Rel()
        {
            if (token.Imagem.Equals(">") ||
               token.Imagem.Equals("<") ||
               token.Imagem.Equals("<=") ||
               token.Imagem.Equals(">=") ||
               token.Imagem.Equals("==") ||
               token.Imagem.Equals("!="))
            {
                LeToken();
            }
            else
            {
                erros.Add("Esperado '>', '<', '<=', '>=', '==' ou '!='. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
        }


        /// <summary>
        /// <Entrada> ::= 'lego' Identifier
        /// </summary>
        private void Entrada()
        {
            if (token.Imagem.Equals("lego"))
            {
                LeToken();
                if (token.Classe == ClasseToken.Identificador)
                {
                    LeToken();
                }
                else
                {
                    erros.Add("Esperado ID. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
                }
            }
            else
            {
                erros.Add("Esperado 'lego'. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
        }

        /// <summary>
        /// <Chamada> ::= Identifier <List_Arg>
        /// </summary>
        private void Chamada()
        {
            if (token.Classe == ClasseToken.Identificador)
            {
                LeToken();
                List_Arg();
            }
            else
            {
                erros.Add("Esperado ID. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
        }

        /// <summary>
        /// <List_Arg> ::= <Operan> <List_Arg> |
        /// </summary>
        private void List_Arg()
        {
            if (token.Classe == ClasseToken.Identificador ||
                token.Classe == ClasseToken.ConstanteLiteralInteira ||
                token.Classe == ClasseToken.ConstanteLiteralReal ||
                token.Classe == ClasseToken.ConstanteLiteralString ||
                token.Classe == ClasseToken.ConstanteLiteralBooleana )
            {
                Operan();
                List_Arg();
            }
        }

        /// <summary>
        /// <Retorno> ::= 'reditus' <Expr_Atrib>
        /// </summary>
        private void Retorno()
        {
            if (token.Imagem.Equals("reditus"))
            {
                LeToken();
                Expr_Atrib();
            }
            else
            {
                erros.Add("Esperado 'reditus'. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
        }

        /// <summary>
        /// <Saida> ::= 'noto' <Operan>
        /// </summary>
        private void Saida()
        {
            if (token.Imagem.Equals("noto"))
            {
                LeToken();
                Operan();
            }
            else
            {
                erros.Add("Esperado 'noto'. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
        }

        public void MostraErros()
        {
            for (int i = 0; i < erros.Count; i++)
            {
                Console.WriteLine(i + " - " + erros[i]);
            }
        }

        public bool TemErros()
        {
            return !(erros.Count == 0);
        }

    }
}
