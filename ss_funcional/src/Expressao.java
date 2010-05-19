import java.util.ArrayList;
import java.util.List;

public class Expressao {

	private TipoExpressao tipo;
	private List<Expressao> corpo = new ArrayList<Expressao>();
	private String atom;
	private String idFuncao;

	public Expressao(TipoExpressao tipo) {
		this.tipo = tipo;
	}
	
	public Expressao getFilho(int index) {
		return corpo.get(index);
	}
	
	public void addExpressao(Expressao expr) {
		corpo.add(expr);
	}

	public TipoExpressao getTipo() {
		return tipo;
	}

	public void setTipo(TipoExpressao tipo) {
		this.tipo = tipo;
	}

	public List<Expressao> getCorpo() {
		return corpo;
	}

	public void setCorpo(List<Expressao> corpo) {
		this.corpo = corpo;
	}

	public String getAtom() {
		return atom;
	}

	public void setAtom(String atom) {
		this.atom = atom;
	}

	public String getIdFuncao() {
		return idFuncao;
	}

	public void setIdFuncao(String idFuncao) {
		this.idFuncao = idFuncao;
	}
	
	@Override
	public String toString() {
		if (tipo == TipoExpressao.ATOM) {
			return String.valueOf(atom);
		} else if (tipo == TipoExpressao.ID_FUNCAO) {
			return idFuncao;
		} else {
			StringBuilder sb = new StringBuilder();
			sb.append("(");
			for(Expressao expr : corpo) {
				sb.append(expr.toString() +" ");
			}
			sb.append(")");
			return sb.toString();
		}
	}

}
