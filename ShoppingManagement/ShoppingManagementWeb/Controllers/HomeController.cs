using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShoppingManagementWeb.Models;

namespace ShoppingManagementWeb.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
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
    }
}
