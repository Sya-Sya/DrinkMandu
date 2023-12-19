using Microsoft.AspNetCore.Mvc;

namespace template.application.Controllers
{
    public class ErrorController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}