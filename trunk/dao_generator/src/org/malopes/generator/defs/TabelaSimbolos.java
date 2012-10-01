package org.malopes.generator.defs;

import java.util.ArrayList;
import java.util.List;

import org.malopes.generator.consts.Classe;
import org.malopes.generator.consts.TipoCategoria;
import org.malopes.generator.consts.TipoOfKey;

public class TabelaSimbolos {

	private static List<Simbolo> tabela = new ArrayList<Simbolo>();

	public static List<Simbolo> getTabela() {
		return tabela;
	}

	public static void addSimbolo(Simbolo simbolo) {
		if (!tabela.contains(simbolo)) {
			tabela.add(simbolo);
		}
		simbolo.getToken().setIndiceTabSimb(tabela.indexOf(simbolo));
	}

	public static void listaTabela() {
		System.out.println("\n");
		for (Simbolo simbolo : tabela) {
			simbolo.debug();
		}
	}

	public static List<Simbolo> getSimbolosByEscopo(String escopo) {

		List<Simbolo> simbolosByEscopo = new ArrayList<Simbolo>();
		for (Simbolo simb : tabela) {
			if (simb.getEscopo().equals(escopo)) {
				simbolosByEscopo.add(simb);
			}
		}
		return simbolosByEscopo;
	}
	
	public static List<Simbolo> getSimbolosAtribByEscopo(String escopo) {

		List<Simbolo> simbolosByEscopo = new ArrayList<Simbolo>();
		for (Simbolo simb : tabela) {
			if (simb.getEscopo().equals(escopo) && simb.getCategoria() == TipoCategoria.Atrib) {
				simbolosByEscopo.add(simb);
			}
		}
		return simbolosByEscopo;
	}

	public static String getTipoSimbolo(Token token) {

		Simbolo simboloAchado = tabela.get(token.getIndiceTabSimb());
		if (simboloAchado != null) {
			return simboloAchado.getTipo();
		}

		return null;
	}

	public static String getTipoCompativel(Classe classe) {
		switch (classe) {
		case ConstanteLiteralInteira:
			return "Int";
		case ConstanteLiteralString:
			return "Str";
		case ConstanteLiteralReal:
			return "Real";
		default:
			return null;
		}
	}
	
	/**
	 * <Type>  ::=  bit  | date  |  time | timestamp |  decimal  |  real |  float
          |  smallint |  integer | int  |  interval |  character |  varchar <Tamanho>
	 */
	public static String getTipoJavaEquivalente(String tipoSQL) {
		if(tipoSQL.equals("bit") || tipoSQL.equals("smallint") || tipoSQL.equals("integer") || tipoSQL.equals("int") ) {
			return "Integer";
		} else if(tipoSQL.equals("date") || tipoSQL.equals("time") || tipoSQL.equals("timestamp") || tipoSQL.equals("interval")) {
			return "Date";
		} else if(tipoSQL.equals("decimal") || tipoSQL.equals("real") || tipoSQL.equals("float") || tipoSQL.equals("double") ) {
			return "Double";
		} else if(tipoSQL.equals("character") || tipoSQL.equals("varchar")) {
			return "String";
		}
		return null;
	}
	
	/**
	 * <Tipo>      ::= 'Int' | 'Real' | 'Str' | 'Nada'
	 */
	public static String getTipoCompativelASM(String tipo) {
		if(tipo.equals("Int")) {
			return "DD";
		} else if(tipo.equals("Real")) {
			return "DD";
		} else if(tipo.equals("Str")) {
			return "DB";
		} else if(tipo.equals("Nada")) {
			return "DD";
		}
		throw new RuntimeException("Tipo não existente!");
	}

	public static void setTipoSimbolo(Token token, String tipo) {
		/*
		 * for (int i = 0; i< tabela.size(); i++) { Simbolo simbolo =
		 * tabela.get(i); if
		 * (simbolo.getToken().getImagem().equals(token.getImagem())) {
		 * simbolo.setTipo(tipo); return true; } }
		 */
		Simbolo simboloLocal = tabela.get(token.getIndiceTabSimb());
		simboloLocal.setTipo(tipo);
		simboloLocal.setValor(getValorPadrao(tipo));
	}

	private static Object getValorPadrao(String tipo) {
		
		if ("Int".equals(tipo)) {
			return new Integer(0);
		} else if ("Real".equals(tipo)) {
			return new Double(0.0);
		} else if ("Str".equals(tipo)) {
			return new String("");
		} 

		return null;
	}

