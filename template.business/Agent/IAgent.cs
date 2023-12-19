using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using template.domain;
using template.domain.Agent;

namespace template.business.Agent
{
    public interface IAgent
    {
        CommonDBResponse AddAgent(AgentDomain domain);
        CommonDBResponse RegisterAgent(AgentDomain domain);
    }
}