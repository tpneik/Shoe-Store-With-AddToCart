using Microsoft.AspNetCore.Mvc;

namespace asp2.Components
{
    public class NavBar : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}
