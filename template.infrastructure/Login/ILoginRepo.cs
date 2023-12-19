
using template.domain.Agent;
using template.domain;
using template.domain.Models.Login;

namespace template.infrastructure.Login
{
    public interface ILoginRepo
    {
        CommonDBResponse GetProfileDetail(string userId);
        CommonDBResponse LoginUser(LoginCommon common);
    }
}