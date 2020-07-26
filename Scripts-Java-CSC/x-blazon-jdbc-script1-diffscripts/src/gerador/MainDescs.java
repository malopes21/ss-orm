package gerador;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;

public class MainDescs {

	   public static void main(String[] args) throws IOException{

	        try {
	        	
	        	String eventos = 
	        			"ANALYTICS_CERTIFICATION_CAMPAIGN_DETAIL_FACT\n" + 
	        			"ANALYTICS_CERTIFICATION_CAMPAIGN_POLICY_DIMENSION\n" + 
	        			"ANALYTICS_CERTIFICATION_CAMPAIGN_RESUME_FACT\n" + 
	        			"ANALYTICS_CERTIFICATION_EXECUTOR_FACT\n" + 
	        			"ANALYTICS_CERTIFICATION_EXECUTOR_INSTANCE_DIMENSION\n" + 
	        			"ANALYTICS_CERTIFICATION_EXECUTOR_USER_DIMENSION\n" + 
	        			"ANALYTICS_CERTIFICATION_MICRO_DETAIL_FACT\n" + 
	        			"ANALYTICS_CERTIFICATION_MICRO_RESUME_FACT\n" + 
	        			"ANALYTICS_CERTIFICATION_SELECTOR_DETAIL_FACT\n" + 
	        			"ANALYTICS_CERTIFICATION_SELECTOR_RESUME_FACT\n" + 
	        			"ANALYTICS_CERTIFICATION_SELECTOR_SELECTOR_DIMENSION\n" + 
	        			"ANALYTICS_CERTIFICATION_SELECTOR_USER_DIMENSION\n" + 
	        			"ANALYTICS_CERTIFICATION_TASK_FACT\n" + 
	        			"ANALYTICS_CERTIFICATION_TASK_INSTANCE_DIMENSION\n" + 
	        			"ANALYTICS_DIRECTORY_MANAGEMENT_DETAIL_FACT\n" + 
	        			"ANALYTICS_DIRECTORY_OBJECTS_CREATION_DETAIL_FACT\n" + 
	        			"ANALYTICS_DIRECTORY_OBJECTS_DETAIL_FACT\n" + 
	        			"ANALYTICS_DIRECTORY_OBJECTS_FACT\n" + 
	        			"ANALYTICS_DIRECTORY_RISK_DETAIL_FACT\n" + 
	        			"ANALYTICS_PROVISIONING_ENTRY_ENTRY_DIMENSION\n" + 
	        			"ANALYTICS_PROVISIONING_ENTRY_FACT\n" + 
	        			"ANALYTICS_PROVISIONING_ENTRY_OPERATION_DIMENSION\n" + 
	        			"ANALYTICS_PROVISIONING_ENTRY_TYPE_DIMENSION\n" + 
	        			"ANALYTICS_PROVISIONING_TASK_ENTRY_DIMENSION\n" + 
	        			"ANALYTICS_PROVISIONING_TASK_EXECUTOR_ENTRY_DIMENSION\n" + 
	        			"ANALYTICS_PROVISIONING_TASK_EXECUTOR_FACT\n" + 
	        			"ANALYTICS_PROVISIONING_TASK_EXECUTOR_TYPE_DIMENSION\n" + 
	        			"ANALYTICS_PROVISIONING_TASK_EXECUTOR_USER_DIMENSION\n" + 
	        			"ANALYTICS_PROVISIONING_TASK_FACT\n" + 
	        			"ANALYTICS_PROVISIONING_TASK_QUEUE_ENTRY_DIMENSION\n" + 
	        			"ANALYTICS_PROVISIONING_TASK_QUEUE_FACT\n" + 
	        			"ANALYTICS_PROVISIONING_TASK_QUEUE_NAME_DIMENSION\n" + 
	        			"ANALYTICS_PROVISIONING_TASK_QUEUE_TYPE_DIMENSION\n" + 
	        			"ANALYTICS_PROVISIONING_TASK_TYPE_DIMENSION\n" + 
	        			"ANALYTICS_RECONCILIATION_RESUME_BATCH_DIMENSION\n" + 
	        			"ANALYTICS_RECONCILIATION_RESUME_FACT\n" + 
	        			"ANALYTICS_RECONCILIATION_RESUME_PROFILE_DIMENSION\n" + 
	        			"ANALYTICS_RECONCILIATION_RESUME_RESOURCE_DIMENSION\n" + 
	        			"ANALYTICS_RECONCILIATION_SITUATION_BATCH_DIMENSION\n" + 
	        			"ANALYTICS_RECONCILIATION_SITUATION_ENTRY_TYPE_DIMENSION\n" + 
	        			"ANALYTICS_RECONCILIATION_SITUATION_FACT\n" + 
	        			"ANALYTICS_RECONCILIATION_SITUATION_PROFILE_DIMENSION\n" + 
	        			"ANALYTICS_RECONCILIATION_SITUATION_RESOURCE_DIMENSION\n" + 
	        			"ANALYTICS_REQUEST_APPROVAL_TASK_ENTRY_DIMENSION\n" + 
	        			"ANALYTICS_REQUEST_APPROVAL_TASK_EXECUTOR_ENTRY_DIMENSION\n" + 
	        			"ANALYTICS_REQUEST_APPROVAL_TASK_EXECUTOR_FACT\n" + 
	        			"ANALYTICS_REQUEST_APPROVAL_TASK_EXECUTOR_TYPE_DIMENSION\n" + 
	        			"ANALYTICS_REQUEST_APPROVAL_TASK_EXECUTOR_USER_DIMENSION\n" + 
	        			"ANALYTICS_REQUEST_APPROVAL_TASK_FACT\n" + 
	        			"ANALYTICS_REQUEST_APPROVAL_TASK_TYPE_DIMENSION\n" + 
	        			"ANALYTICS_REQUEST_RESUME_ENTRYTYPE_DIMENSION\n" + 
	        			"ANALYTICS_REQUEST_RESUME_FACT\n" + 
	        			"ANALYTICS_REQUEST_RESUME_TYPE_DIMENSION\n" + 
	        			"Account\n" + 
	        			"AccountNotificationSettings\n" + 
	        			"AccountPasswordVault\n" + 
	        			"ApprovalPolicy\n" + 
	        			"ApprovalTaskDetail\n" + 
	        			"AssignmentDirectoryEntry\n" + 
	        			"AssignmentEntry\n" + 
	        			"AssignmentPolicy\n" + 
	        			"AssignmentRoleRevokeEntry\n" + 
	        			"AssignmentRoleRevokeRole\n" + 
	        			"AssignmentRoleRevokeUser\n" + 
	        			"AssociationRule\n" + 
	        			"AttributeMap\n" + 
	        			"AttributeMapping\n" + 
	        			"AttributeMapping_AttributeMap\n" + 
	        			"AuthenticationMethodsNotificationSettings\n" + 
	        			"AuthenticationPolicy\n" + 
	        			"AuthenticationPolicyParameters\n" + 
	        			"AuthenticationSourceKerberos\n" + 
	        			"AuthenticationSourceLDAP\n" + 
	        			"AuthenticationSourceOpenId\n" + 
	        			"AuthenticationSourceSaml\n" + 
	        			"BlazonAccessManagerSession\n" + 
	        			"BlazonAccessManagerSessionAttributes\n" + 
	        			"BlazonRequest\n" + 
	        			"BlazonRequestApprovalTask\n" + 
	        			"BlazonRequestDirectoryEntry\n" + 
	        			"BlazonRequestNotificationSettings\n" + 
	        			"BlazonRequestSodApprovalTask\n" + 
	        			"BlazonRequestTransitionState\n" + 
	        			"BlazonRequest_dependsOnIds\n" + 
	        			"BllazonImage\n" + 
	        			"CampaignDefinition\n" + 
	        			"CampaignDefinition_CertificationPolicy\n" + 
	        			"CampaignExecutionInstance\n" + 
	        			"CampaignExecutionInstance_CertificationEntry\n" + 
	        			"CertificationApprovalTask\n" + 
	        			"CertificationApprovalTaskDetail\n" + 
	        			"CertificationDirectoryEntry\n" + 
	        			"CertificationEntry\n" + 
	        			"CertificationEntryTransitionState\n" + 
	        			"CertificationNotificationSettings\n" + 
	        			"CertificationPolicy\n" + 
	        			"CertificationSelector\n" + 
	        			"ChangeApplicationAccountOwnerAccount\n" + 
	        			"ChangeApplicationAccountOwnerEntry\n" + 
	        			"ChangeApplicationAccountOwnerEntry_actions\n" + 
	        			"ChangeApplicationAccountOwnerUser\n" + 
	        			"ChangePasswordAccount\n" + 
	        			"ChangePasswordAccountEntry\n" + 
	        			"ChangePasswordResource\n" + 
	        			"ChangePasswordUser\n" + 
	        			"CheckinAdminAccountPasswordVault\n" + 
	        			"CreatedBy\n" + 
	        			"Dictionary\n" + 
	        			"DictionaryWord\n" + 
	        			"Domain\n" + 
	        			"EmailQueueEntry\n" + 
	        			"EmailQueueEntry_attachments\n" + 
	        			"EmailQueueEntry_cc\n" + 
	        			"Entitlement\n" + 
	        			"Entitlement_User\n" + 
	        			"Entry\n" + 
	        			"EntryAttribute\n" + 
	        			"EntryAttributeCategory\n" + 
	        			"EntryAttributeValue\n" + 
	        			"EventSetting\n" + 
	        			"ExpirationOptions\n" + 
	        			"Groupp\n" + 
	        			"Groupp_InternalPermissionGroup\n" + 
	        			"Groupp_User\n" + 
	        			"ImportBatch\n" + 
	        			"ImportBatchUser\n" + 
	        			"ImportEntry\n" + 
	        			"InactiveUserAccountRuleConfiguration\n" + 
	        			"Inbox\n" + 
	        			"InternalPermission\n" + 
	        			"InternalPermissionGroup\n" + 
	        			"InternalPermissionGroup_InternalPermission\n" + 
	        			"Job\n" + 
	        			"JobExecution\n" + 
	        			"JobInstance\n" + 
	        			"LogginModuleSettings\n" + 
	        			"ManagedBy\n" + 
	        			"ManagedBy_objectIds\n" + 
	        			"MembershipEntitlement\n" + 
	        			"MembershipEntitlementNotificationSettings\n" + 
	        			"MembershipRole\n" + 
	        			"MembershipRoleNotificationSettings\n" + 
	        			"MfaSettings\n" + 
	        			"MicroCertificationExecutionInstance\n" + 
	        			"MicroCertificationExecutionInstance_CertificationEntry\n" + 
	        			"NetworkConfig\n" + 
	        			"NotificationSettings\n" + 
	        			"OAuthAccessToken\n" + 
	        			"OAuthApiClient\n" + 
	        			"OAuthClient\n" + 
	        			"OAuthCode\n" + 
	        			"OS_CURRENTSTEP\n" + 
	        			"OS_CURRENTSTEP_PREV\n" + 
	        			"OS_GROUP\n" + 
	        			"OS_HISTORYSTEP\n" + 
	        			"OS_HISTORYSTEP_PREV\n" + 
	        			"OS_MEMBERSHIP\n" + 
	        			"OS_PROPERTYENTRY\n" + 
	        			"OS_USER\n" + 
	        			"OS_WFENTRY\n" + 
	        			"OS_WORKFLOWDEFS\n" + 
	        			"OtpTimeBasedConfiguration\n" + 
	        			"OtpTimeBasedUserKey\n" + 
	        			"Parameter\n" + 
	        			"PasswordHistory\n" + 
	        			"PasswordPolicy\n" + 
	        			"PasswordPolicySettings\n" + 
	        			"PasswordVaultEntry\n" + 
	        			"PasswordVaultEntryAttribute\n" + 
	        			"PasswordVaultNotificationSettings\n" + 
	        			"PasswordVaultOwner\n" + 
	        			"PasswordVaultShare\n" + 
	        			"PasswordVaultWebScript\n" + 
	        			"ProfileSituation\n" + 
	        			"ProvisioningDirectoryEntry\n" + 
	        			"ProvisioningEntry\n" + 
	        			"ProvisioningEntryTransitionState\n" + 
	        			"ProvisioningNotificationSettings\n" + 
	        			"ProvisioningParameters\n" + 
	        			"ProvisioningTask\n" + 
	        			"ProvisioningTaskDetail\n" + 
	        			"QRTZ_BLOB_TRIGGERS\n" + 
	        			"QRTZ_CALENDARS\n" + 
	        			"QRTZ_CRON_TRIGGERS\n" + 
	        			"QRTZ_FIRED_TRIGGERS\n" + 
	        			"QRTZ_JOB_DETAILS\n" + 
	        			"QRTZ_LOCKS\n" + 
	        			"QRTZ_PAUSED_TRIGGER_GRPS\n" + 
	        			"QRTZ_SCHEDULER_STATE\n" + 
	        			"QRTZ_SIMPLE_TRIGGERS\n" + 
	        			"QRTZ_SIMPROP_TRIGGERS\n" + 
	        			"QRTZ_TRIGGERS\n" + 
	        			"ReconciliationAction\n" + 
	        			"ReconciliationAction_entryTypes\n" + 
	        			"ReconciliationAction_situationNames\n" + 
	        			"ReconciliationBatchEntry\n" + 
	        			"ReconciliationDirectoryEntry\n" + 
	        			"ReconciliationEntry\n" + 
	        			"ReconciliationEntryTransitionState\n" + 
	        			"ReconciliationEntry_matchedEntriesIds\n" + 
	        			"ReconciliationEntry_matchedOwnersIds\n" + 
	        			"ReconciliationNotificationSettings\n" + 
	        			"ReconciliationProfile\n" + 
	        			"ReconciliationProfile_AttributeMap\n" + 
	        			"RemoveSharedAccountMembershipEntry\n" + 
	        			"Resource\n" + 
	        			"ResourceAdapter\n" + 
	        			"ResourceAdapter_instances\n" + 
	        			"ResourceCategory\n" + 
	        			"ResourceProvisioningProfile\n" + 
	        			"Resource_User\n" + 
	        			"Rightt\n" + 
	        			"Rightt_Entitlement\n" + 
	        			"Role\n" + 
	        			"RoleRightApprovalPolicy\n" + 
	        			"RoleRightApprovalTask\n" + 
	        			"RoleRightApprovalTaskDetail\n" + 
	        			"RoleRightDirectoryEntry\n" + 
	        			"RoleRightEntry\n" + 
	        			"RoleRightEntryItem\n" + 
	        			"RoleRightEntry_RoleRightEntryItem\n" + 
	        			"RoleRightRevokeDirectoryEntry\n" + 
	        			"RoleRightRevokeEntry\n" + 
	        			"RoleRightRevokeNotificationSettings\n" + 
	        			"Role_User\n" + 
	        			"SAMLSession\n" + 
	        			"SamlAuthenticationClient\n" + 
	        			"SamlAuthenticationClient_attributes\n" + 
	        			"SecretQuestion\n" + 
	        			"SecureChannelOtpConfiguration\n" + 
	        			"SecureChannelToken\n" + 
	        			"SelectorExecutionInstance\n" + 
	        			"SelectorExecutionInstance_CertificationEntry\n" + 
	        			"SelfServiceCart\n" + 
	        			"SelfServiceCartInstanceItem\n" + 
	        			"SelfServiceCartItem\n" + 
	        			"ServerMailSetup\n" + 
	        			"SharedAccountAccount\n" + 
	        			"SharedAccountMembership\n" + 
	        			"SharedAccountUser\n" + 
	        			"SituationDef\n" + 
	        			"SituationDef_entryTypes\n" + 
	        			"SodApprovalTask\n" + 
	        			"SodApprovalTaskDetail\n" + 
	        			"SodDirectoryEntry\n" + 
	        			"SodEntry\n" + 
	        			"SodEntryTransitionState\n" + 
	        			"SodNotificationSettings\n" + 
	        			"SodPolicy\n" + 
	        			"SodSettings\n" + 
	        			"SodTaskDetail\n" + 
	        			"Task\n" + 
	        			"TaskAssignHistory\n" + 
	        			"TaskComment\n" + 
	        			"TaskDefinition\n" + 
	        			"TaskEscalation\n" + 
	        			"TaskEscalationDefinition\n" + 
	        			"TaskQueue\n" + 
	        			"TaskQueueAssignHistory\n" + 
	        			"TaskQueue_Groupp\n" + 
	        			"TaskQueue_Task\n" + 
	        			"User\n" + 
	        			"UserAccessDetail\n" + 
	        			"UserDevice\n" + 
	        			"UserNotificationSettings\n" + 
	        			"UserTask\n" + 
	        			"UsernamePasswordCredentialsVaultItem\n" + 
	        			"UsernamePolicy\n" + 
	        			"VaultEntryPermission\n" + 
	        			"WebHook" ;
	        	
	        	BufferedReader reader = new BufferedReader(new StringReader(eventos));
	        	
	        	String line = reader.readLine();
	        	
	        	String fileName = "descsZeroBlazon.sql";
	        	
	        	PrintWriter out = new PrintWriter("saida/" + fileName);
	        	
	        	while(line != null) {
	        		
	        		line = line.trim();
	        		
	        		if(line.length() > 0) {
	        			
	        			String tableName = line.split(" ")[0];
	        		
	    	            out.write("\nSELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE table_name = '"+tableName+"';\n" + 
	    	            		"desc " + tableName + " ;\n");

	    	            
	        		}
	        		line = reader.readLine();
	        	}
	        	
	        	out.flush();
	            out.close();
	            
	            System.out.println("OK");

	        } catch (FileNotFoundException e) {
	            e.printStackTrace();
	        }
	    }

	    private static String toUpperCaseFirstChar(String idImagem) {
	        String firstUpper = idImagem.substring(0, 1).toUpperCase();
	        String tail = idImagem.substring(1, idImagem.length());
	        return firstUpper + tail;
	    }
	    
	    private static String toLowerCaseFirstChar(String idImagem) {
	        String firstLower = idImagem.substring(0, 1).toLowerCase();
	        String tail = idImagem.substring(1, idImagem.length());
	        return firstLower + tail;
	    }
}
