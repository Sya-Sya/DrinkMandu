using Microsoft.AspNetCore.Mvc;
using template.application.Models.Agent;
using template.business.Agent;

namespace template.application.Controllers
{
    public class AgentAdminController : Controller
    {
        private readonly IAgent _agent;
        public AgentAdminController(IAgent agent)
        {
            _agent = agent;
        }

        [HttpGet]
        public IActionResult Dashboard()
        {
            return View();
        }
    }
}