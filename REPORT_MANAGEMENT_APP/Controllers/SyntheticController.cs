using System.Web.Mvc;

namespace REPORT_MANAGEMENT_APP.Controllers
{
    [Authorize]
    public class SyntheticController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}