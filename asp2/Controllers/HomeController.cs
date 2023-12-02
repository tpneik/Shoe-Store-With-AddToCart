using asp2.Data;
using asp2.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace asp2.Controllers
{
    public class HomeController : Controller
    {
        //private readonly ILogger<HomeController> _logger;

        //public HomeController(ILogger<HomeController> logger)
        //{
        //    _logger = logger;
        //}

        private readonly ApplicationDbContext _context;

        public HomeController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            ViewBag.ShowRow = true;
            var _product = _context.Products.Take(12);
            return View(_product);
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