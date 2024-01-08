using System.Web.Optimization;

namespace REPORT_MANAGEMENT_APP
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                "~/Scripts/jquery.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                "~/Scripts/jquery.unobtrusive*",
                "~/Scripts/jquery.validate*"));

            bundles.Add(new ScriptBundle("~/bundles/knockout").Include(
                "~/Scripts/knockout-{version}.js",
                "~/Scripts/knockout.validation.js"));

            bundles.Add(new ScriptBundle("~/bundles/app").Include(
                "~/Scripts/sammy-{version}.js",
                "~/Scripts/app/common.js",
                "~/Scripts/app/app.datamodel.js",
                "~/Scripts/app/app.viewmodel.js",
                "~/Scripts/app/home.viewmodel.js",
                "~/Scripts/app/_run.js"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                "~/Scripts/plugins/jquery-ui/jquery.ui.core.min.js",
                "~/Scripts/plugins/jquery-ui/jquery.ui.widget.min.js",
                "~/Scripts/plugins/jquery-ui/jquery.ui.mouse.min.js",
                "~/Scripts/plugins/jquery-ui/jquery.ui.resizable.min.js",
                "~/Scripts/plugins/jquery-ui/jquery.ui.spinner.min.js",
                "~/Scripts/plugins/jquery-ui/jquery.ui.slider.min.js",

                "~/Scripts/plugins/slimscroll/jquery.slimscroll.min.js",
                "~/Scripts/bootstrap.min.js",

                "~/Scripts/plugins/bootbox/jquery.bootbox.js",
                "~/Scripts/plugins/form/jquery.form.min.js",

                "~/Scripts/plugins/validation/jquery.validate.min.js",
                "~/Scripts/plugins/validation/additional-methods.min.js",
                "~/Scripts/plugins/wizard/jquery.form.wizard.min.js",

                "~/Scripts/plugins/maskedinput/jquery.maskedinput.min.js",
                "~/Scripts/plugins/tagsinput/jquery.tagsinput.min.js",
                "~/Scripts/plugins/datepick/bootstrap-datepicker.js",
                "~/Scripts/plugins/timepicker/bootstrap-timepicker.js",
                "~/Scripts/plugins/colorpicker/bootstrap-colorpicker.js",
                "~/Scripts/plugins/chosen/chosen.jquery.min.js",
                "~/Scripts/plugins/multiselect/jquery.multi-select.js",
                "~/Scripts/plugins/ckeditor/ckeditor.js",
                "~/Scripts/plugins/plupload/plupload.full.js",
                "~/Scripts/plugins/plupload/jquery.plupload.queue.js",
                "~/Scripts/plugins/fileupload/bootstrap-fileupload.min.js",


                "~/Scripts/plugins/datatable/jquery.dataTables.min.js",
                "~/Scripts/plugins/datatable/TableTools.min.js",
                "~/Scripts/plugins/datatable/ColReorder.min.js",
                "~/Scripts/plugins/datatable/ColVis.min.js",


                "~/Scripts/plugins/chosen/chosen.jquery.min.js",
                "~/Scripts/plugins/gritter/jquery.gritter.min.js",
                "~/Scripts/plugins/treeselect/tree.js",


                "~/Scripts/app/main.js",
                "~/Scripts/handsontable/handsontable.full.min.js",
                "~/Scripts/eakroko.js",
                "~/Scripts/application.min.js",
                "~/Scripts/demonstration.min.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                 "~/Content/bootstrap.min.css",
                 "~/Content/bootstrap-responsive.min.css",
                 "~/Content/plugins/jquery-ui/smoothness/jquery-ui.css",
                 "~/Content/plugins/jquery-ui/smoothness/jquery-ui.theme.css",


                 "~/Content/plugins/gritter/jquery.gritter.css",
                 "~/Content/plugins/pageguide/pageguide.css",
                 "~/Content/plugins/fullcalendar/fullcalendar.css",
                 "~/Content/plugins/fullcalendar/fullcalendar.print.css",



                 "~/Content/plugins/tagsinput/jquery.tagsinput.css",
                 "~/Content/plugins/multiselect/multi-select.css",
                 "~/Content/plugins/timepicker/bootstrap-timepicker.min.css",
                 "~/Content/plugins/colorpicker/colorpicker.css",
                 "~/Content/plugins/datepicker/datepicker.css",
                 "~/Content/plugins/plupload/jquery.plupload.queue.css",

                 "~/Content/plugins/datatable/TableTools.css",
                 "~/Content/plugins/chosen/chosen.css",
                 "~/Content/plugins/treeselect/treeselectjs.css",
                 "~/Content/style.css",
                 "~/Content/main.css",
                 "~/Content/font-awesome.min.css",
                 "~/Content/handsontable.full.min.css"));
        }
    }
}
