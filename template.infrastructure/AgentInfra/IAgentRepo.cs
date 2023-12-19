using System.Threading.Tasks;
using template.domain;
using template.domain.Agent;

namespace template.infrastructure.AgentInfra
{
    public interface IAgentRepo
    {
        CommonDBResponse AddAgent(AgentDomain domain);
        CommonDBResponse RegisterAgent(AgentDomain domain);
    }
}