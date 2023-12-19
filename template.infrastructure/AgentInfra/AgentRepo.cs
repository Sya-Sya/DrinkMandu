using System.Threading.Tasks;
using template.domain;
using template.domain.Agent;

namespace template.infrastructure.AgentInfra
{
    public class AgentRepo : IAgentRepo
    {
        private RepositoryDao _DAO;
        public AgentRepo(RepositoryDao dao)
        {
            _DAO = dao;
        }

        public CommonDBResponse AddAgent(AgentDomain AC)
        {
            string sql = "sproc_agent_Detail ";
            sql += "@flag='" + (string.IsNullOrEmpty(AC.AgentID) ? "i" : "u") + "'";
            sql += " ,@agent_type='Agent'";
            sql += " ,@AgentName=" + _DAO.FilterString(AC.AgentName);
            sql += " ,@agent_id=" + _DAO.FilterString(AC.AgentID);
            sql += " ,@AgentOperationType=" + _DAO.FilterString(AC.AgentOperationType);
            sql += " ,@agent_commission_type=" + AC.AgentCommissionType;
            sql += " ,@agent_country=" + _DAO.FilterString(AC.AgentCountry);
            sql += " ,@agent_province=" + _DAO.FilterString(AC.AgentProvince);
            sql += " ,@agent_district=" + _DAO.FilterString(AC.AgentDistrict);
            sql += " ,@agent_local_body=" + _DAO.FilterString(AC.AgentVDC_Muncipality);
            sql += " ,@agent_ward_number=" + _DAO.FilterString(AC.AgentWardNo);
            sql += " ,@agent_street=" + _DAO.FilterString(AC.AgentStreet);
            //temporary Address
            sql += " ,@TemporaryAgentCountry=" + _DAO.FilterString(AC.TemporaryAgentCountry);
            sql += " ,@TemporaryAgentProvince=" + _DAO.FilterString(AC.TemporaryAgentProvince);
            sql += " ,@TemporaryAgentDistrict=" + _DAO.FilterString(AC.TemporaryAgentDistrict);
            sql += " ,@TemporaryAgentVDC_Muncipality=" + _DAO.FilterString(AC.TemporaryAgentVDC_Muncipality);
            sql += " ,@TemporaryAgentWardNo=" + _DAO.FilterString(AC.TemporaryAgentWardNo);
            sql += " ,@TemporaryAgentStreet=" + _DAO.FilterString(AC.TemporaryAgentStreet);
            //user info
            sql += " ,@user_id=" + _DAO.FilterString(AC.UserID);
            sql += " ,@first_name=" + _DAO.FilterString(AC.FirstName);
            sql += " ,@middle_name=" + _DAO.FilterString(AC.MiddleName);
            sql += " ,@last_name=" + _DAO.FilterString(AC.LastName);
            //contact Person
            sql += " ,@contact_person_name=" + _DAO.FilterString(AC.ContactPersonName);
            sql += " ,@contact_person_mobile_number=" + _DAO.FilterString(AC.ContactPersonMobileNumber);
            sql += " ,@contact_person_ID_type=" + _DAO.FilterString(AC.ContactPersonIdType);
            sql += " ,@contact_person_ID_no=" + _DAO.FilterString(AC.ContactPersonIdNumber);
            sql += " ,@contact_person_id_issue_district=" + _DAO.FilterString(AC.ContactPersonIdIssueDistrict);
            sql += " ,@contact_person_Id_issue_date=" + _DAO.FilterString(AC.ContactPersonIdIssueDate);
            sql += " ,@contact_person_id_issue_date_nepali=" + _DAO.FilterString(AC.ContactPersonIdIssueDate_BS);
            sql += " ,@contact_person_id_expiry_date=" + _DAO.FilterString(AC.ContactPersonIdExpiryDate);
            sql += " ,@contact_person_id_expiry_date_nepali=" + _DAO.FilterString(AC.ContactPersonIdExpiryDate_BS);
            sql += " ,@contactPersonIdImg=" + _DAO.FilterString(AC.ContactPersonIdCertificate);
            sql += " ,@action_user=" + _DAO.FilterString(AC.ActionUser);
            sql += " ,@action_ip=" + _DAO.FilterString(AC.IpAddress);

            if (!string.IsNullOrEmpty(AC.Password))
            {
                sql += " ,@password=" + _DAO.FilterString(AC.Password);
                sql += " ,@confirm_password=" + _DAO.FilterString(AC.ConfirmPassword);
            }
            else
            {
                sql += " ,@agent_mobile_no=" + _DAO.FilterString(AC.UserMobileNumber);
                sql += " ,@agent_email=" + _DAO.FilterString(AC.UserEmail);
            }
            return _DAO.ParseCommonDbResponse(sql);
        }

        public CommonDBResponse RegisterAgent(AgentDomain domain)
        {
            var sql = "Exec Usp_RegisterUser @flag='i'";
            sql += ", @FullName= " + _DAO.FilterString(domain.FirstName);
            sql += ",@FullAddress = " + _DAO.FilterString(domain.Address);
            sql += ",@Email = " + _DAO.FilterString(domain.UserEmail);
            sql += ",@Password   = " + _DAO.FilterString(domain.Password);
            sql += ",@ContactNumber    = " + _DAO.FilterString(domain.UserMobileNumber);
            return _DAO.ParseCommonDbResponse(sql);
        }
    }
}