using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using template.domain.Models.Login;
using template.domain;
using template.infrastructure.Login;
using System.Reflection.Metadata.Ecma335;

namespace template.business.Login
{
    public class LoginServices : ILoginBusiness
    {
        private readonly ILoginRepo repo;
        public LoginServices(ILoginRepo _repo)
        {
            repo = _repo;
        }

        public CommonDBResponse LoginUser(LoginCommon model)
        {
            return repo.LoginUser(model);
        }

        public CommonDBResponse GetProfileDetail(string UserId)
        {
            return repo.GetProfileDetail(UserId);
        }
    }
}