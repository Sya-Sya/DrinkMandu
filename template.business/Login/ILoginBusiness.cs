using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using template.domain;
using template.domain.Models.Login;

namespace template.business.Login
{
    public interface ILoginBusiness
    {
        CommonDBResponse LoginUser(LoginCommon model);
        CommonDBResponse GetProfileDetail(String UserId = "");
    }
}