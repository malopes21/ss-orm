package org.malopes.ssp;

import java.io.ObjectInputStream.GetField;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class AnalisadorSemantico {

	private Node raiz;
	private List<String> erros = new ArrayList<String>();
	
	public AnalisadorSemantico(Node raiz) {
		this.raiz = raiz;
	}

	public boolean analisar() {
		analisar(raiz);
		if (erros.size() == 0) {
			return true;
		}
		return false;
	}

	private Object analisar(Node node) {
		switch (node.getTipo()) {
		case Program:
			program(node);
			break;

		case ListDef:
			listDef(node);
			break;
		
		case Def:
			def(node);
			break;

		case ListArg:
			return listArg(node);

		case ListArg2:
			return listArg2(node);
		
		case Arg:
			return arg(node);
			
		case Tipo:
			return tipo(node);
		
		case ListComand:
			listComand(node);
			break;
		
		case Comand:
			comand(node);
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
			
		case Decl:
			decl(node);
			break;
			
		case ListId:
			return listId(node);
			
		case ListId2:
			return listId2(node);
			
		case Enquanto:
			enquanto(node);
			break;
			
		case ExprCond:
			expCond(node);
			break;
			
		case Se:
			se(node);
			break;
			
		case Senao:
			senao(node);
			break;
			
		case Ler:
			ler(node);
			break;
			
		case Ver:
			ver(node);
			break;
			
		case Call:
			return call(node);
			
		case ListParam:
			return listParam(node);
			
		case ListParam2:
			return listParam2(node);
			
		default:
			System.out.println("Tipo de node desconhecido: " + node.getTipo().name());
			break;
		}
		return null;
	}

	/**
	 * <Program>   ::= <ListDef>
	 */
	private void program(Node node) {
		analisar(node.getFilho(0));
	}

	/**
	 * <ListDef>   ::= <Def> <ListDef> |
	 */
	private void listDef(Node node) {
		//TODO: antecipar a obtenção dos tipos das defs
		
		for(Node no : node.getFilhos()) {
			analisar(no);
		}
	}
	
	/**
	 * <def> ::= 'def' Identifier '(' <ListArg> ')' ':' <Tipo> '{' <ListComand> '}'
	 */
	private Object def(Node node) {
		String tipo = (String) analisar(node.getFilho(6));
		Token id = node.getFilho(1).getToken();
		String tipoBuscado = TabelaSimbolos.getTipoSimbolo(id);
		if (tipoBuscado != null) {
			erros.add("Erro semantico: identificador de funcao '" + id.getImagem() + "' redeclarado! Linha: " + id.getLinha() + ", coluna: " + id.getColuna() );
		}
		TabelaSimbolos.setTipoSimbolo(id, tipo);
		
		List<Token> listArg = (List<Token>) analisar(node.getFilho(3));
		for(int i = listArg.size()-1; i>=0; i--) {
			TabelaSimbolos.addParamToSimbolo(listArg.get(i), id);
		}
		
		analisar(node.getFilho(8));
		return null;
	}

	/**
	 *	<ListArg>   ::= <Arg> <ListArg2> | 
	 */
	private Object listArg(Node node) {
		if(node.getFilhos().size() == 0) {
			return new ArrayList<Token>();
		}
		
		Token arg = (Token) analisar(node.getFilho(0));
		List<Token> listArg2 = (List<Token>) analisar(node.getFilho(1));
		listArg2.add(arg);
		return listArg2;
		
	}
	
	/**
	 * <ListArg2>  ::= ',' <Arg> <ListArg2> |
	 */
	private Object listArg2(Node node) {
		if(node.getFilhos().size() == 0) {
			return new ArrayList<Token>();
		}
		
		Token arg = (Token) analisar(node.getFilho(1));
		List<Token> listArg2 = (List<Token>) analisar(node.getFilho(2));
		listArg2.add(arg);
		return listArg2;
	}

	/**
	 * <Arg>       ::= Identifier ':' <Tipo>
	 */
	private Object arg(Node node) {
		String tipo = (String) analisar(node.getFilho(2));
		Token id = node.getFilho(0).getToken();
		String tipoBuscado = TabelaSimbolos.getTipoSimbolo(id);
		if (tipoBuscado != null) {
			erros.add("Erro semantico: identificador de argumento '" + id.getImagem() + "' redeclarado! Linha: " + id.getLinha() + ", coluna: " + id.getColuna() );
		}
		TabelaSimbolos.setTipoSimbolo(id, tipo);
		return id;
		
	}
	
	/**
	 * <Tipo>      ::= 'Int' | 'Real' | 'Str' | 'Nada'
	 */
	private Object tipo(Node node) {
		return node.getFilho(0).getToken().getImagem();
	}
	
	/**
	 * <ListComand> ::= <Comand> <ListComand> |
	 */
	private Object listComand(Node node) {
		if(node.getFilhos().size() > 0) {
			analisar(node.getFilho(0));
			analisar(node.getFilho(1));	
		}
		
		return null;
	}

	/**
	 * <Comand> ::= <Decl> ';' | <Atrib> ';' | <While> | <If> | <Ler> ';' |
	 * <Ver> ';' | <Ret> ';' | <Call> ';' | '{' <ListComand> '}'
	 */
	private Object comand(Node node) {
		
		if(node.getFilhos().size() < 3) {
			analisar(node.getFilho(0));
		} else {
			analisar(node.getFilho(1));
		}
		
		return null;
	}

	/**
	 * <Atrib> ::= Identifier '=' <ExpAtrib>
	 */
	private Object atrib(Node node) {
		Token id = node.getFilho(0).getToken();
		List<Token> listOperan = (List<Token>) analisar(node.getFilho(2));
		
		String tipoId = TabelaSimbolos.getTipoSimbolo(id);
		if (tipoId == null) {
			erros.add("Erro semantico: identificador de variável '" + id.getImagem() + "' não declarado! Linha: " + id.getLinha() + ", coluna: " + id.getColuna() );
		} else {
			for(Token operan : listOperan) {
				String tipoOperan = null;
				if(operan.getClasse() == Classe.Identificador) {
					tipoOperan = TabelaSimbolos.getTipoSimbolo(operan);
					if (tipoOperan == null) {
						erros.add("Erro semantico: identificador de variável '" + operan.getImagem() + "' não declarado! Linha: " + operan.getLinha() + ", coluna: " + operan.getColuna() );
						//break;
					}
				} else {
					tipoOperan = TabelaSimbolos.getTipoCompativel(operan.getClasse());
				}
				if (!tipoId.equals(tipoOperan)) {
					erros.add("Erro semantico: operando '" + operan.getImagem() + "' com tipo incompativel! Linha: " + operan.getLinha() + ", coluna: " + operan.getColuna() );
					//break;
				}
			}
		}
		
		return null;
	}

	/**
	 * <ExpAtrib> ::= <Operan> <ExpAtrib2>
	 */
	private Object exprAtrib(Node node) {
		Token operan = (Token) analisar(node.getFilho(0));
		List<Token> listOperan = (List<Token>) analisar(node.getFilho(1));
		listOperan.add(operan);
		
		return listOperan;
	}

	/**
	 * <ExpAtrib2> ::= <OpArit> <Operan> <ExpAtrib2> |
	 */
	private Object exprAtrib2(Node node) {
		if(node.getFilhos().size() == 0) {
			return new ArrayList<Token>();
		}
				
		Token operan = (Token) analisar(node.getFilho(1));
		List<Token> listOperan = (List<Token>) analisar(node.getFilho(2));
		listOperan.add(operan);
		
		return listOperan;
	}

	/**
	 * <Operan>   ::= Identifier | IntegerLiteral | RealLiteral | StringLiteral | <Call>
	 */
	private Object operan(Node node) {
		if (node.getFilho(0).getTipo() == TipoOfNode.Call) {
			return analisar(node.getFilho(0));
		}
		return node.getFilho(0).getToken();
	}

	/**
	 * <Call>      ::= Identifier '(' <ListParam> ')' 
	 */
	public Object call(Node node) {
		Token defId = node.getFilho(0).getToken();
		String tipo = TabelaSimbolos.getTipoDefSimbolo(defId);
		TabelaSimbolos.setTipoSimbolo(defId, tipo);
		//verificar os tipos dos argumentos passados na chamada
		List<Token> listParam = (List<Token>) analisar(node.getFilho(2));
		Collections.reverse(listParam);
		List<Token> listParamValida = TabelaSimbolos.getParamsBySimbolo(defId);
		if(listParam.size() == listParamValida.size()) {
			for(int i=0; i<listParamValida.size(); i++) {
				String tipoParamValido = TabelaSimbolos.getTipoToken(listParamValida.get(i));
				String tipoParam = TabelaSimbolos.getTipoToken(listParam.get(i));
				if(!(tipoParamValido != null && tipoParam != null && tipoParamValido.equals(tipoParam))) {
					erros.add("Erro semantico: tipo de argumento de '"+listParam.get(i).getImagem()+"' incompativel! Linha: " + listParam.get(i).getLinha() + ", coluna: " + listParam.get(i).getColuna() );
				}
			}	
		} else {
			erros.add("Erro semantico: quantidade de argumentos inválida! Linha: " + defId.getLinha() + ", coluna: " + defId.getColuna() );
		}
		
		return defId;
	}
	
	/*
	 * <ListParam> ::= <Operan> <ListParam2> |
	 */
	private Object listParam(Node node) {
		if(node.getFilhos().size() == 0) {
			return new ArrayList<Token>();
		}
		Token operan = (Token) analisar(node.getFilho(0));
		List<Token> listParam2 = (List<Token>) analisar(node.getFilho(1));
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
		Token operan = (Token) analisar(node.getFilho(1));
		List<Token> listParam2 = (List<Token>) analisar(node.getFilho(2));
		listParam2.add(operan);
		return listParam2;
	}
	
	/**
	 * <Decl>      ::= 'var' <ListId> ':' <Tipo> 
	 */
	private void decl(Node node) {
		String tipo = (String) analisar(node.getFilho(3));
		List<Token> listId = (List<Token>) analisar(node.getFilho(1));
		
		for(Token id : listId) {
			String tipoId = TabelaSimbolos.getTipoSimbolo(id);
			if(tipoId != null) {
				erros.add("Erro semantico: identificador de variável '" + id.getImagem() + "' redeclarado! Linha: " + id.getLinha() + ", coluna: " + id.getColuna() );
				//break;
			} else {
				TabelaSimbolos.setTipoSimbolo(id, tipo);
			}
		}
		
	}
	

	/**
	 * <ListId>    ::= Identifier <ListId2> 
	 */
	private Object listId(Node node) {
		Token id = node.getFilho(0).getToken();
		List<Token> listId2 = (List<Token>) analisar(node.getFilho(1));
		listId2.add(id);
		
		return listId2;
	}
	

	/**
	 * <ListId2>  ::=  ',' Identifier <ListId2> | 
	 */
	private Object listId2(Node node) {
		if(node.getFilhos().size() == 0) {
			return new ArrayList<Token>();
		}
		
		Token id = node.getFilho(1).getToken();
		List<Token> listId2 = (List<Token>) analisar(node.getFilho(2));
		listId2.add(id);
		
		return listId2;
	}
	

	/**
	 * <While>     ::= 'enquanto' '(' <ExpCond> ')' <Comand>
	 */
	private void enquanto(Node node) {
		analisar(node.getFilho(2));
		analisar(node.getFilho(4));
	}
	
	/**
	 * <ExpCond>   ::= <Operan> <OpCond> <Operan>
	 */
	private void expCond(Node node) {
		Token operan1 = (Token) analisar(node.getFilho(0));
		String tipoOperan1 = null;
		if (operan1.getClasse() == Classe.Identificador) {
			tipoOperan1 = TabelaSimbolos.getTipoSimbolo(operan1);
			if(tipoOperan1 == null) {
				erros.add("Erro semantico: identificador de variável '" + operan1.getImagem() + "' não declarado! Linha: " + operan1.getLinha() + ", coluna: " + operan1.getColuna() );
			} 
		} else {
			tipoOperan1 = TabelaSimbolos.getTipoCompativel(operan1.getClasse());
		}
		
		Token operan2 = (Token) analisar(node.getFilho(2));
		String tipoOperan2 = null;
		if (operan2.getClasse() == Classe.Identificador) {
			tipoOperan2 = TabelaSimbolos.getTipoSimbolo(operan2);
			if(tipoOperan2 == null) {
				erros.add("Erro semantico: identificador de variável '" + operan2.getImagem() + "' não declarado! Linha: " + operan2.getLinha() + ", coluna: " + operan2.getColuna() );
			} 
		} else {
			tipoOperan2 = TabelaSimbolos.getTipoCompativel(operan2.getClasse());
		}
		
		if(tipoOperan1 != null && tipoOperan2 != null && !tipoOperan1.equals(tipoOperan2)) {
			erros.add("Erro semantico: identificadores de variável '" + operan1.getImagem() + "', '" + operan2.getImagem() + "' com tipos incompativeis! Linha: " + operan2.getLinha() + ", coluna: " + operan2.getColuna() );
		}
	}

	/**
	 * <If>        ::= 'se' '(' <ExpCond> ')' <Comand> <Else>
	 */
	private void se(Node node) {
		analisar(node.getFilho(2));
		analisar(node.getFilho(4));
		analisar(node.getFilho(5));
	}
	
	/**
	 * <Else>      ::= 'senao' <Comand> |
	 */
	private void senao(Node node) {
		if (node.getFilhos().size() > 0) {
			analisar(node.getFilho(1));
		}
	}
	

	/**
	 * <Ler>       ::= 'ler' '(' Identifier ')' 
	 */
	private void ler(Node node) {
		Token id = node.getFilho(2).getToken();
		if (TabelaSimbolos.getTipoSimbolo(id) == null) {
			erros.add("Erro semantico: identificador de variável '" + id.getImagem() + "' não declarado! Linha: " + id.getLinha() + ", coluna: " + id.getColuna() );
		}
	}
	
	/**
	 * <Ver>       ::= 'ver' '(' <Operan> ')'
	 */
	private void ver(Node node) {
		Token operan = (Token) analisar(node.getFilho(2));
		if (operan.getClasse() == Classe.Identificador && TabelaSimbolos.getTipoSimbolo(operan) == null) {
			erros.add("Erro semantico: identificador de variável '" + operan.getImagem() + "' não declarado! Linha: " + operan.getLinha() + ", coluna: " + operan.getColuna() );
		}
	}


	
	public void mostraErros() {
		for (String erro : erros) {
			System.err.println(erro);
		}
	}
	
}
