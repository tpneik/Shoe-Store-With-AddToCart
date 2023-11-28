using asp2.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace asp2.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            ViewBag.ShowRow = true;
            return View();
        }

        public IActionResult About()
        {
            ViewBag.ShowAbout = true;
            return View();
        }

        public IActionResult Contact()
        {
            //ViewBag.ShowAbout = true;
            return View();
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
}