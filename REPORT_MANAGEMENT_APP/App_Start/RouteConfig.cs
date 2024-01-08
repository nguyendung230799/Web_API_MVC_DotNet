using System.Web.Mvc;
using System.Web.Routing;

namespace REPORT_MANAGEMENT_APP
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Report", action = "Self", id = UrlParameter.Optional }
            );
        }
    }
}
