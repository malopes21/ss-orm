package bom.blazon.migracao.imagedatabase.loading;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;

public class CreateBllazonImage {

	public static void create(Map<String, Object> image, Connection conn) throws ClassNotFoundException, SQLException {

		String sql = "INSERT INTO blazon.BllazonImage (id, description, image, name) VALUES(?, ?, ?, ?);";

		PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

		stmt.setObject(1, image.get("id"));
		stmt.setObject(2, image.get("description"));
		stmt.setObject(3, image.get("image"));
		stmt.setObject(4, image.get("name"));

		stmt.execute();

	}

}
