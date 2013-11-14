package org.malopes.ssp;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Stack;

import javax.swing.text.StyleContext.SmallAttributeSet;

public class GeradorCodigo {

    private Node raiz;
    private Map<String, Node> mapDefs;
    private List<StackData> stackFrameVarLocal = new ArrayList<StackData>();
    private List<StackData> stackFrameParam = new ArrayList<StackData>();
    private PrintWriter out;

    public GeradorCodigo(Node raiz, PrintWriter out) {
        this.raiz = raiz;
        this.out = out;
    }

    public void gerar() {
        //mapDefs = getDefs();
        //Node defPrincipal = mapDefs.get("principal");
                
        gerarCabecalho();
        gerarSecaoData();
        gerarInicioSecaoCode();
        gerar(raiz);
        gerarFimSecaoCode();

    }


    private void gerarCabecalho() {
        out.write(".486 \n");
        out.write(".model flat, stdcall \n");        
        out.write("\n");
        out.write("option casemap: none \n");
        out.write("\n");
        out.write("include \\masm32\\include\\masm32.inc \n");
        out.write("include \\masm32\\include\\kernel32.inc \n");
        out.write("\n");
        out.write("includelib \\masm32\\lib\\masm32.lib \n");
        out.write("includelib \\masm32\\lib\\kernel32.lib \n");
    }

    private void gerarSecaoData() {
        out.write("\n");
        out.write(".data \n");
        for(SimboloLiteral simboloLi : TabelaSimbolos.getSimbolosLiterais()) {
        	String tipoCompativel = TabelaSimbolos.getTipoCompativel(simboloLi.getClasse());
        	out.write("\t" + simboloLi.getImagemVarGlobal() + " " 
                    + TabelaSimbolos.getTipoCompativelASM(tipoCompativel) + " " 
                    + "\"" + simboloLi.getImagem() + "\", 0" + "\n");
        }
    }

    private void gerarInicioSecaoCode() {
        out.write("\n");
        out.write(".code\n");
        out.write("\n");
        out.write("start: \n");
        out.write("\n");
        out.write("\tcall principal\n");
        out.write("\n");
        out.write("\tpush 0\n");
        out.write("\tcall ExitProcess\n");
    }

    private void gerarFimSecaoCode() {
       
        out.write("\nend start\n");
    }

    private Object gerar(Node node) {
        switch (node.getTipo()) {
        
        case Program:
            return program(node);
        
        case ListDef:
            return listDef(node);
        
        case Def:
            return def(node);

        case ListComand:
            listComand(node);
            break;

        case Comand:
            comand(node);
            break;

        case Decl:
            break;
            
        case Atrib:
            atrib(node);
            break;

        case ExprAtrib:
            return exprAtrib(node);

        case ExprAtrib2:
            return exprAtrib2(node);
            
        case Operan:
            return operan(node);
            
        case OpArit:
            return opArit(node);
            
        case Ver:
            ver(node);
            break;
            
        case Ler:
            ler(node);
            break;
            
        case Enquanto:
            enquanto(node);
            break;
            
        case ExprCond:
            return expCond(node);
            
        case Se:
            se(node);
            break;
            
        case Senao:
            senao(node);
            break;
            
        case Call:
            return call(node);
            
        case ListParam:
            return listParam(node);
            
        case ListParam2:
            return listParam2(node);
            
        case Ret:
            return ret(node);
            
        default:
            System.out.println("Tipo de node desconhecido: " + node.getTipo().name());
            break;
        }
        return null;
    }

    /**
     * <Program>   ::= <ListDef>
     */
    private Object program(Node node) {
		gerar(node.getFilho(0));
    	return null;
	}
    
    /**
     * <ListDef>   ::= <Def> <ListDef> |
     */
    private Object listDef(Node node) {
    	if(!node.getFilhos().isEmpty()) {
    		gerar(node.getFilho(0));
    		gerar(node.getFilho(1));
    	}
    	return null;
	}

	/**
     * <OpArit>    ::= '+' | '-' | '*' | '/'
     */
    private Object opArit(Node node) {
        return node.getFilho(0).getToken();
    }

