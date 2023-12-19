using System.Threading.Tasks;
using template.domain;
using template.domain.Models.Login;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace template.infrastructure.Login
{
    public class LoginRepo : ILoginRepo
    {
        RepositoryDao Dao;

        public LoginRepo(RepositoryDao dao)
        {
            Dao = dao;
        }

        public CommonDBResponse GetProfileDetail(string userId)
        {
            LoginCommon lc = new LoginCommon();
            string sql = "Usp_AgentUserList";
            sql += " @flag='s'";
            sql += ", @UserId=" + Dao.FilterString(userId);
            var dt = Dao.ExecuteDataRow(userId);
            if (dt != null)
            {
                lc.UserName = dt["Username"].ToString();
                lc.userEmail = dt["email"].ToString();
                lc.MobileNo = dt["mobileno"].ToString();
            }
            return lc;
        }

        public CommonDBResponse LoginUser(LoginCommon model)
        {
            LoginCommon r = new LoginCommon();
            var sql = "sproc_User_login @flag='login',@user_name=" + Dao.FilterString(model.MobileNo) + ",@password=" + Dao.FilterString(model.Password);
            var dt = Dao.ExecuteDataRow(sql);

            if (dt != null)
            {
                string code = Dao.ParseColumnValue(dt, "code").ToString();
                string message = Dao.ParseColumnValue(dt, "message").ToString();
                if ((code ?? "1") != "0")
                {
                    r.Code = CommonDBResponse.Failed;
                    r.Message = message;
                    r.Code = code;
                }
                else
                {
                    r.UserId = model.UserId;
                    r.SessionId = model.SessionId;
                    r.UserName = model.UserName;
                    r.UserId = model.MobileNo;
                    r.Code = CommonDBResponse.Success;
                    r.Message = message;
                    r.Code = code;
                    return r;
                }
            }
            else
            {
                r.Code = CommonDBResponse.Failed;
                r.Message = "Login Failed!";
            }
            return r;
        }
    }
}