using AutoMapper;
using template.application.Models.Agent;
using template.application.Models.Login;
using template.domain.Agent;
using template.domain.Models.Login;

namespace template.application.Extension
{
    public class AgentProfileMap : Profile
    {
        public AgentProfileMap()
        {
            CreateMap<LoginCommon, LoginModels>().ReverseMap();
            CreateMap<AgentDomain, Agent>().ReverseMap();
        }
    }
}