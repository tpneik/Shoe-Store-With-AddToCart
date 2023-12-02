//using asp1.Models;
using asp2.Data;
using asp2.Infrastructure;
using asp2.Models;
using Microsoft.AspNetCore.Mvc;
using NuGet.Protocol.Core.Types;

namespace asp2.Controllers
{
    public class CartController : Controller
    {
        public Cart? Cart { get; set; }

        private readonly ApplicationDbContext _context;

        public CartController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Cart_apper()
        {
            Cart = HttpContext.Session.GetJson<Cart>("cart") ?? new Cart();
            HttpContext.Session.SetJson("cart", Cart);
            return View("Cart", Cart);
        }
        public IActionResult AddToCart(int productID)
        {
            Product? product = _context.Products
                .FirstOrDefault(p => p.ProductId == productID);
            if (product != null)
            {

                Cart = HttpContext.Session.GetJson<Cart>("cart") ?? new Cart();
                Cart.AddItem(product, 1);
                HttpContext.Session.SetJson("cart", Cart);
            }
            return View("Cart", Cart);
        }
        public IActionResult RemoveFromCart(int productID)
        {
            Product? product = _context.Products
                .FirstOrDefault(p => p.ProductId == productID);
            if (product != null)
            {
                Cart = HttpContext.Session.GetJson<Cart>("cart");
                Cart.RemoveLine(product);
                HttpContext.Session.SetJson("cart", Cart);
            }
            return View("Cart", Cart);
        }

        public IActionResult RemoveItemFromCart(int productID)
        {
            Product? product = _context.Products
                .FirstOrDefault(p => p.ProductId == productID);
            if (product != null)
            {
                Cart = HttpContext.Session.GetJson<Cart>("cart");
                Cart.RemoveItem(product, 1);
                HttpContext.Session.SetJson("cart", Cart);
            }
            return View("Cart", Cart);
        }

    }
}
