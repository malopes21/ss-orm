package org.asm.fase;

import java.util.ArrayList;
import java.util.List;

import org.asm.def.Clazz;
import org.asm.def.Node;
import org.asm.def.Simbolo;
import org.asm.def.TabelaSimbolos;
import org.asm.def.TipoOfNode;
import org.asm.def.Token;

public class Syntatic {

	private List<Token> tokens = null;
	private int pToken;
	private Token token;
	private List<String> erros = new ArrayList<String>();
	private Node raiz;

	public Syntatic(List<Token> tokens) {
		this.tokens = tokens;
	}

	public Node getRaiz() {
		return raiz;
	}

	private void nextToken() {
		if (token != null && token.getClazz() == Clazz.Identifier) {
			Simbolo simbolo = new Simbolo(token, "", null, null);
			TabelaSimbolos.addSimbolo(simbolo);
		}

		token = tokens.get(pToken);
		pToken++;
	}

	public boolean analyze() {
		pToken = 0;
		nextToken();
		raiz = start();
		if (token.getClazz() != Clazz.EOF) {
			erros.add("[Syntatic.analyze]. Esperado EOF. Linha: "
					+ token.getLine() + ", coluna: " + token.getColum());
		}

		return erros.size() == 0;
	}

	// <Start> ::= <nl opt> <Program> <nl Opt>
	private Node start() {
		Node no = new Node(TipoOfNode.Start);
		no.addFilho(nlOpt());
		no.addFilho(program());
		no.addFilho(nlOpt());
		return no;
	}

	// <nl Opt> ::= NewLine <nl Opt> | !Empty
	private Node nlOpt() {
		Node no = new Node(TipoOfNode.Nl_Opt);
		if (token.getClazz() == Clazz.Delimiter_newLine) {
			no.addFilho(new Node(token));
			nextToken();
			no.addFilho(nlOpt());
		}
		return no;
	}

	// <Program> ::= <DATA> <CODE> '.END'
	private Node program() {
		Node no = new Node(TipoOfNode.Program);
		no.addFilho(data());
		no.addFilho(code());
		if (token.getImage().equalsIgnoreCase(".END")) {
			no.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("Syntatic error in program(): expected '.END'."
					+ " Line: " + token.getLine());
		}
		return no;
	}

	// <DATA> ::= '.DATA' <nl> <Decls>
	private Node data() {
		Node no = new Node(TipoOfNode.Data);
		if (token.getImage().equalsIgnoreCase(".DATA")) {
			no.addFilho(new Node(token));
			nextToken();
			no.addFilho(nl());
			no.addFilho(decls());
		} else {
			erros.add("Syntatic error in data(): expected '.DATA'." + " Line: "
					+ token.getLine());
		}
		return no;
	}

	// <nl>     ::= NewLine <nl Opt>
	private Node nl() {
		Node no = new Node(TipoOfNode.Nl);
		if (token.getClazz() == Clazz.Delimiter_newLine) {
			no.addFilho(new Node(token));
			nextToken();
			no.addFilho(nlOpt());
		} else {
			erros.add("Syntatic error in nl(): expected 'New Line'."
					+ " Line: " + token.getLine());
		}
		return no;
	}

	// <Decls> ::= <Decl> <nl> <Decls> |
	private Node decls() {
		Node no = new Node(TipoOfNode.Decls);
		if (token.getClazz() == Clazz.Identifier) {
			no.addFilho(decl());
			no.addFilho(nl());
			no.addFilho(decls());
		}
		return no;
	}

	// <Decl> ::= Id <Tipo> <Valor>
	private Node decl() {
		Node no = new Node(TipoOfNode.Decl);
		if (token.getClazz() == Clazz.Identifier) {
			no.addFilho(new Node(token));
			nextToken();
			no.addFilho(tipo());
			no.addFilho(valor());
		} else {
			erros.add("Syntatic error in decl(): expected ID." + " Line: "
					+ token.getLine());
		}
		return no;
	}

	// <Tipo> ::= 'DB' | 'DW'
	private Node tipo() {
		Node no = new Node(TipoOfNode.Tipo);
		if (token.getImage().equalsIgnoreCase("DB")
				|| token.getImage().equalsIgnoreCase("DW")) {
			no.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("Syntatic error in tipo(): expected 'DB' or 'DW'."
					+ " Line: " + token.getLine());
		}
		return no;
	}

	// <Valor> ::= StringLiteral | DecimalLiteral | HexaLiteral | CharLiteral
	private Node valor() {
		Node no = new Node(TipoOfNode.Valor);
		if (token.getClazz() == Clazz.Literal_String
				|| token.getClazz() == Clazz.Literal_Decimal
				|| token.getClazz() == Clazz.Literal_Hexa
				|| token.getClazz() == Clazz.Literal_Char) {
			no.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("Syntatic error in valor(): expected StringLiteral | DecimalLiteral | HexaLiteral | CharLiteral."
					+ " Line: " + token.getLine());
		}
		return no;
	}

	// <CODE> ::= '.CODE' <nl> <Commands>
	private Node code() {
		Node no = new Node(TipoOfNode.Code);
		if (token.getImage().equalsIgnoreCase(".CODE")) {
			no.addFilho(new Node(token));
			nextToken();
			no.addFilho(nl());
			no.addFilho(commands());
		} else {
			erros.add("Syntatic error in code(): expected '.CODE'." + " Line: "
					+ token.getLine());
		}
		return no;
	}

