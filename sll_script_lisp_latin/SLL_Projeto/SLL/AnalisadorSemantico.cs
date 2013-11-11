using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SLL_Projeto.SLL
{
    class AnalisadorSemantico
    {
        public String EscopoAtual {get; set; }
        public Node Raiz {get; set; }
        private List<String> erros = new List<string>();
        public List<String> Erros
        {
            get { return erros; }
            set { erros = value; }
        }

        public AnalisadorSemantico(Node raiz)
        {
            this.Raiz = raiz;
        }

        public void Analisar()
        {
            Analisar(Raiz);
        }

        private Object Analisar(Node no)
        {
            switch (no.Tipo)
            {
                case TipoNode.List_Def:
                    return List_Def(no); 

                case TipoNode.Def: 
                    return Def(no);

                case TipoNode.List_Arg:
                    return List_Arg(no);

                case TipoNode.Tipo:
                    return Tipo(no);

                case TipoNode.List_Param:
                    return List_Param(no);

                case TipoNode.Param:
                    return Param(no);

                case TipoNode.List_Coman:
                    return List_Coman(no);

                case TipoNode.Coman:
                    return Coman(no);

                case TipoNode.Coman_Interno:
                    return Coman_Interno(no);

                case TipoNode.Decl:
                    return Decl(no);

                case TipoNode.List_Id:
                    return List_Id(no);

                case TipoNode.List_Id2:
                    return List_Id2(no);

                case TipoNode.Atrib:
                    return Atrib(no);

                case TipoNode.Expr_Atrib:
                    return Expr_Atrib(no);

                case TipoNode.Operan:
                    return Operan(no);

                case TipoNode.Expr_Atrib_Interna:
                    return Expr_Atrib_Interna(no);

                case TipoNode.Chamada:
                    return Chamada(no);

                case TipoNode.Cond:
                    return Cond(no);

                case TipoNode.Senao:
                    return Senao(no);

                case TipoNode.Laco:
                    return Laco(no);

                case TipoNode.Expr_Rel:
                    return Expr_Rel(no);

                case TipoNode.Entrada:
                    return Entrada(no);

                case TipoNode.Saida:
                    return Saida(no);

                case TipoNode.Retorno:
                    return Retorno(no);

                case TipoNode.Expr_Ret:
                    return Expr_Ret(no);

                default: 
                    //throw new Exception("Operação não existente!");
                    Console.WriteLine("Operação não existente: " + no.Tipo);
                    break;
            }
            return null;
        }




        /// <summary>
        /// <List_Def> ::= <Def> <List_Def> | 
        /// </summary>
        private object List_Def(Node no)
        {
            if(no.Filhos.Count == 2) 
            {
                Analisar(no.GetFilho(0));
                Analisar(no.GetFilho(1));
            }
            return null;
        }

        /// <summary>
        /// <Def> ::=  '(' <Tipo> Identifier '[' <List_Param> ']' <List_Coman> ')' 
        /// </summary>
        private object Def(Node no)
        {
            String tipo = (String)Analisar(no.GetFilho(1));
            Token id = no.GetFilho(2).Token;
            EscopoAtual = tipo;   //para avaliar o tipo do retorno!
            String tipoId = TabelaSimbolos.getTipo(id);
            if (tipoId != null)
            {
                erros.Add("ID de função '" + id.Imagem + "' redeclarado. Linha: " + id.Linha + ", Coluna: " + id.Coluna);
            }
            else
            {
                TabelaSimbolos.setTipo(id, tipo);
            }
            List<Token> parametros = (List<Token>) Analisar(no.GetFilho(4));
            parametros.Reverse();
            TabelaSimbolos.setParams(id, parametros);
            Analisar(no.GetFilho(6));

            return null;
        }

        /// <summary>
        /// <Tipo> ::= 'verus' | 'totum' | 'chorda' | 'mus' | 'vacum' 
        /// </summary>
        private object Tipo(Node no)
        {
            return no.GetFilho(0).Token.Imagem;
        }

        /// <summary>
        /// <List_Param> ::= <Param> <List_Param> |  
        /// </summary>
        private object List_Param(Node no)
        {
            if (no.Filhos.Count == 2)
            {
                Token param = (Token) Analisar(no.GetFilho(0));
                List<Token> parametros = (List<Token>) Analisar(no.GetFilho(1));
                parametros.Add(param);
                return parametros;
            }
            return new List<Token>();
        }

        /// <summary>
        /// <Param> ::= '(' <Tipo> Identifier ')'
        /// </summary>
        private object Param(Node no)
        {
            String tipo = (String)Analisar(no.GetFilho(1));
            Token id = no.GetFilho(2).Token;
            String tipoId = TabelaSimbolos.getTipo(id);
            if (tipoId != null)
            {
                erros.Add("ID " + id.Imagem + " redeclarado. Linha: " + id.Linha + ", Coluna: " + id.Coluna);
            }
            else
            {
                TabelaSimbolos.setTipo(id, tipo);
            }

            return id;
        }

        /// <summary>
        /// <List_Coman> ::= <Coman> <List_Coman> | 
        /// </summary>
        private object List_Coman(Node no)
        {
            if (no.Filhos.Count == 2)
            {
                Analisar(no.GetFilho(0));
                Analisar(no.GetFilho(1));
            }
            return null;
        }

        /// <summary>
        /// <Coman> ::= '(' <Coman_Interno> ')'    
        /// </summary>
        private object Coman(Node no)
        {
            Analisar(no.GetFilho(1));
            return null;
        }


        /// <summary>
        /// <Coman_Interno> ::= <Decl> | <Atrib> | <Cond> | <Laco> | <Entrada> | <Saida> | <Chamada> | <Retorno> | <List_Coman>   
        /// </summary>
        public object Coman_Interno(Node no)
        {
            Analisar(no.GetFilho(0));
            return null;
        }

        /// <summary>
        /// <Decl> ::= <Tipo> <List_Id>
        /// </summary>
        private object Decl(Node no)
        {
            String tipo = (String)Analisar(no.GetFilho(0));
            List<Token> ids = (List<Token>)Analisar(no.GetFilho(1));
            ids.Reverse();
            foreach(Token id in ids)
            {
                String tipoId = TabelaSimbolos.getTipo(id);
                if (tipoId != null)
                {
                    erros.Add("ID " + id.Imagem + " redeclarado. Linha: " + id.Linha + ", Coluna: " + id.Coluna);
                }
                else
                {
                    TabelaSimbolos.setTipo(id, tipo);
                }
            }
            return null;
        }

        /// <summary>
        /// <List_Id> ::= Identifier <List_Id2>
        /// </summary>
        private object List_Id(Node no)
        {
            Token id = no.GetFilho(0).Token;
            List<Token> ids = (List<Token>)Analisar(no.GetFilho(1));
            ids.Add(id);
            return ids;
        }

        /// <summary>
        /// <List_Id2> ::= Identifier <List_Id2> |   
        /// </summary>
        private object List_Id2(Node no)
        {
            if(no.Filhos.Count == 2) 
            {
                Token id = no.GetFilho(0).Token;
                List<Token> ids = (List<Token>)Analisar(no.GetFilho(1));
                ids.Add(id);
                return ids;
            }
            else
            {
                return new List<Token>();
            }
        }

        /// <summary>
        /// <Atrib> ::= '=' Identifier <Expr_Atrib>      
        /// </summary>
        private object Atrib(Node no)
        {
            Token id = no.GetFilho(1).Token;
            List<Token> operans = (List<Token>)Analisar(no.GetFilho(2));
            String tipoId = TabelaSimbolos.getTipo(id);
            if (tipoId == null)
            {
                erros.Add("ID (lado esq.) " + id.Imagem + " não declarado. Linha: " + id.Linha + ", Coluna: " + id.Coluna);
            }
            else
            {
                foreach (Token operan in operans)
                {
                    String tipoOperan = TabelaSimbolos.getTipo(operan);
                    if (tipoOperan == null)
                    {
                        erros.Add("ID (lado dir.)" + operan.Imagem + " não declarado. Linha: " + operan.Linha + ", Coluna: " + operan.Coluna);
                    }
                    else
                    {
                        if(!tipoId.Equals(tipoOperan)) 
                        {
                            erros.Add("Tipo do Operando (lado dir.) " + operan.Imagem + " não compatível. Linha: " + operan.Linha + ", Coluna: " + operan.Coluna);
                        }
                    }
                }
            }
            return null;
            
        }


        /// <summary>
        /// <Expr_Atrib> ::= <Operan> | '(' <Expr_Atrib_Interna> ')' 
        /// </summary>
        private object Expr_Atrib(Node no)
        {
            if (no.Filhos.Count == 1)
            {
                Token operam = (Token)Analisar(no.GetFilho(0));
                List<Token> operans = new List<Token>();
                operans.Add(operam);
                return operans;
            }
            else
            {
                return Analisar(no.GetFilho(1));
            }
        }

        /// <summary>
        /// <Operan> ::= Identifier | IntegerLiteral | RealLiteral | StringLiteral | BoolLiteral 
        /// </summary>
        private object Operan(Node no)
        {
            return no.GetFilho(0).Token;
        }

        /// <summary>
        /// <Expr_Atrib_Interna>  ::=  <Op_Arit> <Expr_Atrib> <Expr_Atrib> | <Chamada> 
        /// </summary>
        private object Expr_Atrib_Interna(Node no)
        {
            if (no.Filhos.Count == 3)
            {
                List<Token> exprAtrib1 = (List<Token>)Analisar(no.GetFilho(1));
                List<Token> exprAtrib2 = (List<Token>)Analisar(no.GetFilho(2));
                exprAtrib1.AddRange(exprAtrib2);
                return exprAtrib1;
            }
            else
            {
                Token chamada = (Token)Analisar(no.GetFilho(0));
                List<Token> operans = new List<Token>();
                operans.Add(chamada);
                return operans;
            }
        }


        /// <summary>
        /// <Chamada> ::= Identifier <List_Arg>
        /// </summary>
        private object Chamada(Node no)
        {
            Token idDef = no.GetFilho(0).Token;
            String tipoDef = TabelaSimbolos.getTipoDef(idDef.Imagem);
            if (tipoDef == null)
            {
                erros.Add("Função/def (lado dir.) " + idDef.Imagem + " não declarada. Linha: " + idDef.Linha + ", Coluna: " + idDef.Coluna);
            }
            else
            {
                TabelaSimbolos.setTipo(idDef, tipoDef);
                List<Token> args = (List<Token>)Analisar(no.GetFilho(1));
                args.Reverse();
                List<Token> paramsDef = TabelaSimbolos.getParams(idDef);
                if (args.Count != paramsDef.Count)
                {
                    erros.Add("Números de parâmetros incorretos na chamada da função " + idDef + ". Linha: " + idDef.Linha + ", Coluna: " + idDef.Coluna);
                }
                else
                {
                    for(int i = 0; i < args.Count; i++)
                    {
                        String tipoArg = TabelaSimbolos.getTipo(args[i]);
                        String tipoParam = TabelaSimbolos.getTipo(paramsDef[i]);
                        if(!tipoArg.Equals(tipoParam)) 
                        {
                            erros.Add("Tipo do argumento passado '" + args[i].Imagem + "' incorreto. Deveria ser do tipo "+tipoParam+". Linha: " + paramsDef[i].Linha + ", Coluna: " + paramsDef[i].Coluna); 
                        }
                    }
                    
                }

            }

            return no.GetFilho(0).Token;
        }

        /// <summary>
        /// <List_Arg> ::= <Operan> <List_Arg> | 
        /// <List_Arg> ::= <Expr_Atrib> <List_Arg> |  //mudança malopes 10/11/2011
        /// </summary>
        private object List_Arg(Node no)
        {
            if (no.Filhos.Count == 2)
            {
                List<Token> paramsExpr = (List<Token>)Analisar(no.GetFilho(0));  ////mudança malopes 10/11/2011
                Token arg1 = null;
                String tipoArg1 = null;
                if (paramsExpr.Count > 1)
                {
                    arg1 = paramsExpr[0];
                    tipoArg1 = TabelaSimbolos.getTipo(arg1);
                    if (tipoArg1 == null)
                    {
                        erros.Add("Argumento " + arg1.Imagem + " não declarado! Linha: " + arg1.Linha + ", Coluna: " + arg1.Coluna);
                    }
                    else
                    {
                        for (int i = 1; i < paramsExpr.Count; i++)
                        {
                            String tipoArgAtual = TabelaSimbolos.getTipo(paramsExpr[i]);
                            if (tipoArgAtual == null)
                            {
                                erros.Add("Argumento " + paramsExpr[i].Imagem + " não declarado! Linha: " + paramsExpr[i].Linha + ", Coluna: " + paramsExpr[i].Coluna);
                            }
                            else
                            {
                                if (!tipoArg1.Equals(tipoArgAtual))
                                {
                                    erros.Add("Argumentos com tipos incompatíveis! Linha: " + paramsExpr[i].Linha + ", Coluna: " + paramsExpr[i].Coluna);
                                }
                            }

                        }
                    }

                }
                
                List<Token> parametros = (List<Token>)Analisar(no.GetFilho(1));
                if (paramsExpr.Count == 1)
                {
                    parametros.Add(paramsExpr[0]);
                }
                else if (paramsExpr.Count > 1 && tipoArg1 != null)
                {
                    parametros.Add(geraTokenLiteralTipoCerto(tipoArg1));
                }
                //parametros.AddRange(paramsExpr);  //mudança malopes 10/11/2011
                return parametros;
            }
            return new List<Token>();
        }

        private Token geraTokenLiteralTipoCerto(String tipoArg1)
        {
            Token boo = new Token();
            if("totum".Equals(tipoArg1))
            {
                boo.Classe = ClasseToken.ConstanteLiteralInteira;
            }
            else if ("verus".Equals(tipoArg1))
            {
                boo.Classe = ClasseToken.ConstanteLiteralReal;
            }
            else if ("chorda".Equals(tipoArg1))
            {
                boo.Classe = ClasseToken.ConstanteLiteralString;
            }
            else if ("mus".Equals(tipoArg1))
            {
                boo.Classe = ClasseToken.ConstanteLiteralBooleana;
            }
            return boo;
        }

        /// <summary>
        /// <Cond> ::= 'si' <Expr_Rel> <Coman> <Senao>
        /// </summary>
        private object Cond(Node no)
        {
            Analisar(no.GetFilho(1));
            Analisar(no.GetFilho(2));
            Analisar(no.GetFilho(3));
            return null;
        }


        /// <summary>
        /// <Senao> ::= <Coman> | 
        /// </summary>
        private object Senao(Node no)
        {
            if (no.Filhos.Count == 1)
            {
                Analisar(no.GetFilho(0));
            }
            return null;
        }

        /// <summary>
        /// <Laco> ::= 'autem' <Expr_Rel> <List_Coman> 
        /// </summary>
        private object Laco(Node no)
        {
            Analisar(no.GetFilho(1));
            Analisar(no.GetFilho(2));
            return null;
        }

        /// <summary>
        /// <Expr_Rel> ::= '(' <Op_Rel> <Operan> <Operan> ')' 
        /// </summary>
        private object Expr_Rel(Node no)
        {
            Token operan1 = (Token)Analisar(no.GetFilho(2));
            Token operan2 = (Token)Analisar(no.GetFilho(3));
            String tipoOperan1 = TabelaSimbolos.getTipo(operan1);
            String tipoOperan2 = TabelaSimbolos.getTipo(operan2);
            if (tipoOperan1 == null || tipoOperan2 == null)
            {
                erros.Add("Operando não declarado! " + operan1.Imagem + " e/ou " + operan2.Imagem + ". Linha: " + operan1.Linha + ", Coluna: " + operan1.Coluna);
            }
            else
            {
                if(!tipoOperan1.Equals(tipoOperan2)) 
                {
                    erros.Add("Tipos incompatíveis! Linha: " + operan1.Linha + ", Coluna: " + operan1.Coluna);
                }
            }
            return null;
        }

        /// <summary>
        /// <Entrada> ::= 'lego' Identifier 
        /// </summary>
        private object Entrada(Node no)
        {
            Token id = no.GetFilho(1).Token;
            String tipoId = TabelaSimbolos.getTipo(id);
            if(tipoId == null) 
            {
                erros.Add("ID " + id.Imagem + " não declarado. Linha: " + id.Linha + ", Coluna: " + id.Coluna);
            }
            return null;
        }

        /// <summary>
        /// <Saida> ::= 'noto' <Operan>  
        /// </summary>
        private object Saida(Node no)
        {
            Token id = (Token) Analisar(no.GetFilho(1));
            String tipoId = TabelaSimbolos.getTipo(id);
            if (tipoId == null)
            {
                erros.Add("Operando " + id.Imagem + " não declarado. Linha: " + id.Linha + ", Coluna: " + id.Coluna);
            }
            return null;
        }

        /// <summary>
        /// <Retorno> ::= 'reditus' <Expr_Ret>  
        /// </summary>
        private object Retorno(Node no)
        {
            List<Token> operans = (List<Token>)Analisar(no.GetFilho(1));
            String tipoRetorno = EscopoAtual;
            if (tipoRetorno.Equals("vacum"))
            {
                if(operans.Count > 0) 
                {
                    erros.Add("Função tipo 'vacum' não pode ter retorno de valor!");
                }
            }
            else
            {
                foreach (Token operan in operans)
                {
                    String tipoOperan = TabelaSimbolos.getTipo(operan);
                    if (tipoOperan == null)
                    {
                        erros.Add("ID (lado dir.)" + operan.Imagem + " não declarado. Linha: " + operan.Linha + ", Coluna: " + operan.Coluna);
                    }
                    else
                    {
                        if (!tipoRetorno.Equals(tipoOperan))
                        {
                            erros.Add("Tipo do operando de retorno " + operan.Imagem + " não compatível. Linha: " + operan.Linha + ", Coluna: " + operan.Coluna);
                        }
                    }
                }
            }
            return null;
        }

        /// <summary>
        /// <Expr_Ret> ::= <Expr_Atrib> |
        /// </summary>
        private object Expr_Ret(Node no)
        {
            if (no.Filhos.Count > 0)
            {
                return Analisar(no.GetFilho(0));
            }
            return new List<Token>();
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