    /**
     * <def> ::= 'def' Identifier '(' <ListArg> ')' ':' <Tipo> '{' <ListComand>
     * '}'
     */
    private Object def(Node node) {
    	Token idDef = node.getFilho(1).getToken();
    	out.write("\n");
        out.write(idDef.getImagem() + " proc near\n");
        out.write("\tpush ebp\n");
        out.write("\tmov ebp, esp\n");
        //gerar o listArg
        
        stackFrameParam.clear();
        List<Token> params = TabelaSimbolos.getParamsBySimbolo(idDef);
        for(Token param: params) {
        	stackFrameParam.add(new StackData(param.getImagem(), TabelaSimbolos.getTipoToken(param)));
        }
        Collections.reverse(stackFrameParam);
        
        stackFrameVarLocal.clear();
        List<Simbolo> varsLocais = TabelaSimbolos.getVarsLocaisByEscopo(idDef);
        for(Simbolo simbVarLocal: varsLocais) {
        	stackFrameVarLocal.add(new StackData( simbVarLocal.getToken().getImagem(), simbVarLocal.getTipo() ));
        }
        out.write("\n\t;alocacao de vars locais");
        out.write("\n\tsub esp, " + stackFrameVarLocal.size()*4 + "\n");  //considerando tudo 32 bits 
        
        gerar(node.getFilho(8));
        out.write("\n\t;finalizar a proc de qq. forma");
        out.write("\n\tadd esp, " + stackFrameVarLocal.size()*4);  //considerando tudo 32 bits
        out.write("\n\tpop ebp\n");
        out.write("\tret\n");	//mudar para retn ou usar o padrão empilha e desempilha no chamador
        out.write(idDef.getImagem() + " endp\n");
        return null;
    }

 /*   private Map<String, Node> getDefs() {
        Map<String, Node> mapDefsLocal = new HashMap<String, Node>();
        Node listDef = raiz.getFilho(0);
        addDefsRec(listDef, mapDefsLocal);
        return mapDefsLocal;
    }

    private void addDefsRec(Node listDef, Map<String, Node> mapDefsLocal) {
        if (listDef.getFilhos().size() > 0) {
            Node def = listDef.getFilho(0);
            String idDef = def.getFilho(1).getToken().getImagem();
            mapDefsLocal.put(idDef, def);
            addDefsRec(listDef.getFilho(1), mapDefsLocal);
        }
    }*/
    
    /**
     * <ListComand> ::= <Comand> <ListComand> |
     */
    private Object listComand(Node node) {
        if (node.getFilhos().size() > 0) {
            gerar(node.getFilho(0)); // Comand
            gerar(node.getFilho(1)); // ListComand
        }

        return null;
    }

    /**
     * <Comand> ::= <Decl> ';' | <Atrib> ';' | <While> | <If> | <Ler> ';' |
     * <Ver> ';' | <Ret> ';' | <Call> ';' | '{' <ListComand> '}'
     */
    private Object comand(Node node) {
        if (node.getFilhos().size() > 2) {
            gerar(node.getFilho(1));
        } else {
            gerar(node.getFilho(0));
        }
        return null;
    }

    /**
     * <Atrib> ::= Identifier '=' <ExpAtrib>
     */
    private Object atrib(Node node) {
        out.write("\n\t;comando atrib\n");
        Token id = node.getFilho(0).getToken();
        List<Token> exprAtrib = (List<Token>) gerar(node.getFilho(2));
        Collections.reverse(exprAtrib);
        
        Iterator<Token> it = exprAtrib.iterator();
        Token operan1 = it.next();
        if(operan1.getClasse() == Classe.Identificador) {
        	if(TabelaSimbolos.isIdFuncao(operan1)) {
        		//nada a fazer por hora
        	} else {
        		String operan1Stack = calcStackAdress(operan1);
        		out.write("\tmov eax, " + operan1Stack + "\n");
        	}
        } else {
        	out.write("\tmov eax, " + operan1.getImagem() + "\n");
        }
        
        while(it.hasNext()) {
            String opArit = it.next().getImagem();
            Token operan = it.next();
            String operanStack = null;
            if(operan.getClasse() == Classe.Identificador) {
            	operanStack = calcStackAdress(operan);
            } else {
            	operanStack = operan.getImagem();
            }         
            
            if(opArit.equals("+")) {
                out.write("\tadd eax, " + operanStack + "\n");
            } else if(opArit.equals("-")) {
                out.write("\tsub eax, " + operanStack + "\n");
            }
        }
        String idStack = calcStackAdress(id);
        out.write("\tmov " + idStack + ", eax \n");
        
        return null;
    }


