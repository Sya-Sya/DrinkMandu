using Microsoft.AspNetCore.Mvc;

namespace DrinkMandu.application.Controllers
{
    public class OrderReportController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}