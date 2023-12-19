using Google.Apis.Auth;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Diagnostics;
using template.application.Library;
using template.application.Models;
using template.application.Models.Login;

namespace template.application.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;

    }

    public IActionResult Index()
    {
        string? sessionData = HttpContext.Session.GetString("LoginModels");
        LoginModels? model1 = JsonConvert.DeserializeObject<LoginModels>(sessionData);
        List<ServiceDetailresponseModel> servicelistmodel = model1.ServiceList.MapObjects<ServiceDetailresponseModel>().ToList();
        return View("UserDetails", servicelistmodel);
    }

    [HttpPost]
    public async Task<IActionResult> signingoogle(string token)
    {
        var payload = await GoogleJsonWebSignature.ValidateAsync(token);
        HttpContext.Session.SetString("UserId", payload.Subject);
        return Ok();
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}