using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using template.application.Library;
using template.application.Models.Agent;
using template.business.Agent;
using template.domain.Agent;

namespace template.application.Controllers
{
    public class AddAgentController : Controller
    {
        private readonly IMapper mapper;
        private readonly IAgent agent;

        public AddAgentController(IAgent _agent, IMapper _map)
        {
            mapper = _map;
            agent = _agent;
        }

        [HttpGet]
        public ActionResult CreateAgent()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CreateAgent(Agent Ap)
        {
            AgentDomain agentDomain = agent.MapObject<AgentDomain>(Ap);
            var data = agent.AddAgent(agentDomain);
            return View();
        }

        [HttpGet]
        public ActionResult AgentList()
        {
            return View();
        }

        [HttpGet]
        public ActionResult DetailsAgent()
        {
            return View(DetailsAgent());
        }

        [HttpGet]
        public ActionResult RegisterAgent(Agent Agent)
        {
            return View(Agent);
        }

        [HttpPost]
        public JsonResult SaveAgent([FromBody] Agent AP)
        {
            if (ModelState.IsValid)
            {
                AgentDomain agentDomain = mapper.Map<AgentDomain>(AP);
                agentDomain.UserMobileNumber = AP.contact;
                agentDomain.Password = ApplicationUtilities.Encryption(AP.Password);
                var data = agent.RegisterAgent(agentDomain);
            }
            else
            {

            }
            return Json(AP);
        }
    }
}