using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SLL_Projeto.SLL;

namespace SLL_Projeto.Lixo
{
    class Fat
    {

        public static void Main(string[] args)
        {
            //int n = 14;
            //int res = fat(n);
            //Console.WriteLine("res: " + res);


            //Dictionary<CallDef, object> memoTab = new Dictionary<CallDef, object>();
            
            //CallDef callDef1 = new CallDef();
            //callDef1.NomeDef = "Fib";
            //List<object> paramsDef1 = new List<object>();
            //paramsDef1.Add(6);
            //callDef1.ParValues = paramsDef1;
            ////memoTab.Add(callDef1, 20);
            //memoTab[callDef1] = 20;

            //CallDef callDef2 = new CallDef();
            //callDef2.NomeDef = "Fib";
            //List<object> paramsDef2 = new List<object>();
            //paramsDef2.Add(6);
            //callDef2.ParValues = paramsDef2;
            ////memoTab.Add(callDef2, 30);
            //memoTab[callDef2] = 30;
            


            //Dictionary<String, object> testeDic = new Dictionary<string, object>();
            //testeDic["malopes"] = 20;
            //testeDic["malopes"] = 30;

            DateTime inicio = DateTime.Now;
            int res = fib(42);
            DateTime fim = DateTime.Now;
            Console.WriteLine("Resultado: " + res + " Tempo: " + fim.Subtract(inicio).TotalMilliseconds);

            Console.ReadKey();
        }

        static int fat(int n)
        {
            if (n <= 1)
            {
                return 1;
            }
            else
            {
                return n * fat(n - 1);
            }
        }

        static int fib(int n)
        {
            if (n <= 1)
            {
                return n;
            }
            else
            {
                return fib(n - 1) + fib(n - 2);
            }
        }
    }
}