	// <Commands> ::= <Command> <nl> <Commands> |
	private Node commands() {
		Node no = new Node(TipoOfNode.Commands);
		if (token.getClazz() == Clazz.Identifier
				|| token.getImage().equalsIgnoreCase("COPY")
				|| token.getImage().equalsIgnoreCase("ADD")
				|| token.getImage().equalsIgnoreCase("SUB")
				|| token.getImage().equalsIgnoreCase("MUL")
				|| token.getImage().equalsIgnoreCase("DIV")
				|| token.getImage().equalsIgnoreCase("CMP")
				|| token.getImage().equalsIgnoreCase("JMP")
				|| token.getImage().equalsIgnoreCase("JG")
				|| token.getImage().equalsIgnoreCase("JGE")
				|| token.getImage().equalsIgnoreCase("JL")
				|| token.getImage().equalsIgnoreCase("JLE")
				|| token.getImage().equalsIgnoreCase("JE")
				|| token.getImage().equalsIgnoreCase("JNE")
				|| token.getImage().equalsIgnoreCase("LOAD")
				|| token.getImage().equalsIgnoreCase("STORE")
				|| token.getImage().equalsIgnoreCase("PUSH")
				|| token.getImage().equalsIgnoreCase("POP")
				|| token.getImage().equalsIgnoreCase("EXIT")) {
			no.addFilho(command());
			no.addFilho(nl());
			no.addFilho(commands());
		}
		return no;
	}

	// <Command> ::= <Label> <nl Opt> <Statment> <Args>
	private Node command() {
		Node no = new Node(TipoOfNode.Command);
		no.addFilho(label());
		no.addFilho(nlOpt());
		no.addFilho(statment());
		no.addFilho(args());
		return no;
	}

	// <Label> ::= Id ':' |
	private Node label() {
		Node no = new Node(TipoOfNode.Label);
		if (token.getClazz() == Clazz.Identifier) {
			no.addFilho(new Node(token));
			nextToken();
			if (token.getImage().equals(":")) {
				no.addFilho(new Node(token));
				nextToken();
			} else {
				erros.add("Syntatic error in label(): expected ':'."
						+ " Line: " + token.getLine());
			}
		}
		return no;
	}

	// <Statment> ::= 'COPY' | 'ADD' | 'SUB' | 'MUL' | 'DIV' | 'CMP' | 'JMP' |
	// 'JG' | 'JGE' | 'JL' | 'JLE' |
	// 'JE' | 'JNE' | 'LOAD' | 'STORE' | 'PUSH' | 'POP' | 'EXIT'
	private Node statment() {
		Node no = new Node(TipoOfNode.Statment);
		if (token.getImage().equalsIgnoreCase("COPY")
				|| token.getImage().equalsIgnoreCase("ADD")
				|| token.getImage().equalsIgnoreCase("SUB")
				|| token.getImage().equalsIgnoreCase("MUL")
				|| token.getImage().equalsIgnoreCase("DIV")
				|| token.getImage().equalsIgnoreCase("CMP")
				|| token.getImage().equalsIgnoreCase("JMP")
				|| token.getImage().equalsIgnoreCase("JG")
				|| token.getImage().equalsIgnoreCase("JGE")
				|| token.getImage().equalsIgnoreCase("JL")
				|| token.getImage().equalsIgnoreCase("JLE")
				|| token.getImage().equalsIgnoreCase("JE")
				|| token.getImage().equalsIgnoreCase("JNE")
				|| token.getImage().equalsIgnoreCase("LOAD")
				|| token.getImage().equalsIgnoreCase("STORE")
				|| token.getImage().equalsIgnoreCase("PUSH")
				|| token.getImage().equalsIgnoreCase("POP")
				|| token.getImage().equalsIgnoreCase("EXIT")) {
			no.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("Syntatic error in statement(): expected 'COPY' | 'ADD' | 'SUB' | 'MUL' | 'DIV' | 'CMP' | 'JMP' | 'JG' | 'JGE' | 'JL' | 'JLE' |'JE' | 'JNE' | 'LOAD' | 'STORE' | 'PUSH' | 'POP' | 'EXIT'."
					+ " Line: " + token.getLine());
		}
		return no;
	}

	// <Args> ::= <Operan> <Args2> |
	private Node args() {
		Node no = new Node(TipoOfNode.Args);
		if (token.getClazz() == Clazz.Identifier
				|| token.getClazz() == Clazz.Literal_Decimal
				|| token.getClazz() == Clazz.Literal_Hexa
				|| token.getClazz() == Clazz.Literal_Char) {
			no.addFilho(operan());
			no.addFilho(args2());
		}
		return no;
	}

	// <Args2> ::= ',' <Operan> |
	private Node args2() {
		Node no = new Node(TipoOfNode.Args2);
		if (token.getImage().equals(",")) {
			no.addFilho(new Node(token));
			nextToken();
			no.addFilho(operan());
		}
		return no;
	}

	// <Operan> ::= Id | DecimalLiteral | HexaLiteral | CharLiteral
	private Node operan() {
		Node no = new Node(TipoOfNode.Operan);
		if (token.getClazz() == Clazz.Identifier
				|| token.getClazz() == Clazz.Literal_Decimal
				|| token.getClazz() == Clazz.Literal_Hexa
				|| token.getClazz() == Clazz.Literal_Char) {
			no.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("Syntatic error in operan(): expected 'Id | DecimalLiteral | HexaLiteral | CharLiteral'."
					+ " Line: " + token.getLine());
		}
		return no;
	}

	public void showErrors() {
		for (String erro : erros) {
			System.out.println(erro);
		}
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
			System.out.println(espacamento + no.getToken().getImage());
		} else {
			System.out.println(espacamento + no.getTipo().name());
		}
	}

}
