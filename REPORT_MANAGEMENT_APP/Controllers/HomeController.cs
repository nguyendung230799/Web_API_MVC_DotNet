using System.Web.Mvc;

namespace REPORT_MANAGEMENT_APP.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        public HomeController() { }
        public ActionResult Index()
        {
            ViewBag.Title = "Trang chủ";
            return View();
        }
    }
}
