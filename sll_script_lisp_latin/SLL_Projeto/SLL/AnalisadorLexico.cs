using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;
using SLL_Projeto.Util;

namespace SLL_Projeto.SLL
{
    class AnalisadorLexico
    {
        private FileStream file;
        private Regex literalInteiro = new Regex("^\\d+$");
        private Regex literalReal = new Regex("^\\d+\\.\\d+$");
        private Regex identificador = new Regex("^\\w[\\d,\\w]*$");

        private List<Token> tokens = new List<Token>();
        public List<Token> Tokens
        {
            get { return tokens; }
            set { tokens = value; }
        }

        private List<String> erros = new List<String>();
        public List<String> Erros
        {
            get { return erros; }
            set { erros = value; }
        }

        public AnalisadorLexico(FileStream file)
        {
            this.file = file;
        }

        public void Analisar()
        {
            StreamReader reader = new StreamReader(file);
            String linha = reader.ReadLine();
            int nLinha = 1;
            while (linha != null)
            {
                //String[] lexemas = linha.Split();
                ProcessaLexemas(linha, nLinha);
                
                linha = reader.ReadLine();
                nLinha++;
            }
            tokens.Add(new Token("$", ClasseToken.MarcadorFinalCadeia, -1, -1, -1));
            //MostraTokens();
        }

        private void ProcessaLexemas(string linha, int n)
        {
            StringTokenizer tokenizer = new StringTokenizer(linha);
            while (tokenizer.hasNext())
            {
                String lexema = tokenizer.next();

                if (lexema.Length > 1 && lexema.Substring(0, 2).Equals("//"))
                {
                    break;
                }
                else if (lexema.Substring(0, 1).Equals("\"") && lexema.Substring(lexema.Length - 1, 1).Equals("\"") && lexema.Length > 1)
                {
                    Token token = new Token(lexema.Substring(1, lexema.Length-2), ClasseToken.ConstanteLiteralString, -1, n, -1);
                    tokens.Add(token);
                }
                else if (lexema.Substring(0, 1).Equals("\""))
                {
                    int posicaoInicial = linha.IndexOf("\"");
                    int posicaoFinal = linha.IndexOf("\"", posicaoInicial + 1);
                    if (posicaoFinal == -1)
                    {
                        erros.Add("String aberta e não fechada. Linha: " + n);
                        break;
                    }
                    else
                    {
                        String lexemaString = linha.Substring(posicaoInicial + 1, posicaoFinal - posicaoInicial - 1);
                        Token token = new Token(lexemaString, ClasseToken.ConstanteLiteralString, -1, n, -1);
                        tokens.Add(token);
                        String continuacao = linha.Substring(posicaoFinal + 1);
                        tokenizer = new StringTokenizer(continuacao);
                        if(!tokenizer.hasNext())
                        {
                            break;
                        }
                    }
                }
                else
                {
                    ClassificaOutrosLexema(lexema, n);
                }
            }
        }

        private void ClassificaOutrosLexema(String lexema, int n)
        {
            //Console.Write(lexema + " ");
            if(TabelasEstaticas.EhPalavraReservada(lexema)) 
            {
                Token token = new Token(lexema, ClasseToken.PalavraReservada, -1, n, -1);
                tokens.Add(token);
            }
            else if (TabelasEstaticas.EhDelimitador(lexema))
            {
                Token token = new Token(lexema, ClasseToken.Delimitador, -1, n, -1);
                tokens.Add(token);
            }
            else if (TabelasEstaticas.EhOperadorAritmetico(lexema))
            {
                Token token = new Token(lexema, ClasseToken.OperadorAritmetico, -1, n, -1);
                tokens.Add(token);
            }
            else if (TabelasEstaticas.EhOperadorRelacional(lexema))
            {
                Token token = new Token(lexema, ClasseToken.OperadorRelacional, -1, n, -1);
                tokens.Add(token);
            }
            else if (TabelasEstaticas.EhCteLiteralBool(lexema))
            {
                Token token = new Token(lexema, ClasseToken.ConstanteLiteralBooleana, -1, n, -1);
                tokens.Add(token);
            }
            else if(literalInteiro.IsMatch(lexema))
            {
                Token token = new Token(lexema, ClasseToken.ConstanteLiteralInteira, -1, n, -1);
                tokens.Add(token);
            }
            else if (literalReal.IsMatch(lexema))
            {
                Token token = new Token(lexema, ClasseToken.ConstanteLiteralReal, -1, n, -1);
                tokens.Add(token);
            }
            else if (identificador.IsMatch(lexema))
            {
                Token token = new Token(lexema, ClasseToken.Identificador, -1, n, -1);
                tokens.Add(token);
            }
            else
            {
                erros.Add("Lexema não reconhecido: " + lexema + ". Linha: " + n);
            }

        }

        public void MostraTokens()
        {
            foreach (var tok in tokens)
            {
                Console.WriteLine(tok);
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
            return ! (erros.Count == 0);
        }
    }

}
