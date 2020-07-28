package blazon.script.certification.campaign;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import blazon.script.certification.CampaignKey;
import blazon.script.util.ConnectionFactory;

public class ImportCertificationCampaigns {

	private final static Logger LOGGER = Logger.getLogger(ImportCertificationCampaigns.class.getName());
	
	private static Map<CampaignKey, Long> CampaignMapping = null;
	
	
	
	public static Map<CampaignKey, Long> getCampaignMapping() {
		
		if(CampaignMapping == null) {
			
			execute();
		}
		
		return CampaignMapping;
	}


	public static void main(String[] args) {
		
		long inicio = System.currentTimeMillis();
		
		execute();
		
		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");	
	}
	

	public static void execute() {
		
		LOGGER.log(Level.INFO, "Iniciando criação de Certification Campaigns ...");
		
		CampaignMapping = new HashMap<>();
		
		try {
			
			Connection conn = ConnectionFactory.getTargetConnection();
			
			Long campaignId = 1L;
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de papéis - 2019", "MEMBERSHIP_ROLE", null);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de direitos R12 - 2019", "MEMBERSHIP_ENTITLEMENT", 11L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de direitos SOMAR - 2019", "MEMBERSHIP_ENTITLEMENT", 13L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de direitos HYPERION - 2019", "MEMBERSHIP_ENTITLEMENT", 36L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do CSC ATENDE - ATENDENTE - 2019", "ACCOUNT", 4L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do CSC ATENDE - SOLICITANTE - 2019", "ACCOUNT", 5L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do EXPENSE MOBI (Aplicativo) - 2019", "ACCOUNT", 8L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do RDWEB - 2019", "ACCOUNT", 9L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do R12 - 2019", "ACCOUNT", 11L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do SOMAR - 2019", "ACCOUNT", 13L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do ESPAIDER - 2019", "ACCOUNT", 33L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do FTP - 2019", "ACCOUNT", 35L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do HYPERION - 2019", "ACCOUNT", 36L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do MASTERSAF SOMAR - 2019", "ACCOUNT", 38L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do MASTERSAF R12 - 2019", "ACCOUNT", 39L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do RECON - 2019", "ACCOUNT", 42L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do SVN - 2019", "ACCOUNT", 45L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do DOCUWARE - 2019", "ACCOUNT", 46L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do ONESOURCE TECH - 2019", "ACCOUNT", 48L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do ONESOURCE TELECOM - 2019", "ACCOUNT", 49L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do GESPLAN R12 - 2019", "ACCOUNT", 52L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do GESPLAN SOMAR - 2019", "ACCOUNT", 53L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do BANCO DE DADOS - QUALITP - 2019", "ACCOUNT", 64L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do BANCO DE DADOS - SCAPROD - 2019", "ACCOUNT", 65L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do BANCO DE DADOS - RECONP - 2019", "ACCOUNT", 66L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do LEMONTECH - 2019", "ACCOUNT", 75L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do RENOVAR_SOMARP_BALANCE - 2019", "ACCOUNT", 76L);
			
			createCampaign(conn, campaignId++, "Campanha de Certificação de contas do RENOVAR_R12P_BALANCE - 2019", "ACCOUNT", 77L);
			
			conn.commit();
			conn.close();
			
		}catch (Exception e) {
			
			LOGGER.log(Level.SEVERE, e.getMessage());

			e.printStackTrace();
		}
		
		LOGGER.info("Finalizado criação de Certification Campaigns!");
	}


	private static void createCampaign(Connection conn, Long id, String campaigName, String campaignType, Long resourceId) throws Exception {
		
		CampaignKey key = new CampaignKey(campaignType, resourceId);
		
		CampaignMapping.put(key, id);
		
		if(campaignAlreadyExist(conn, campaigName)) {
			
			return;
		}

		PreparedStatement statement = null;

		String sql = "INSERT INTO CampaignDefinition \n" + 
				"(id, name, description, finalizedAt, status)\n" + 
				"VALUES (?, ?, ?, ?, ?) ";

		statement = conn.prepareStatement(sql);

		statement.setLong(1, id);
		statement.setString(2, campaigName);
		statement.setString(3, campaigName);
		statement.setTimestamp(4, new java.sql.Timestamp(new Date().getTime()));
		statement.setString(5, "FINALIZED");

		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
			throw new RuntimeException("Insert instance failed, no rows affected.");
		}
		
		createInstance(conn, id, campaigName, campaignType, resourceId);
		
		LOGGER.info("Comando de insert OK pra campanha: " + campaigName);
	}
	
	
	private static boolean campaignAlreadyExist(Connection conn, String campaigName) throws SQLException {

		PreparedStatement statement = null;

		String sql = "select name from CampaignDefinition \n" + 
				"where name = ? \n" ;

		statement = conn.prepareStatement(sql);

		statement.setString(1, campaigName);

		ResultSet rs = statement.executeQuery();
		
		if(rs.next()) {
			
			return true;
		}
		
		return false;
	}


	private static void createInstance(Connection conn, Long id, String campaigName, String campaignType, Long resourceId) throws Exception {

		PreparedStatement statement = null;

		String sql = "INSERT INTO CampaignExecutionInstance \n" + 
				"(id, campaignId, name, finalizeDate, status)\n" + 
				"VALUES (?, ?, ?, ?, ?) ";

		statement = conn.prepareStatement(sql);

		statement.setLong(1, id);
		statement.setLong(2, id);
		statement.setString(3, campaigName);
		statement.setTimestamp(4, new java.sql.Timestamp(new Date().getTime()));
		statement.setString(5, "FINALIZED");

		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
			throw new RuntimeException("Insert instance failed, no rows affected.");
		}
	}
	
}
