using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using template.domain;
using template.domain.Agent;
using template.infrastructure.AgentInfra;

namespace template.business.Agent
{
    public class AgentBusiness : IAgent
    {
        private readonly IAgentRepo _repo;
        public AgentBusiness(IAgentRepo repo)
        {
            _repo = repo;

        }

        public CommonDBResponse AddAgent(AgentDomain domain)
        {
            return _repo.AddAgent(domain);
        }

        public CommonDBResponse RegisterAgent(AgentDomain domain)
        {
            return _repo.RegisterAgent(domain);
        }
    }
}