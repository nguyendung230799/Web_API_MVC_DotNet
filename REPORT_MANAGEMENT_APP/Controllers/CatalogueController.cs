using REPORT_MANAGEMENT_CORE.Services;
using System.Web.Mvc;

namespace REPORT_MANAGEMENT_APP.Controllers
{
    [Authorize]
    public class CatalogueController : Controller
    {
        private readonly ICatalogueBudgetService catalogueBudgetService;
        public CatalogueController(ICatalogueBudgetService catalogueBudgetService)
        {
            this.catalogueBudgetService = catalogueBudgetService;
        }

        public ActionResult Index()
        {
            if (Request.IsAjaxRequest())
            {
                return PartialView();
            }
            else
            {
                return View("Index");
            }
        }

        public ActionResult CatalogueBudget()
        {
            return View();
        }

        public ActionResult CatalogueDepartment()
        {
            return View();
        }

    }
}
