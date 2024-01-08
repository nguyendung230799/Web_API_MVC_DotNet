using System.Web.Mvc;

namespace REPORT_MANAGEMENT_APP.Controllers
{
    [Authorize]
    public class StatisticController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}