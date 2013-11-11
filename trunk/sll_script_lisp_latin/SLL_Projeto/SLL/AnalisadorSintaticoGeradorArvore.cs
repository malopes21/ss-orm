using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SLL_Projeto.SLL
{
    class AnalisadorSintaticoGeradorArvore
    {

        private List<Token> tokens;
        private int pToken;
        private List<String> erros = new List<String>();
        private Token token;
        private String escopo;
        public Node Raiz { get; set; }

        public AnalisadorSintaticoGeradorArvore(List<Token> tokens)
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
            if (token != null && token.Classe == ClasseToken.Identificador)
            {
                TabelaSimbolos.addSimbolo(token, escopo);
            }
            token = tokens[pToken++];
        }

        public void Analisar()
        {
            pToken = 0;
            LeToken();
            Raiz = List_Def();
            if (token.Classe != ClasseToken.MarcadorFinalCadeia)
            {
                erros.Add("Esperado EOF.");
            }

        }


        /// <summary>
        /// <List_Def> ::= <Def> <List_Def> | 
        /// </summary>
        private Node List_Def()
        {
            Node no = new Node(TipoNode.List_Def);
            if (token.Imagem.Equals("("))
            {
                no.AddFilho(Def());
                no.AddFilho(List_Def());
            }
            return no;
        }

        /// <summary>
        /// <Def> ::=  '(' <Tipo> Identifier '[' <List_Param> ']' <List_Coman> ')'          
        /// </summary>
        private Node Def()
        {
            Node no = new Node(TipoNode.Def);
            if (token.Imagem.Equals("("))
            {
                no.AddFilho(new Node(token));
                LeToken();
                no.AddFilho(Tipo());
                if (token.Classe == ClasseToken.Identificador)
                {
                    escopo = token.Imagem;  //armazena o escopo (id da função)
                    no.AddFilho(new Node(token));
                    LeToken();
                    if (token.Imagem.Equals("["))
                    {
                        no.AddFilho(new Node(token));
                        LeToken();
                        no.AddFilho(List_Param());
                        if (token.Imagem.Equals("]"))
                        {
                            no.AddFilho(new Node(token));
                            LeToken();
                            no.AddFilho(List_Coman());
                            if (token.Imagem.Equals(")"))
                            {
                                no.AddFilho(new Node(token));
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
            return no;
        }

        /// <summary>
        /// <Tipo> ::= 'verus' | 'totum' | 'chorda' | 'mus' | 'vacum'     
        /// </summary>
        private Node Tipo()
        {
            Node no = new Node(TipoNode.Tipo);
            if (token.Imagem.Equals("verus") ||
               token.Imagem.Equals("totum") ||
               token.Imagem.Equals("chorda") ||
               token.Imagem.Equals("mus") ||
               token.Imagem.Equals("vacum"))
            {
                no.AddFilho(new Node(token));
                LeToken();
            }
            else
            {
                erros.Add("Esperado 'verus', 'totum', 'chorda', 'mus' ou 'vacum'. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
            return no;
        }


        /// <summary>
        /// <List_Param> ::= <Param> <List_Param> |      
        /// </summary>
        private Node List_Param()
        {
            Node no = new Node(TipoNode.List_Param);
            if (token.Imagem.Equals("("))
            {
                no.AddFilho(Param());
                no.AddFilho(List_Param());
            }
            return no;
        }

        /// <summary>
        /// <Param> ::= '(' <Tipo> Identifier ')'
        /// </summary>
        private Node Param()
        {
            Node no = new Node(TipoNode.Param);
            if (token.Imagem.Equals("("))
            {
                no.AddFilho(new Node(token));
                LeToken();
                no.AddFilho(Tipo());
                if (token.Classe == ClasseToken.Identificador)
                {
                    no.AddFilho(new Node(token));
                    LeToken();
                    if (token.Imagem.Equals(")"))
                    {
                        no.AddFilho(new Node(token));
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
            }
            else
            {
                erros.Add("Esperado '('. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
            return no;
        }

        /// <summary>
        /// <List_Coman> ::= <Coman> <List_Coman> |  
        /// </summary>
        private Node List_Coman()
        {
            Node no = new Node(TipoNode.List_Coman);
            if (token.Imagem.Equals("("))
            {
                no.AddFilho(Coman());
                no.AddFilho(List_Coman());
            }
            return no;
        }

        /// <summary>
        /// <Coman> ::= '(' <Coman_Interno> ')'    
        /// </summary>
        private Node Coman()
        {
            Node no = new Node(TipoNode.Coman);
            if (token.Imagem.Equals("("))
            {
                no.AddFilho(new Node(token));
                LeToken();
                no.AddFilho(Coman_Interno());
                if (token.Imagem.Equals(")"))
                {
                    no.AddFilho(new Node(token));
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
            return no;
        }

        /// <summary>
        /// <Coman_Interno> ::= <Decl> | <Atrib> | <Cond> | <Laco> | <Entrada> | <Saida> | <Chamada> | <Retorno> | <List_Coman>       
        /// </summary>
        private Node Coman_Interno()
        {
            Node no = new Node(TipoNode.Coman_Interno);
            if (token.Imagem.Equals("verus") ||
               token.Imagem.Equals("totum") ||
               token.Imagem.Equals("chorda") ||
               token.Imagem.Equals("mus") ||
               token.Imagem.Equals("vacum"))
            {
                no.AddFilho(Decl());
            }
            else if (token.Imagem.Equals("="))
            {
                no.AddFilho(Atrib());
            }
            else if (token.Imagem.Equals("si"))
            {
                no.AddFilho(Cond());
            }
            else if (token.Imagem.Equals("autem"))
            {
                no.AddFilho(Laco());
            }
            else if (token.Imagem.Equals("lego"))
            {
                no.AddFilho(Entrada());
            }
            else if (token.Imagem.Equals("noto"))
            {
                no.AddFilho(Saida());
            }
            else if (token.Classe == ClasseToken.Identificador)
            {
                no.AddFilho(Chamada());
            }
            else if (token.Imagem.Equals("reditus"))
            {
                no.AddFilho(Retorno());
            }
            else if (token.Imagem.Equals("("))
            {
                no.AddFilho(List_Coman());
            }
            else
            {
                //erros.Add("Esperado 'verus', 'totum', 'chorda', 'mus' ou 'vacum', '=', 'si', 'autem', 'lego', 'noto', ID, 'reditus', ou '('. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
                //sai pela cadeia vazia
            }
            return no;
        }

        /// <summary>
        /// <Decl> ::= <Tipo> <List_Id>
        /// </summary>
        private Node Decl()
        {
            Node no = new Node(TipoNode.Decl);
            no.AddFilho(Tipo());
            no.AddFilho(List_Id());
            return no;
        }

        /// <summary>
        /// <List_Id> ::= Identifier <List_Id2>
        /// </summary>
        private Node List_Id()
        {
            Node no = new Node(TipoNode.List_Id);
            if (token.Classe == ClasseToken.Identificador)
            {
                no.AddFilho(new Node(token));
                LeToken();
                no.AddFilho(List_Id2());
            }
            else
            {
                erros.Add("Esperado ID. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
            return no;
        }

        /// <summary>
        /// <List_Id2> ::= Identifier <List_Id2> | 
        /// </summary>
        private Node List_Id2()
        {
            Node no = new Node(TipoNode.List_Id2);
            if (token.Classe == ClasseToken.Identificador)
            {
                no.AddFilho(new Node(token));
                LeToken();
                no.AddFilho(List_Id2());
            }
            return no;
        }

        /// <summary>
        /// <Atrib> ::= '=' Identifier <Expr_Atrib>    
        /// </summary>
        private Node Atrib()
        {
            Node no = new Node(TipoNode.Atrib);
            if (token.Imagem.Equals("="))
            {
                no.AddFilho(new Node(token));
                LeToken();
                if (token.Classe == ClasseToken.Identificador)
                {
                    no.AddFilho(new Node(token));
                    LeToken();
                    no.AddFilho(Expr_Atrib());
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
            return no;
        }

        /// <summary>
        /// <Expr_Atrib> ::= <Operan> | '(' <Expr_Atrib_Interna> ')'
        /// </summary>
        private Node Expr_Atrib()
        {
            Node no = new Node(TipoNode.Expr_Atrib);
            if (token.Classe == ClasseToken.Identificador ||
                token.Classe == ClasseToken.ConstanteLiteralInteira ||
                token.Classe == ClasseToken.ConstanteLiteralReal ||
                token.Classe == ClasseToken.ConstanteLiteralString ||
                token.Classe == ClasseToken.ConstanteLiteralBooleana)
            {
                no.AddFilho(Operan());
            }
            else if (token.Imagem.Equals("("))
            {
                no.AddFilho(new Node(token));
                LeToken();
                no.AddFilho(Expr_Atrib_Interna());
                if (token.Imagem.Equals(")"))
                {
                    no.AddFilho(new Node(token));
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
            return no;
        }

        /// <summary>
        /// <Expr_Atrib_Interna>  ::=  <Op_Arit> <Expr_Atrib> <Expr_Atrib> | <Chamada>
        /// </summary>
        private Node Expr_Atrib_Interna()
        {
            Node no = new Node(TipoNode.Expr_Atrib_Interna);
            if (token.Imagem.Equals("+") ||
               token.Imagem.Equals("-") ||
               token.Imagem.Equals("*") ||
               token.Imagem.Equals("/") ||
               token.Imagem.Equals("&") ||
               token.Imagem.Equals("%"))
            {
                no.AddFilho(Op_Arit());
                no.AddFilho(Expr_Atrib());
                no.AddFilho(Expr_Atrib());
            }
            else if (token.Classe == ClasseToken.Identificador)
            {
                no.AddFilho(Chamada());
            }
            else
            {
                erros.Add("Esperado '+', '-', '*', '/', '&', '%' ou ID. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
            return no;
        }

        /// <summary>
        /// <Operan> ::= Identifier | IntegerLiteral | RealLiteral | StringLiteral | BoolLiteral 
        /// </summary>
        private Node Operan()
        {
            Node no = new Node(TipoNode.Operan);
            if (token.Classe == ClasseToken.Identificador ||
                token.Classe == ClasseToken.ConstanteLiteralInteira ||
                token.Classe == ClasseToken.ConstanteLiteralReal ||
                token.Classe == ClasseToken.ConstanteLiteralString ||
                token.Classe == ClasseToken.ConstanteLiteralBooleana)
            {
                no.AddFilho(new Node(token));
                LeToken();
            }
            else
            {
                erros.Add("Esperado ID, CLI, CLR, CLS ou CLB. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
            return no;
        }

        /// <summary>
        /// <Cond> ::= 'si' <Expr_Rel> <Coman> <Senao>
        /// </summary>
        private Node Cond()
        {
            Node no = new Node(TipoNode.Cond);
            if (token.Imagem.Equals("si"))
            {
                no.AddFilho(new Node(token));
                LeToken();
                no.AddFilho(Expr_Rel());
                no.AddFilho(Coman());
                no.AddFilho(Senao());
            }
            else
            {
                erros.Add("Esperado 'si'. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
            return no;
        }

        /// <summary>
        /// <Senao> ::= <Coman> | 
        /// </summary>
        private Node Senao()
        {
            Node no = new Node(TipoNode.Senao);
            if (token.Imagem.Equals("("))
            {
                no.AddFilho(Coman());
            }
            return no;
        }

        /// <summary>
        /// <Laco> ::= 'autem' <Expr_Rel> <List_Coman>
        /// </summary>
        private Node Laco()
        {
            Node no = new Node(TipoNode.Laco);
            if (token.Imagem.Equals("autem"))
            {
                no.AddFilho(new Node(token));
                LeToken();
                no.AddFilho(Expr_Rel());
                no.AddFilho(List_Coman());
            }
            else
            {
                erros.Add("Esperado 'autem'. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
            return no;
        }

        /// <summary>
        /// <Expr_Rel> ::= '(' <Op_Rel> <Operan> <Operan> ')'
        /// </summary>
        private Node Expr_Rel()
        {
            Node no = new Node(TipoNode.Expr_Rel);
            if (token.Imagem.Equals("("))
            {
                no.AddFilho(new Node(token));
                LeToken();
                no.AddFilho(Op_Rel());
                no.AddFilho(Operan());
                no.AddFilho(Operan());
                if (token.Imagem.Equals(")"))
                {
                    no.AddFilho(new Node(token));
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
            return no;
        }

        /// <summary>
        /// <Op_Arit> ::= '+' | '-' | '*' | '/' | '&' | '%'
        /// </summary>
        private Node Op_Arit()
        {
            Node no = new Node(TipoNode.Op_Arit);
            if (token.Imagem.Equals("+") ||
               token.Imagem.Equals("-") ||
               token.Imagem.Equals("*") ||
               token.Imagem.Equals("/") ||
               token.Imagem.Equals("&") ||
               token.Imagem.Equals("%"))
            {
                no.AddFilho(new Node(token));
                LeToken();
            }
            else
            {
                erros.Add("Esperado '+', '-', '*', '/', '&' ou '%'. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
            return no;
        }

        /// <summary>
        /// <Op_Rel> ::= '>' | '<' | '<=' | '>=' | '==' | '!='
        /// </summary>
        private Node Op_Rel()
        {
            Node no = new Node(TipoNode.Op_Rel);
            if (token.Imagem.Equals(">") ||
               token.Imagem.Equals("<") ||
               token.Imagem.Equals("<=") ||
               token.Imagem.Equals(">=") ||
               token.Imagem.Equals("==") ||
               token.Imagem.Equals("!="))
            {
                no.AddFilho(new Node(token));
                LeToken();
            }
            else
            {
                erros.Add("Esperado '>', '<', '<=', '>=', '==' ou '!='. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
            return no;
        }


        /// <summary>
        /// <Entrada> ::= 'lego' Identifier
        /// </summary>
        private Node Entrada()
        {
            Node no = new Node(TipoNode.Entrada);
            if (token.Imagem.Equals("lego"))
            {
                no.AddFilho(new Node(token));
                LeToken();
                if (token.Classe == ClasseToken.Identificador)
                {
                    no.AddFilho(new Node(token));
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
            return no;
        }

        /// <summary>
        /// <Chamada> ::= Identifier <List_Arg>
        /// </summary>
        private Node Chamada()
        {
            Node no = new Node(TipoNode.Chamada);
            if (token.Classe == ClasseToken.Identificador)
            {
                no.AddFilho(new Node(token));
                LeToken();
                no.AddFilho(List_Arg());
            }
            else
            {
                erros.Add("Esperado ID. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
            return no;
        }

        /// <summary>
        /// <List_Arg> ::= <Operan> <List_Arg> |
        /// <List_Arg> ::= <Expr_Atrib> <List_Arg> |   //mudança malopes 10/11/2011
        /// </summary>
        private Node List_Arg()
        {
            Node no = new Node(TipoNode.List_Arg);
            if (token.Classe == ClasseToken.Identificador ||
                token.Classe == ClasseToken.ConstanteLiteralInteira ||
                token.Classe == ClasseToken.ConstanteLiteralReal ||
                token.Classe == ClasseToken.ConstanteLiteralString ||
                token.Classe == ClasseToken.ConstanteLiteralBooleana ||
                token.Imagem.Equals("("))
            {
                //no.AddFilho(Operan());  
                no.AddFilho(Expr_Atrib());   //mudança malopes 10/11/2011
                no.AddFilho(List_Arg());
            }
            return no;
        }

        /// <summary>
        /// <Retorno> ::= 'reditus' <Expr_Ret>
        /// </summary>
        private Node Retorno()
        {
            Node no = new Node(TipoNode.Retorno);
            if (token.Imagem.Equals("reditus"))
            {
                no.AddFilho(new Node(token));
                LeToken();
                no.AddFilho(Expr_Ret());
            }
            else
            {
                erros.Add("Esperado 'reditus'. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
            return no;
        }

        /// <summary>
        /// <Expr_Ret> ::= <Expr_Atrib> |
        /// </summary>
        private Node Expr_Ret()
        {
            Node no = new Node(TipoNode.Expr_Ret);
            if (token.Classe == ClasseToken.Identificador ||
                token.Classe == ClasseToken.ConstanteLiteralInteira ||
                token.Classe == ClasseToken.ConstanteLiteralReal ||
                token.Classe == ClasseToken.ConstanteLiteralString ||
                token.Classe == ClasseToken.ConstanteLiteralBooleana ||
                token.Imagem.Equals("("))
            {
                
                no.AddFilho(Expr_Atrib());
            }
            return no;
        }

        /// <summary>
        /// <Saida> ::= 'noto' <Operan>
        /// </summary>
        private Node Saida()
        {
            Node no = new Node(TipoNode.Saida);
            if (token.Imagem.Equals("noto"))
            {
                no.AddFilho(new Node(token));
                LeToken();
                no.AddFilho(Operan());
            }
            else
            {
                erros.Add("Esperado 'noto'. Linha: " + token.Linha + ", Coluna: " + token.Coluna);
            }
            return no;
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

        public void MostraArvore()
        {
            MostraNo(Raiz, "  ");
        }

        private void MostraNo(Node no, String espacamento)
        {
            if(no != null) 
            {
                Console.WriteLine(espacamento + no);
                
                foreach(Node noFilho in no.Filhos) 
                {
                    MostraNo(noFilho, espacamento + "  ");
                }
            }
        }

    }
}