	private String calcStackAdress(Token operan) {
		  int posStack = getPosStackLocal(operan.getImagem());
          if(posStack > 0) {
          	posStack = posStack * (4);
          	return "[ebp-"+posStack+"]";
          } else {
          	posStack = getPosStackParam(operan.getImagem()) * 4 + 4;
          	return "[ebp+"+posStack+"]";
          }
	}

	/**
     * <ExpAtrib> ::= <Operan> <ExpAtrib2>
     */
    private Object exprAtrib(Node node) {
        Token operan = (Token) gerar(node.getFilho(0));
        List<Token> expAtrib2 = (List<Token>) gerar(node.getFilho(1));
        expAtrib2.add(operan);
        return expAtrib2;
    }
    
    
    /**
     * <ExpAtrib2> ::= <OpArit> <Operan> <ExpAtrib2> |
     */
    private Object exprAtrib2(Node node) {
        List<Token> expAtrib2 = null;
        if (node.getFilhos().size() > 0) {
            expAtrib2 = (List<Token>) gerar(node.getFilho(2));
            Token opArit = (Token) gerar(node.getFilho(0));
            Token operan = (Token) gerar(node.getFilho(1));
            
            expAtrib2.add(operan);
            expAtrib2.add(opArit);
        } else {
            expAtrib2 = new ArrayList<Token>();
        }
        
        return expAtrib2;
    }
    

    /**
     * <Operan>   ::= Identifier | IntegerLiteral | RealLiteral | StringLiteral | <Call>
     */
    private Object operan(Node node) {
        if(node.getFilho(0).getTipo() != TipoOfNode.Call) {
            Token operan = node.getFilho(0).getToken();
            return operan;
        } else {
            //node tipo Call
            return gerar(node.getFilho(0));
        }
    }

    private Object imagemToValor(Token operan) {
        switch (operan.getClasse()) {
        case ConstanteLiteralInteira:
            return new Integer(operan.getImagem());
        case ConstanteLiteralString:
            return operan.getImagem();
        case ConstanteLiteralReal:
            return new Double(operan.getImagem());
        default:
            return null;
        } 
    }
    

    /**
     * <Ver>       ::= 'ver' '(' <Operan> ')'
     */
    private void ver(Node node) {
        out.write("\n\t;comando ver");
        Token operan = (Token) gerar(node.getFilho(2));
        
        String tipoOperan = TabelaSimbolos.getTipoToken(operan);
        if (tipoOperan.equals("Str")) {
        	String imagemVarGlobal = TabelaSimbolos.getImagemVarGlobal(operan);
            out.write("\n\tpush offset " + imagemVarGlobal);
            out.write("\n\tcall StdOut");
            out.write("\n");
        } else if(tipoOperan.equals("Int")) {
            
        } else if(tipoOperan.equals("Real")) {
            
        } else {
            throw new RuntimeException("Tipo inexistente!");
        }
    }
    
    /**
     * <Ler>       ::= 'ler' '(' Identifier ')'
     */
    private void ler(Node node) {
        
    }
    

    /**
     * <While>     ::= 'enquanto' '(' <ExpCond> ')' <Comand>
     */
    private void enquanto(Node node) {
        out.write("\n\t;comando laço enquanto\n");
        String rotuloVolta = GeradorRotulo.getNextRotulo();
        out.write(rotuloVolta+":\n");
        String rotulo = (String)gerar(node.getFilho(2));
        
        gerar(node.getFilho(4));
        out.write("\tjmp " + rotuloVolta + "\n");
        out.write(rotulo+":\n");
    }
    
