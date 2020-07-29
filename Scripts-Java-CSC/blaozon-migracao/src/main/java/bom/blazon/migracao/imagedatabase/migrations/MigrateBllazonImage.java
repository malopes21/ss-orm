package bom.blazon.migracao.imagedatabase.migrations;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

import bom.blazon.migracao.imagedatabase.extract.ReadBlazonImage;
import bom.blazon.migracao.imagedatabase.loading.CreateBllazonImage;

public class MigrateBllazonImage {
	
	private Connection sourceConn;
	
	private Connection destinationConn;
	
	public MigrateBllazonImage(Connection sourceConn, Connection destinationConn) {
		
		this.sourceConn = sourceConn;
		this.destinationConn = destinationConn;
		
	}

	public void migrate() throws Exception {
		
		List<Map<String, Object>> sourceData = ReadBlazonImage.read(sourceConn);
		
		sourceData.stream().forEach(new Consumer<Map<String, Object>>() {

			@Override
			public void accept(Map<String, Object> data) {
				
				try {
					
					CreateBllazonImage.create(data, destinationConn);
					
				} catch (ClassNotFoundException | SQLException e) {
					
					System.out.println(String.format("Não foi possível criar o blazon image para: %s. (%s)",   data.get("id"), e.getMessage()));
					
				}
				
			}
		});
		
		destinationConn.commit();
				
	}
}