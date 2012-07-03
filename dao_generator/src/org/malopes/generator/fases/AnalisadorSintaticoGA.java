package org.malopes.generator.fases;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.malopes.generator.Node;
import org.malopes.generator.Simbolo;
import org.malopes.generator.TabelaSimbolos;
import org.malopes.generator.Token;
import org.malopes.generator.consts.Classe;
import org.malopes.generator.consts.TipoOfNode;

public class AnalisadorSintaticoGA {

	private int pToken;
	private Token token;
	private List<Token> tokens;
	private List<String> erros = new ArrayList<String>();
	private Token tokenIdFuncao;
	private String escopoAtual;
	private Node raiz;

	public AnalisadorSintaticoGA(List<Token> tokens) {
		this.tokens = tokens;
	}

	public Node getRaiz() {
		return raiz;
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
		raiz = queryList();
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
	private Node queryList() {
		Node no = new Node(TipoOfNode.Query_List);
		if (token.getImagem().equals("create")
				|| token.getImagem().equals("alter")) {
			no.addFilho(query());
			if (token.getImagem().equals(";")) {
				no.addFilho(new Node(token));
				nextToken();
				no.addFilho(queryList());
			} else {
				erros.add("Erro sintático em queryList(): esperado ';'."
						+ " Linha: " + token.getLinha());
			}
		} // sai pela cadeia vazia
		return no;
	}

	/**
	 * <Query> ::= <Alter Stm> | <Create Stm>
	 */
	private Node query() {
		Node no = new Node(TipoOfNode.Query);
		if (token.getImagem().equals("create")) {
			no.addFilho(createStm());
		} else if (token.getImagem().equals("alter")) {
			no.addFilho(alterStm());
		} else {
			erros.add("Erro sintático em query(): esperado 'alter' ou 'create'."
					+ " Linha: " + token.getLinha());
		}
		return no;
	}

	/**
	 * <Create Stm> ::= create table Id '(' <Field Def List> ')'
	 */
	private Node createStm() {
		Node no = new Node(TipoOfNode.Create_Stm);
		if (token.getImagem().equals("create")) {
			no.addFilho(new Node(token));
			nextToken();
			if (token.getImagem().equals("table")) {
				no.addFilho(new Node(token));
				nextToken();
				if (token.getClasse() == Classe.Identificador) {
					tokenIdFuncao = token;
					no.addFilho(new Node(token));
					nextToken();
					if (token.getImagem().equals("(")) {
						no.addFilho(new Node(token));
						nextToken();
						no.addFilho(fieldDefList());
						if (token.getImagem().equals(")")) {
							no.addFilho(new Node(token));
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
		return no;
	}

	/**
	 * <Alter Stm> ::= alter table Id add <Constraint>
	 */
	private Node alterStm() {
		Node no = new Node(TipoOfNode.Alter_Stm);
		if (token.getImagem().equals("alter")) {
			no.addFilho(new Node(token));
			nextToken();
			if (token.getImagem().equals("table")) {
				no.addFilho(new Node(token));
				nextToken();
				if (token.getClasse() == Classe.Identificador) {
					tokenIdFuncao = token;
					no.addFilho(new Node(token));
					nextToken();
					if (token.getImagem().equals("add")) {
						no.addFilho(new Node(token));
						nextToken();
						no.addFilho(constraint());
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
		return no;
	}

	/**
	 * <Field Def List> ::= <Field Def> <Field Def List 2>
	 */
	private Node fieldDefList() {
		Node no = new Node(TipoOfNode.Field_Def_List);
		no.addFilho(fieldDef());
		no.addFilho(fieldDefList2());
		return no;
	}
	
	/**
	 * <Field Def List 2> ::= ',' <Field Def> <Field Def List 2> | <Constraint List>
	 */
	private Node fieldDefList2() {
		Node no = new Node(TipoOfNode.Field_Def_List_2);
		if (token.getImagem().equals(",")) {
			Token lookAhead = lookAhead();
			if (lookAhead.getClasse() == Classe.Identificador) {
				no.addFilho(new Node(token));
				nextToken();
				no.addFilho(fieldDef());
				no.addFilho(fieldDefList2());
			} else {
				no.addFilho(constraintList());
			}
		} // sai pela cadeia vazia
		return no;
	}

	private Token lookAhead() {
		return tokens.get(pToken);
	}

	/**
	 * <Field Def> ::= Id <Type> <Not Null>
	 */
	private Node fieldDef() {
		Node no = new Node(TipoOfNode.Field_Def);
		if (token.getClasse() == Classe.Identificador) {
			no.addFilho(new Node(token));
			nextToken();
			no.addFilho(type());
			no.addFilho(notNull());
		} else {
			erros.add("Erro sintático em fieldDef(): esperado ID." + " Linha: "
					+ token.getLinha());
		}
		return no;
	}

	/**
	 * <Not Null> ::= not null |
	 */
	private Node notNull() {
		Node no = new Node(TipoOfNode.Not_Null);
		if (token.getImagem().equals("not")) {
			no.addFilho(new Node(token));
			nextToken();
			if (token.getImagem().equals("null")) {
				no.addFilho(new Node(token));
				nextToken();

			} else {
				erros.add("Erro sintático em notNull(): esperado 'null'."
						+ " Linha: " + token.getLinha());
			}
		} // sai pela cadeia vazia
		return no;
	}

	/**
	 * <Type> ::= bit | date | time | timestamp | decimal | real | float |
	 * smallint | integer | int | interval | character | varchar <Tamanho>
	 */
	private Node type() {
		Node no = new Node(TipoOfNode.Type);
		String[] tipos = new String[] { "bit", "date", "time", "timestamp",
				"decimal", "real", "float", "smallint", "integer", "int",
				"interval", "character" };
		if (Arrays.asList(tipos).contains(token.getImagem())) {
			no.addFilho(new Node(token));
			nextToken();
		} else if (token.getImagem().equals("varchar")) {
			no.addFilho(new Node(token));
			nextToken();
			no.addFilho(tamanho());
		} else {
			erros.add("Erro sintático em type(): esperado 'varchar' ou "
					+ tipos + "." + " Linha: " + token.getLinha());
		}
		return no;
	}

	/**
	 * <Tamanho> ::= '(' IntegerLiteral ')'
	 */
	private Node tamanho() {
		Node no = new Node(TipoOfNode.Tamanho);
		if (token.getImagem().equals("(")) {
			no.addFilho(new Node(token));
			nextToken();
			if (token.getClasse() == Classe.ConstanteLiteralInteira) {
				no.addFilho(new Node(token));
				nextToken();
				if (token.getImagem().equals(")")) {
					no.addFilho(new Node(token));
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
		return no;
	}

	/**
	 * <Constraint List> ::= ',' <Constraint Type> <Constraint List> |
	 */
	private Node constraintList() {
		Node no = new Node(TipoOfNode.Constraint_List);
		if (token.getImagem().equals(",")) {
			no.addFilho(new Node(token));
			nextToken();
			no.addFilho(constraintType());
			no.addFilho(constraintList());
		} // sai pela cadeia vazia
		return no;
	}

	
	/**
	 * <Constraint> ::= constraint Id <Constraint Type> | <Constraint Type>
	 */
	private Node constraint() {
		Node no = new Node(TipoOfNode.Constraint);
		if (token.getImagem().equals("constraint")) {
			no.addFilho(new Node(token));
			nextToken();
			if (token.getClasse() == Classe.Identificador) {
				no.addFilho(new Node(token));
				nextToken();
				no.addFilho(constraintType());
			} else {
				erros.add("Erro sintático em constraint(): esperado ID."
						+ " Linha: " + token.getLinha());
			}
		} else if (token.getImagem().equals("primary")
				|| token.getImagem().equals("foreign")) {
			no.addFilho(constraintType());
		} else {
			erros.add("Erro sintático em constraint(): esperado 'constraint' ou 'primary' ou 'foreign'."
					+ " Linha: " + token.getLinha());
		}
		return no;
	}

	/**
	 * <Constraint Type> ::= primary key '(' <Id List> ')' | foreign key '(' <Id
	 * List> ')' references Id '(' <Id List> ')'
	 */
	private Node constraintType() {
		Node no = new Node(TipoOfNode.Constraint_Type);
		if (token.getImagem().equals("primary")) {
			no.addFilho(new Node(token));
			nextToken();
			if (token.getImagem().equals("key")) {
				no.addFilho(new Node(token));
				nextToken();
				if (token.getImagem().equals("(")) {
					no.addFilho(new Node(token));
					nextToken();
					no.addFilho(idList());
					if (token.getImagem().equals(")")) {
						no.addFilho(new Node(token));
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
			no.addFilho(new Node(token));
			nextToken();
			if (token.getImagem().equals("key")) {
				no.addFilho(new Node(token));
				nextToken();
				if (token.getImagem().equals("(")) {
					no.addFilho(new Node(token));
					nextToken();
					no.addFilho(idList());
					if (token.getImagem().equals(")")) {
						no.addFilho(new Node(token));
						nextToken();
						if (token.getImagem().equals("references")) {
							no.addFilho(new Node(token));
							nextToken();
							if (token.getClasse() == Classe.Identificador) {
								no.addFilho(new Node(token));
								nextToken();
								if (token.getImagem().equals("(")) {
									no.addFilho(new Node(token));
									nextToken();
									no.addFilho(idList());
									if (token.getImagem().equals(")")) {
										no.addFilho(new Node(token));
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
		return no;
	}

	/**
	 * <Id List> ::= Id <Id List 2>
	 */
	private Node idList() {
		Node no = new Node(TipoOfNode.Id_List);
		if (token.getClasse() == Classe.Identificador) {
			no.addFilho(new Node(token));
			nextToken();
			no.addFilho(idList2());
		} else {
			erros.add("Erro sintático em idList(): esperado ID." + " Linha: "
					+ token.getLinha());
		}
		return no;
	}

	/**
	 * <Id List 2> ::= ',' Id <Id List2> |
	 */
	private Node idList2() {
		Node no = new Node(TipoOfNode.Id_List_2);
		if (token.getImagem().equals(",")) {
			no.addFilho(new Node(token));
			nextToken();
			if (token.getClasse() == Classe.Identificador) {
				no.addFilho(new Node(token));
				nextToken();
				no.addFilho(idList2());
			} else {
				erros.add("Erro sintático em idList(): esperado ID."
						+ " Linha: " + token.getLinha());
			}
		}
		return no;
	}

	public void mostraArvore() {
		String espacamento = "";
		System.out.println("");
		mostraNo(raiz, espacamento);
	}

	private void mostraNo(Node no, String espacamento) {
		mostraTipoNo(no, espacamento);
		if (no != null && no.getFilhos() != null) {
			for (Node node : no.getFilhos()) {
				mostraNo(node, espacamento + "    ");
			}
		}
	}

	private void mostraTipoNo(Node no, String espacamento) {
		if (no.getTipo() == TipoOfNode.Token) {
			// System.out.println(espacamento+"Token("+no.getToken().getImagem()+")");
			System.out.println(espacamento + no.getToken().getImagem());
		} else {
			System.out.println(espacamento + no.getTipo().name());
		}
	}

}
