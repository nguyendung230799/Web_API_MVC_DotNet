using System.Linq;
using System.Web.Mvc;

namespace REPORT_MANAGEMENT_APP
{
    public static class HTMLHelper
    {
        public static string ActiveClass(this HtmlHelper htmlHelper, string route)
        {
            var routeData = htmlHelper.ViewContext.RouteData;

            var controller = routeData?.Values["controller"]?.ToString();
            var action = routeData?.Values["action"]?.ToString();
            var routeArr = route.Split('/').ToArray();
            if (routeArr.Length > 1)
            {
                return (routeArr[0] == controller && routeArr[1] == action) ? "active" : "";
            } else
            {
                return (routeArr[0].StartsWith(controller) ? "active" : "");
            }
        }

        public static string ActiveClassWithTitle(this HtmlHelper htmlHelper, string title)
        {
            return title == (htmlHelper?.ViewData["Title"]?.ToString()) ? "text-primary" : "";
        }

        public static string GetTitle(this HtmlHelper htmlHelper)
        {
            return htmlHelper.ViewBag.Title ?? string.Empty;
        }
    }
}
