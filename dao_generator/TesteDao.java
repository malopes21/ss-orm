package org.malopes.generator.lixo;

import entidade.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import util.FabricaConexao;


public class TesteDao implements Dao<Cliente> {

    @Override
    public boolean insert(Cliente cliente) throws SQLException {
            
            PreparedStatement stmt = conexao.prepareStatement("insert into Cliente (cpf, nome, endereco) values (?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, cliente.getCpf()); 
            stmt.setString(2, cliente.getNome());
            stmt.setString(3, cliente.getEndereco());
  
		    int linhas = stmt.executeUpdate();
            
            ResultSet rs = stmt.getGeneratedKeys();
            if(rs != null && rs.next()) {
                cliente.setId(rs.getInt(1));
            }

			rs.close();
            stmt.close();
            return linhas > 0;
       
    }

    @Override
    public boolean delete(Integer id) throws SQLException {

            PreparedStatement stmt = conexao.prepareStatement("delete from Cliente where id = ?");
            stmt.setInt(1, id); 
            int linhas = stmt.executeUpdate();
            stmt.close();
            return linhas > 0;
   
    }

    @Override
    public boolean delete(Cliente cliente) throws SQLException {

            PreparedStatement stmt = conexao.prepareStatement("delete from Cliente where id = ?");
            stmt.setInt(1, id); //id = 12
            int linhas = stmt.executeUpdate();
            stmt.close();
            return linhas > 0;
    }

    @Override
    public boolean update(Cliente cliente) throws SQLException {

			PreparedStatement stmt = conexao.prepareStatement("update Cliente set cpf =  ?, nome = ?, endereco = ? where id = ?");
            stmt.setString(1, cliente.getCpf()); 
            stmt.setString(2, cliente.getNome());
            stmt.setString(3, cliente.getEndereco());
            stmt.setInt(4, cliente.getId());
            int linhas = stmt.executeUpdate();
            stmt.close();
            return linhas > 0;
    }

    @Override
    public List<Cliente> listAll() throws SQLException {

            PreparedStatement stmt = conexao.prepareStatement("select * from Cliente ");
//            stmt.setString(1, "%" + filtro + "%");
            ResultSet rs = stmt.executeQuery();
            clientes = new ArrayList<Cliente>();
            while (rs.next()) {
				Cliente cliente = new Cliente();
				cliente.setId(rs.getInt("id"));
				cliente.setNome(rs.getString("nome"));
				clientes.add(cliente);
            }
            rs.close();
            stmt.close();

            return clientes;

    }

    @Override
    public Cliente getById(Integer id) throws SQLException {
   
            PreparedStatement stmt = conexao.prepareStatement("select * from Cliente where id = ?");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            Cliente cliente = new Cliente();
            if (rs.next()) {
                cliente.setId(rs.getInt("id"));
                cliente.setNome(rs.getString("nome"));
                cliente.setCpf(rs.getString("cpf"));
            }
            rs.close();
            stmt.close();

            return cliente;

    }
}
