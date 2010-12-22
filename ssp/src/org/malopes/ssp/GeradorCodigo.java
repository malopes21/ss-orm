package org.malopes.ssp;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Stack;

public class GeradorCodigo {

    private Node raiz;
    private Map<String, Node> mapDefs;
    private Stack<HashMap<String, Object>> pilha = new Stack<HashMap<String, Object>>();
    private PrintWriter out;

    public GeradorCodigo(Node raiz, PrintWriter out) {
        this.raiz = raiz;
        this.out = out;
    }

    public void gerar() {
        mapDefs = getDefs();
        Node defPrincipal = mapDefs.get("principal");
                
        gerarCabecalho();
        gerarSecaoData();
        gerarInicioSecaoCode();
        gerar(defPrincipal);
        /*
        for(Entry<String, Node> entrada : mapDefs.entrySet()) {
            if(!entrada.getKey().equals("principal")) {
                gerar(entrada.getValue());
            }
        }
        */
        gerarFimSecaoCode();

    }

    private void gerarFimSecaoCode() {
        out.write("\n");
        out.write("\tpush 0\n");
        out.write("\tcall ExitProcess\n");
        out.write("end start\n");
    }

    private void gerarInicioSecaoCode() {
        out.write("\n");
        out.write(".code\n");
        out.write("\n");
        out.write("start: \n");
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
        for(Simbolo simbolo : TabelaSimbolos.getTabela()) {
            if(simbolo.getEscopo().equals("principal")) {
                out.write("\t" + simbolo.getToken().getImagem() + " " 
                        + TabelaSimbolos.getTipoCompativelASM(simbolo.getTipo()) + " " 
                        + TabelaSimbolos.getValorPadraoASM(simbolo.getTipo()) + "\n");
            }
        }
    }


    private Object gerar(Node node) {
        switch (node.getTipo()) {
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
        gerar(node.getFilho(8));
        return null;
    }

    private void populaStackFrame(HashMap<String, Object> stackFrame, String imagemDefId) {
        System.out.println("STACKFRAME "+imagemDefId);
        for(Simbolo simb : TabelaSimbolos.getSimbolosByEscopo(imagemDefId)) {
            stackFrame.put(simb.getToken().getImagem(), simb.getValor());
            System.out.println("Imagem "+ simb.getToken().getImagem() + " | Valor : " + simb.getValor());
        }
    }

    private Map<String, Node> getDefs() {
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
    }
    
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
        out.write("\tmov eax, " + it.next().getImagem() + "\n");
        while(it.hasNext()) {
            String opArit = it.next().getImagem();
            String operan = it.next().getImagem();
            if(opArit.equals("+")) {
                out.write("\tadd eax, " + operan + "\n");
            } else if(opArit.equals("-")) {
                out.write("\tsub eax, " + operan + "\n");
            }
        }
        out.write("\tmov " + id.getImagem() + ", eax \n");
        
        return null;
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
            out.write("\n\tpush offset " + operan.getImagem());
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
        out.write("\n\t;comando la�o enquanto\n");
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
        
        //gerando o complemento do operador - simplificar a gera��o do comando  
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

    private Object maior(Object valorOp1, Object valorOp2) {
        if (valorOp1 instanceof Integer) {
            return (Integer) valorOp1 > (Integer)valorOp2;
        } else if (valorOp1 instanceof Double) {
            return (Double) valorOp1 > (Double)valorOp2;
        } else if (valorOp1 instanceof String) {
            return ((String)valorOp1).compareTo((String)valorOp2) > 0;
        } 
        return false;
    }
    
    private Object menor(Object valorOp1, Object valorOp2) {
        if (valorOp1 instanceof Integer) {
            return (Integer) valorOp1 < (Integer)valorOp2;
        } else if (valorOp1 instanceof Double) {
            return (Double) valorOp1 < (Double)valorOp2;
        } else if (valorOp1 instanceof String) {
            return ((String)valorOp1).compareTo((String)valorOp2) < 0;
        } 
        return false;
    }
    
    private Object maiorIgual(Object valorOp1, Object valorOp2) {
        if (valorOp1 instanceof Integer) {
            return (Integer) valorOp1 >= (Integer)valorOp2;
        } else if (valorOp1 instanceof Double) {
            return (Double) valorOp1 >= (Double)valorOp2;
        } else if (valorOp1 instanceof String) {
            return ((String)valorOp1).compareTo((String)valorOp2) >= 0;
        } 
        return false;
    }

    private Object menorIgual(Object valorOp1, Object valorOp2) {
        if (valorOp1 instanceof Integer) {
            return (Integer) valorOp1 <= (Integer)valorOp2;
        } else if (valorOp1 instanceof Double) {
            return (Double) valorOp1 <= (Double)valorOp2;
        } else if (valorOp1 instanceof String) {
            return ((String)valorOp1).compareTo((String)valorOp2) <= 0;
        } 
        return false;
    }

    private Object igual(Object valorOp1, Object valorOp2) {
        if (valorOp1 instanceof Integer) {
            return ((Integer) valorOp1).intValue() == ((Integer)valorOp2).intValue();
        } else if (valorOp1 instanceof Double) {
            return ((Double) valorOp1).doubleValue() == ((Double)valorOp2).doubleValue();
        } else if (valorOp1 instanceof String) {
            return ((String)valorOp1).compareTo((String)valorOp2) == 0;
        } 
        return false;
    }

    private Object diferente(Object valorOp1, Object valorOp2) {
        if (valorOp1 instanceof Integer) {
            return ((Integer) valorOp1).intValue() != ((Integer)valorOp2).intValue();
        } else if (valorOp1 instanceof Double) {
            return ((Double) valorOp1).doubleValue() != ((Double)valorOp2).doubleValue();
        } else if (valorOp1 instanceof String) {
            return ((String)valorOp1).compareTo((String)valorOp2) != 0;
        } 
        return false;
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
        return null;
    }

    /*
     * <ListParam> ::= <Operan> <ListParam2> |
     */
    private Object listParam(Node node) {
        if(node.getFilhos().size() == 0) {
            return new ArrayList<Object>();
        }
        Object operan = gerar(node.getFilho(0));
        List<Object> listParam2 = (List<Object>) gerar(node.getFilho(1));
        listParam2.add(operan);
        return listParam2;
    }

    /*
     * <ListParam2> ::= ',' <Operan> <ListParam2> |
     */
    private Object listParam2(Node node) {
        if(node.getFilhos().size() == 0) {
            return new ArrayList<Object>();
        }
        Object operan = gerar(node.getFilho(1));
        List<Object> listParam2 = (List<Object>) gerar(node.getFilho(2));
        listParam2.add(operan);
        return listParam2;
    }
    
    /**
     * <Ret>       ::= 'ret' <Operan>
     */
    private Object ret(Node node) {
        Object retorno = gerar(node.getFilho(1));
        throw new RetCommandException(retorno);
    }
    

}