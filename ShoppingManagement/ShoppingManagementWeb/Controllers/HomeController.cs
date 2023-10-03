using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShoppingManagementWeb.Models;

namespace ShoppingManagementWeb.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult homePage()
        {
            ShoppingManagementContext con = new ShoppingManagementContext();
            //var st = con.Productions.ToList();
            var st = from p in con.Productions
                     join pc in con.ProductCategories
                     on p.ProductCategoryId equals pc.ProductCateId
                     select new
                     {
                         p.ProductId,
                         p.ProductName,
                         p.ProductQuantity,
                         p.ProductListPrice,
                         p.ProductSalePrice,
                         p.ProductInformation,
                         pc.CateName
                     };
            ViewData["st"] = st.ToList();
            return View();
        }
        public IActionResult loginForm()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            ShoppingManagementContext con = new ShoppingManagementContext();
            var st = con.Users.FirstOrDefault(u => u.Username == username);
            if (st != null)
            {
                if (st.Password == password)
                {
                    ViewBag.sucess = "Login successful";
                    HttpContext.Session.SetInt32("user", st.UserId);
                }
                else
                {
                    ViewBag.failure = "Login fail";
                }
            }
            else
            {
                ViewBag.failure = username;
            }
            return View("Login");
        }
    }
}