	public static String getValorPadraoASM(String tipo) {
		
		if ("Int".equals(tipo)) {
			return "0";
		} else if ("Real".equals(tipo)) {
			return "0";
		} else if ("Str".equals(tipo)) {
			return "256 DUP(0)";
		} else if ("Nada".equals(tipo)) {
			return "0";
		} 

		throw new RuntimeException("Tipo inexistente!");
	}
	
	public static Object getValor(Token token) {
		Simbolo simboloAchado = tabela.get(token.getIndiceTabSimb());
		if (simboloAchado != null) {
			return simboloAchado.getValor();
		}
		return null;
	}

	public static boolean setValor(Token token, Object valor) {
		/*
		 * for (Simbolo simbolo : tabela) { if
		 * (simbolo.getToken().getImagem().equals(token.getImagem())){
		 * simbolo.setValor(value); return true; } }
		 */
		Simbolo simboloLocal = tabela.get(token.getIndiceTabSimb());
		if (simboloLocal.getTipo() != null) {
			simboloLocal.setValor(valor);
		}
		return false;
	}

	public static String getTipoDefSimbolo(Token defId) {
		for(Simbolo simbolo : tabela) {
			if(simbolo.getToken().equals(defId) && simbolo.getEscopo().equals(defId.getImagem())) {
				//System.out.println("Simbolo id def encontrado: " + simbolo);
				return simbolo.getTipo();
			}
		}

		return null;
	}

	/*public static void addParamToSimbolo(Token arg, Token token) {
		Simbolo simboloAchado = tabela.get(token.getIndiceTabSimb());
		if (simboloAchado != null) {
			simboloAchado.addParam(arg);
		}
	}*/
	
	public static void addChaveToSimbolo(List<Token> args, Token token, TipoOfKey tipoChave, Token reference) {
		Simbolo simboloAchado = tabela.get(token.getIndiceTabSimb());
		if (simboloAchado != null) {
			Chave chave = new Chave();
			chave.setTipo(tipoChave);
			chave.setIds(args);
			chave.setReference(reference);
			simboloAchado.getChaves().add(chave);
		}
	}

	public static Chave getPrimaryKeyBySimbolo(Token token) {
		Simbolo simboloLocal = new Simbolo();
		simboloLocal.setToken(token);
		simboloLocal.setEscopo(token.getImagem());
		Simbolo simboloAchado = tabela.get( tabela.indexOf(simboloLocal) );
		if (simboloAchado != null) {
			for(Chave key : simboloAchado.getChaves()) {
				if(key.getTipo() == TipoOfKey.Primary) {
					return key;
				}
			}
		}
		return null;
	}
	
	public static List<Chave> getForeignKeysBySimbolo(Token token) {
		Simbolo simboloLocal = new Simbolo();
		simboloLocal.setToken(token);
		simboloLocal.setEscopo(token.getImagem());
		Simbolo simboloAchado = tabela.get( tabela.indexOf(simboloLocal) );
		if (simboloAchado != null) {
			List<Chave> foreignKeys = new ArrayList<Chave>();
			for(Chave key : simboloAchado.getChaves()) {
				if(key.getTipo() == TipoOfKey.Foreign) {
					foreignKeys.add(key);
				}
			}
			return foreignKeys;
		}
		return null;
	}
	
	public static List<Token> getReferencedTablesBySimbolo(Token token){
		Simbolo simboloLocal = new Simbolo();
		simboloLocal.setToken(token);
		simboloLocal.setEscopo(token.getImagem());
		Simbolo simboloAchado = tabela.get( tabela.indexOf(simboloLocal) );
		if(simboloAchado != null) {
			List<Token> referencedTables = new ArrayList<Token>();
			for(Simbolo simb: tabela) {
				if(simb.getCategoria() == TipoCategoria.Table) {
					List<Chave> chaves = simb.getChaves();
					for(Chave chave: chaves) {
						if(chave != null && chave.getReference() != null && chave.getReference().getImagem().equals(token.getImagem())) {
							referencedTables.add(simb.getToken());
						}
					}
				}
				
			}
			return referencedTables;
		}
		return null;
	}

	public static String getTipoToken(Token token) {
		if(token.getClasse() == Classe.Identificador) {
			return getTipoSimbolo(token);
		} else {
			return getTipoCompativel(token.getClasse());
		}
	}

	public static void setCategoria(Token token, TipoCategoria categoria) {
		Simbolo simboloAchado = tabela.get(token.getIndiceTabSimb());
		if (simboloAchado != null) {
			simboloAchado.setCategoria(categoria);
		}
	}
	
}
