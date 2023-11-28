using Microsoft.AspNetCore.Mvc;

namespace asp2.Controllers
{
    public class AccountController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
