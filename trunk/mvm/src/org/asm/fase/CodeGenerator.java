package org.asm.fase;

import java.io.PrintWriter;

import org.asm.def.Node;

public class CodeGenerator {
	
        private Node raiz;
        private PrintWriter out;

        public CodeGenerator(Node raiz, PrintWriter out) {
                this.raiz = raiz;
                this.out = out;
                // this.fileName = fileName;
        }

        public void gerar() {
                gerarCabecalho();
                gerar(raiz);
                // gerarRodape();
        }

        private void gerarCabecalho() {
        	out.write("MVM0");
        	out.write((byte)1);
        	out.write((byte)0);
        	out.write((byte)2);
        	out.write((byte)0);
        	out.write((byte)3);
        	out.write((byte)0);
        	
		}

		private Object gerar(Node no) {
                switch (no.getTipo()) {
                case Start:
                        return start(no);

                }
                return null;
        }

		private Object start(Node no) {
			return null;
		}


}
