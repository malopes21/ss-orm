package org.malopes.generator.fases;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import org.malopes.generator.Simbolo;
import org.malopes.generator.TabelaSimbolos;
import org.malopes.generator.Token;
import org.malopes.generator.consts.Classe;

public class AnalisadorSintatico {

	private int pToken;
	private Token token;
	private List<Token> tokens;
	private List<String> erros = new ArrayList<String>();
	private Token tokenIdFuncao;
	private String escopoAtual;

	public AnalisadorSintatico(List<Token> tokens) {
		this.tokens = tokens;
	}

	private void nextToken() {
		if (token != null && token == tokenIdFuncao) {
			escopoAtual = token.getImagem();
		}
		if (token != null && token.getClasse() == Classe.Identificador) {
			Simbolo simbolo = new Simbolo(token, escopoAtual, null, null);
			TabelaSimbolos.addSimbolo(simbolo);
		}

		token = tokens.get(pToken);
		pToken++;
	}

	public boolean analisa() {
		pToken = 0;
		nextToken();
		queryList();
		if (token.getClasse() != Classe.EOF) {
			erros.add("[AnalisadorSintatico.analisa]. Esperado EOF. Linha: "
					+ token.getLinha() + ", coluna: " + token.getColuna());
		}

		return erros.size() == 0;
	}

	public void mostraErros() {
		for (String erro : erros) {
			System.err.println(erro);
		}
	}

	/**
	 * <Query_List> ::= <Query> ';' <Query_List> |
	 */
	private void queryList() {
		if (token.getImagem().equals("create")
				|| token.getImagem().equals("alter")) {
			query();
			if (token.getImagem().equals(";")) {
				nextToken();
				queryList();
			} else {
				erros.add("Erro sintático em queryList(): esperado ';'."
						+ " Linha: " + token.getLinha());
			}
		} // sai pela cadeia vazia
	}

	/**
	 * <Query> ::= <Alter Stm> | <Create Stm>
	 */
	private void query() {
		if (token.getImagem().equals("create")) {
			createStm();
		} else if (token.getImagem().equals("alter")) {
			alterStm();
		} else {
			erros.add("Erro sintático em query(): esperado 'alter' ou 'create'."
					+ " Linha: " + token.getLinha());
		}
	}

	/**
	 * <Create Stm> ::= create table Id '(' <Field Def List> ')'
	 */
	private void createStm() {
		if (token.getImagem().equals("create")) {
			nextToken();
			if (token.getImagem().equals("table")) {
				nextToken();
				if (token.getClasse() == Classe.Identificador) {
					tokenIdFuncao = token;
					nextToken();
					if (token.getImagem().equals("(")) {
						nextToken();
						fieldDefList();
						if (token.getImagem().equals(")")) {
							nextToken();

						} else {
							erros.add("Erro sintático em createStm(): esperado ')'."
									+ " Linha: " + token.getLinha());
						}
					} else {
						erros.add("Erro sintático em createStm(): esperado '('."
								+ " Linha: " + token.getLinha());
					}
				} else {
					erros.add("Erro sintático em createStm(): esperado um ID."
							+ " Linha: " + token.getLinha());
				}
			} else {
				erros.add("Erro sintático em createStm(): esperado 'table'."
						+ " Linha: " + token.getLinha());
			}
		} else {
			erros.add("Erro sintático em createStm(): esperado 'create'."
					+ " Linha: " + token.getLinha());
		}
	}

	/**
	 * <Alter Stm> ::= alter table Id add <Constraint>
	 */
	private void alterStm() {
		if (token.getImagem().equals("alter")) {
			nextToken();
			if (token.getImagem().equals("table")) {
				nextToken();
				if (token.getClasse() == Classe.Identificador) {
					tokenIdFuncao = token;
					nextToken();
					if (token.getImagem().equals("add")) {
						nextToken();
						constraint();
					} else {
						erros.add("Erro sintático em alterStm(): esperado 'add'."
								+ " Linha: " + token.getLinha());
					}
				} else {
					erros.add("Erro sintático em alterStm(): esperado um ID."
							+ " Linha: " + token.getLinha());
				}
			} else {
				erros.add("Erro sintático em alterStm(): esperado 'table'."
						+ " Linha: " + token.getLinha());
			}
		} else {
			erros.add("Erro sintático em alterStm(): esperado 'alter'."
					+ " Linha: " + token.getLinha());
		}
	}

	/**
	 * <Field Def List> ::= <Field Def> <Field Def List 2>
	 */
	private void fieldDefList() {
		fieldDef();
		fieldDefList2();
	}

	/**
	 * <Field Def List 2> ::= ',' <Field Def> <Field Def List 2> | <Constraint List>
	 */
	private void fieldDefList2() {
		if (token.getImagem().equals(",")) {
			Token lookAhead = lookAhead();
			if (lookAhead.getClasse() == Classe.Identificador) {
				nextToken();
				fieldDef();
				fieldDefList2();
			} else {
				constraintList();
			}
		} // sai pela cadeia vazia
	}

	private Token lookAhead() {
		return tokens.get(pToken);
	}

	/**
	 * <Field Def> ::= Id <Type> <Not Null>
	 */
	private void fieldDef() {
		if (token.getClasse() == Classe.Identificador) {
			nextToken();
			type();
			notNull();
		} else {
			erros.add("Erro sintático em fieldDef(): esperado ID." + " Linha: "
					+ token.getLinha());
		}
	}

	/**
	 * <Not Null> ::= not null |
	 */
	private void notNull() {
		if (token.getImagem().equals("not")) {
			nextToken();
			if (token.getImagem().equals("null")) {
				nextToken();

			} else {
				erros.add("Erro sintático em notNull(): esperado 'null'."
						+ " Linha: " + token.getLinha());
			}
		} // sai pela cadeia vazia
	}

