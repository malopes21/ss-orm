using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using SLL_Projeto.SLL;
using SLL_Projeto.Util;

namespace SLL_Projeto
{
    class Program
    {
        private static FileStream file;
        private static String fileName = "..\\..\\Testes\\teste02.sll";
        private static Boolean TesteLocal = true;

        static void Main(string[] args)
        {
            Level level = Level.EXEC;
            Log.level = Level.EXEC;

            if (!LerArquivo(args)) 
            {
                Log.println("Erro de leitura do arquivo fonte!", Level.EXEC);
                Console.ReadKey();
                return; //sai do programa 
            }

            //ANÁLISE LÉXICA
            
            AnalisadorLexico analisadorLexico = new AnalisadorLexico(file);
            analisadorLexico.Analisar();
            if (analisadorLexico.TemErros())
            {
                Log.println("Análise Léxica terminada com erro:", Level.DEBUG);
                analisadorLexico.MostraErros();
                Console.ReadKey();
                return;
            }
            else
            {
                Log.println("Análise Léxica terminada com sucesso!", Level.DEBUG);
                if(level == Level.DEBUG) 
                {
                    analisadorLexico.MostraTokens();
                }
            }

            //ANÁLISE SINTÁTICA COM GERAÇÃO DE ÁRVORE

            AnalisadorSintaticoGeradorArvore analisadorSintatico = new AnalisadorSintaticoGeradorArvore(analisadorLexico.Tokens);
            analisadorSintatico.Analisar();
            if (analisadorSintatico.TemErros())
            {
                Log.println("Análise Sintática terminada com erro:", Level.DEBUG);
                analisadorSintatico.MostraErros();
                Console.ReadKey();
                return;
            }
            else
            {
                Log.println("Análise Sintática terminada com sucesso!", Level.DEBUG);
                if (level == Level.DEBUG)
                {
                    analisadorLexico.MostraTokens();
                    TabelaSimbolos.MostraSimbolos();
                }
            }

            //analisadorSintatico.MostraArvore();


            AnalisadorSemantico analisadorSemantico = new AnalisadorSemantico(analisadorSintatico.Raiz);
            analisadorSemantico.Analisar();
            if(analisadorSemantico.TemErros()) 
            {
                Log.println("Análise Semântica terminada com erro:", Level.DEBUG);
                analisadorSemantico.MostraErros();
                Console.ReadKey();
                return;
            }
            else 
            {
                Log.println("Análise Semântica terminada com sucesso!", Level.DEBUG);
                if (level == Level.DEBUG)
                {
                    TabelaSimbolos.MostraSimbolos();
                }
            }

            try
            {
                DateTime inicio = DateTime.Now;
                Interpretador interpretador = new Interpretador(analisadorSemantico.Raiz, args);
                //interpretador.Memoization = true;
                interpretador.Executar();
                DateTime fim = DateTime.Now;
                Log.println("\n\nExecução encerrada com sucesso! Tempo gasto: " + fim.Subtract(inicio).TotalMilliseconds + " ms", Level.EXEC);
            }
            catch (Exception ex)
            {
                Log.println("Erro na interpretação: " + ex.Message, Level.EXEC);
            }

            
            Console.ReadKey();
        }

        static bool LerArquivo(string[] args)
        {
            try
            {
                if (TesteLocal)
                {
                    file = new FileStream(fileName, FileMode.Open);
                }
                else
                {
                    if(args.Length == 0)
                    {
                        Console.WriteLine("Entre um caminho de script SLL para ser executado!");
                        return false;
                    }
                    file = new FileStream(args[0], FileMode.Open);
                }
                //Console.WriteLine(file.ToString());
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Problema na abertura do arquivo: (" + ex.Message + "). Tecle algo para sair!");
                Console.ReadKey();
                return false;
            }
        }
    }
}
