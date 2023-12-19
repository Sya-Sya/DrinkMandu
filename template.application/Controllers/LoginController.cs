using AutoMapper;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using template.application.Library;
using template.application.Models.Login;
using template.business.Login;
using template.domain.Models.Login;

namespace template.application.Controllers
{
    public class LoginController : Controller
    {
        private readonly ILoginBusiness _bus;
        private readonly IMapper mapper;
        private readonly IHttpContextAccessor _contextAccessor;
        public LoginController(ILoginBusiness bus, IMapper _map, IHttpContextAccessor contextAccessor)
        {
            _bus = bus;
            mapper = _map;
            _contextAccessor = contextAccessor;
        }

        #region for login 
        public ActionResult Index()
        {
            LoginModels model = new LoginModels();
            return View("Login", model);
        }

        [HttpPost]
        public JsonResult Login([FromBody] LoginModels model)
        {
            LoginCommon login = mapper.Map<LoginCommon>(model);
            login.Password = ApplicationUtilities.Encryption(model.Password);
            var UserAgent = _bus.LoginUser(login);

            if (UserAgent.Code == "1")
            {
                ViewData["Message"] = "Username or password is wrong ";
                return Json(model);
            }
            else
            {
                var response = UserAgent.Message;
                return Json(response);
            }
        }
        #endregion

        #region for dashboard
        [HttpGet]
        public IActionResult AgentDash()
        {
            LoginModels LM = new LoginModels();
            return View();
        }
        #endregion

        #region for Agent Profile
        public IActionResult AgentProfile(string UserId)
        {
            var data = _bus.GetProfileDetail(UserId);
            return View();
        }
        #endregion

        #region for forget password and otp
        [HttpGet]
        public IActionResult ForgertPassword()
        {
            return View();
        }

        [HttpGet]
        public IActionResult OTP()
        {
            return View();
        }
        #endregion

        public ActionResult Logout()
        {
            HttpContext.SignOutAsync();
            return RedirectToAction("Login");
        }
    }
}