	/**
	 * <Type> ::= bit | date | time | timestamp | decimal | real | float |
	 * smallint | integer | int | interval | character | varchar <Tamanho>
	 */
	private void type() {
		String[] tipos = new String[] { "bit", "date", "time", "timestamp",
				"decimal", "real", "float", "smallint", "integer", "int",
				"interval", "character" };
		if (Arrays.asList(tipos).contains(token.getImagem())) {
			nextToken();
		} else if (token.getImagem().equals("varchar")) {
			nextToken();
			tamanho();
		} else {
			erros.add("Erro sintático em type(): esperado 'varchar' ou "
					+ tipos + "." + " Linha: " + token.getLinha());
		}

	}

	/**
	 * <Tamanho> ::= '(' IntegerLiteral ')'
	 */
	private void tamanho() {
		if (token.getImagem().equals("(")) {
			nextToken();
			if (token.getClasse() == Classe.ConstanteLiteralInteira) {
				nextToken();
				if (token.getImagem().equals(")")) {
					nextToken();

				} else {
					erros.add("Erro sintático em tamanho(): esperado ')'."
							+ " Linha: " + token.getLinha());
				}
			} else {
				erros.add("Erro sintático em tamanho(): esperado NUM."
						+ " Linha: " + token.getLinha());
			}
		} else {
			erros.add("Erro sintático em tamanho(): esperado '('." + " Linha: "
					+ token.getLinha());
		}
	}

	/**
	 * <Constraint List> ::= ',' <Constraint Type> <Constraint List> |
	 */
	private void constraintList() {
		if (token.getImagem().equals(",")) {
			nextToken();
			constraintType();
			constraintList();
		} // sai pela cadeia vazia
	}

	
	/**
	 * <Constraint> ::= constraint Id <Constraint Type> | <Constraint Type>
	 */
	private void constraint() {
		if (token.getImagem().equals("constraint")) {
			nextToken();
			if (token.getClasse() == Classe.Identificador) {
				nextToken();
				constraintType();
			} else {
				erros.add("Erro sintático em constraint(): esperado ID."
						+ " Linha: " + token.getLinha());
			}
		} else if (token.getImagem().equals("primary")
				|| token.getImagem().equals("foreign")) {
			constraintType();
		} else {
			erros.add("Erro sintático em constraint(): esperado 'constraint' ou 'primary' ou 'foreign'."
					+ " Linha: " + token.getLinha());
		}
	}

	/**
	 * <Constraint Type> ::= primary key '(' <Id List> ')' | foreign key '(' <Id
	 * List> ')' references Id '(' <Id List> ')'
	 */
	private void constraintType() {
		if (token.getImagem().equals("primary")) {
			nextToken();
			if (token.getImagem().equals("key")) {
				nextToken();
				if (token.getImagem().equals("(")) {
					nextToken();
					idList();
					if (token.getImagem().equals(")")) {
						nextToken();

					} else {
						erros.add("Erro sintático em constraintType(): esperado ')'."
								+ " Linha: " + token.getLinha());
					}
				} else {
					erros.add("Erro sintático em constraintType(): esperado '('."
							+ " Linha: " + token.getLinha());
				}
			} else {
				erros.add("Erro sintático em constraintType(): esperado 'key'."
						+ " Linha: " + token.getLinha());
			}

		} else if (token.getImagem().equals("foreign")) {
			nextToken();
			if (token.getImagem().equals("key")) {
				nextToken();
				if (token.getImagem().equals("(")) {
					nextToken();
					idList();
					if (token.getImagem().equals(")")) {
						nextToken();
						if (token.getImagem().equals("references")) {
							nextToken();
							if (token.getClasse() == Classe.Identificador) {
								nextToken();
								if (token.getImagem().equals("(")) {
									nextToken();
									idList();
									if (token.getImagem().equals(")")) {
										nextToken();

									} else {
										erros.add("Erro sintático em constraintType(): esperado ')'."
												+ " Linha: " + token.getLinha());
									}
								} else {
									erros.add("Erro sintático em constraintType(): esperado '('."
											+ " Linha: " + token.getLinha());
								}
							} else {
								erros.add("Erro sintático em constraintType(): esperado ID."
										+ " Linha: " + token.getLinha());
							}
						} else {
							erros.add("Erro sintático em constraintType(): esperado 'references'."
									+ " Linha: " + token.getLinha());
						}
					} else {
						erros.add("Erro sintático em constraintType(): esperado ')'."
								+ " Linha: " + token.getLinha());
					}
				} else {
					erros.add("Erro sintático em constraintType(): esperado '('."
							+ " Linha: " + token.getLinha());
				}
			} else {
				erros.add("Erro sintático em constraintType(): esperado 'key'."
						+ " Linha: " + token.getLinha());
			}
		} else {
			erros.add("Erro sintático em constraintType(): esperado 'primary' ou 'foreign'."
					+ " Linha: " + token.getLinha());
		}
	}

	/**
	 * <Id List> ::= Id <Id List 2>
	 */
	private void idList() {
		if (token.getClasse() == Classe.Identificador) {
			nextToken();
			idList2();
		} else {
			erros.add("Erro sintático em idList(): esperado ID." + " Linha: "
					+ token.getLinha());
		}
	}

	/**
	 * <Id List 2> ::= ',' Id <Id List2> |
	 */
	private void idList2() {
		if (token.getImagem().equals(",")) {
			nextToken();
			if (token.getClasse() == Classe.Identificador) {
				nextToken();
				idList2();
			} else {
				erros.add("Erro sintático em idList(): esperado ID."
						+ " Linha: " + token.getLinha());
			}
		}
	}

}