    /**
     * <ExpCond>   ::= <Operan> <OpCond> <Operan>
     */
    private Object expCond(Node node) {
        Token op1 = (Token) gerar(node.getFilho(0));
        Token op2 = (Token) gerar(node.getFilho(2));
        String opCond = node.getFilho(1).getFilho(0).getToken().getImagem();
        
        out.write("\tmov eax, " + op1 + "\n");
        out.write("\tmov ebx, " + op2 + "\n");
        out.write("\tcmp eax, ebx\n");
        
        String rotulo = GeradorRotulo.getNextRotulo();
        
        //gerando o complemento do operador - simplificar a geração do comando  
        if (opCond.equals(">")) {
            out.write("\tjle " + rotulo + "\n");
        } else if (opCond.equals("<")) {
            out.write("\tjge " + rotulo + "\n");
        } else if (opCond.equals(">=")) {
            out.write("\tjl " + rotulo + "\n");
        } else if (opCond.equals("<=")) {
            out.write("\tjg " + rotulo + "\n");
        } else if (opCond.equals("==")) {
            out.write("\tne " + rotulo + "\n");
        } else if (opCond.equals("!=")) {
            out.write("\tje " + rotulo + "\n");
        } 
        return rotulo ;
    }


    /**
     * <If>        ::= 'se' '(' <ExpCond> ')' <Comand> <Else>
     */
    private void se(Node node) {
        out.write("\n\t;comando condicional\n");
        String rotulo = (String)gerar(node.getFilho(2));

        gerar(node.getFilho(4));
        out.write("\tjmp sai_"+rotulo+"\n");
        out.write(rotulo+":\n");
        gerar(node.getFilho(5));
        out.write("sai_"+rotulo+":\n");
    }
    
    /**
     * <Else>      ::= 'senao' <Comand> | 
     */
    private void senao(Node node) {
        if (node.getFilhos().size() > 0) {
            gerar(node.getFilho(1));
        }
    }

    /**
     * <Call>      ::= Identifier '(' <ListParam> ')'
     */
    private Object call(Node node) {
    	List<Token> args = (List<Token>) gerar(node.getFilho(2));
    	Collections.reverse(args);
    	out.write("\n\t;empilha, chama sub e desempilha");
    	for(Token arg: args) {
    		String argStack = null;
    		if(arg.getClasse() == Classe.Identificador) {
    			argStack = calcStackAdress(arg) + " ;"+arg.getImagem(); 
    		} else {
    			argStack = arg.getImagem();
    		}
    		out.write("\n\tpush "+argStack);
    	}
    	Token id = node.getFilho(0).getToken();
    	out.write("\n\tcall "+id.getImagem());
    	out.write("\n\tadd esp, " + args.size()*4 + "\n");  //considerando tudo 32 bits
    	
        return id;
    }

    /*
     * <ListParam> ::= <Operan> <ListParam2> |
     */
    private Object listParam(Node node) {
        if(node.getFilhos().size() == 0) {
            return new ArrayList<Token>();
        }
        Token operan = (Token) gerar(node.getFilho(0));
        List<Token> listParam2 = (List<Token>) gerar(node.getFilho(1));
        listParam2.add(operan);
        return listParam2;
    }

    /*
     * <ListParam2> ::= ',' <Operan> <ListParam2> |
     */
    private Object listParam2(Node node) {
        if(node.getFilhos().size() == 0) {
            return new ArrayList<Token>();
        }
        Token operan = (Token) gerar(node.getFilho(1));
        List<Token> listParam2 = (List<Token>) gerar(node.getFilho(2));
        listParam2.add(operan);
        return listParam2;
    }
    
    /**
     * <Ret>       ::= 'ret' <Operan>
     */
    private Object ret(Node node) {
        Token operan = (Token) gerar(node.getFilho(1));  //terá que ajustar para 'call' de função
        out.write("\n\t;desalocacao de vars locais e retorno");
        int posStackLocal = getPosStackLocal(operan.getImagem());
        out.write("\n\tmov eax, [ebp-" + posStackLocal*4 +"]");
        out.write("\n\tadd esp, " + stackFrameVarLocal.size()*4 + "\n");  //considerando tudo 32 bits
        out.write("\tpop ebp\n");
        out.write("\tret\n");
        return null;
    }

	private int getPosStackLocal(String imagem) {
		for(StackData stackData : stackFrameVarLocal) {
			if(stackData.getImagem().equals(imagem)) {
				return stackFrameVarLocal.indexOf(stackData) + 1;	//a posição 0 não ajuda aqui
			}
		}
		return -1;
	}
	

    private int getPosStackParam(String imagem) {
    	for(StackData stackData : stackFrameParam) {
			if(stackData.getImagem().equals(imagem)) {
				return stackFrameParam.indexOf(stackData) + 1;	//a posição 0 não ajuda aqui
			}
		}
		return -1;
	}

}

