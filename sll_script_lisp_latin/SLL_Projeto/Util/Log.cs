using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SLL_Projeto.Util
{
    
    class Log
    {
        public static Level level = Level.DEBUG;

        public static void println(String msg, Level levelpar)
        {
            if (level <= levelpar)
            {
                Console.WriteLine(msg);
            }
        }

        public static void print(String msg, Level levelpar)
        {
            if (level <= levelpar)
            {
                Console.Write(msg);
            }
        }

    }
}
