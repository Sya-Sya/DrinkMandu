using Newtonsoft.Json;
using Pango;
using System.ComponentModel.DataAnnotations;
using template.domain;

namespace template.application.Models.Login
{
    public class LoginModels : CommonDBResponse
    {
        [Required]
        [MaxLength(50, ErrorMessage = "Username should be maximum 50 characters")]
        public string UserName { get; set; }
        [Required]
        [MaxLength(16, ErrorMessage = "Password should be maximum 16 characters")]
        [MinLength(8, ErrorMessage = "Password should be minimum 8 characters")]
        public string Password { get; set; }
        public string actionIp { get; set; }
        public string FirstTimeLogin { get; set; }
        public string FullName { get; set; }
        public string adminRemarks { get; set; }
        public string MobileNo { get; set; }
        public string agentLogo { get; set; }
        public string AgentId { get; set; }
        public string forcedPasswordMessage { get; set; }
        public string RoleId { get; set; }
        public string SessionId { get; set; }
        public string createdLocalDate { get; set; }
        public string isPasswordForceful { get; set; }
        public string isMpinForceful { get; set; }
        public string isEmailVerified { get; set; }
        public string isemailverificationStatus { get; set; }
        public string userEmail { get; set; }
        public string UserId { get; set; }
        public string UserType { get; set; }
        public string profileImage { get; set; }
        public string FirstName { get; set; }
        public List<ServiceDetailresponseModel> ServiceList { get; set; } = new();
    }
}