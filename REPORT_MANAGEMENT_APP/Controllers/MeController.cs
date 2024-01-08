using AutoMapper;
using Microsoft.AspNet.Identity.Owin;
using REPORT_MANAGEMENT_APP.Models;
using REPORT_MANAGEMENT_CORE.Data.Domains;
using REPORT_MANAGEMENT_CORE.Services;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Helpers;
using System.Web.Http;

namespace REPORT_MANAGEMENT_APP.Controllers
{
    [Authorize]
    public class MeController : ApiController
    {
        private readonly ICatalogueBudgetService catalogueBudgetService;
        private readonly ICatalogueDepartmentService catalogueDepartmentService;
        private readonly string _webRootPath;
        private readonly IUserService userService;
        private ApplicationUserManager userManager;
        private ApplicationRoleManager roleManager;
        private readonly IMapper mapper;

        public ApplicationUserManager UserManager
        {
            get
            {
                return userManager ?? Request.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                userManager = value;
            }
        }

        public ApplicationRoleManager RoleManager
        {
            get
            {
                return roleManager ?? Request.GetOwinContext().GetUserManager<ApplicationRoleManager>();
            }
            private set
            {
                roleManager = value;
            }
        }


        public MeController(ICatalogueBudgetService catalogueBudgetService, IUserService userService, IMapper mapper, ICatalogueDepartmentService catalogueDepartmentService)
        {
            this.catalogueBudgetService = catalogueBudgetService;
            this.userService = userService;
            this.mapper = mapper;
            this.catalogueDepartmentService = catalogueDepartmentService;
            _webRootPath = ConfigurationManager.AppSettings["FilePath"];
        }

        [HttpGet]
        [Authorize(Users = "admin@viettel.com.vn")]
        public string Index()
        {
            return "Hello";
        }

        [Route("api/Me/GetReportSize")]
        public IHttpActionResult GetReportSize()
        {
            string path = Path.Combine(_webRootPath, "uploads/");
            DirectoryInfo dirInfo = new DirectoryInfo(path);
            var fileCount = CountFile(dirInfo).ToString();
            var fileSize = (DirSize(dirInfo) / 1024f / 1024f).ToString("0.00");
            return Json(new
            {
                fileCount,
                fileSize
            });
        }

        [HttpGet]
        [Authorize(Roles = nameof(Roles.Moderator))]
        [Route("api/Me/GetCatalogue")]
        public IHttpActionResult GetCatalogue()
        {
            try
            {
                var catalogue = catalogueBudgetService.FindAll().OrderBy(x => x.CodeChain).Take(1000);
                var catalogueModel = mapper.Map<List<CatalogueBudgetModel>>(catalogue);
                return Json(catalogueModel);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }

        [HttpGet]
        [Authorize(Roles = nameof(Roles.Moderator))]
        [Route("api/Me/GetDepartment")]
        public IHttpActionResult GetDepartment()
        {
            try
            {
                var catalogue = catalogueDepartmentService.FindAll();
                var catalogueModel = mapper.Map<List<CatalogueDepartmentModel>>(catalogue);
                return Json(catalogueModel);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }

        [HttpGet]
        [Route("api/Me/GetRole")]
        public IHttpActionResult GetRole()
        {
            try
            {
                var role = RoleManager.Roles.Select(x => x.Name).Except(new List<string> { nameof(Roles.Administrator) }).ToList();
                return Json(role);

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        [Route("api/Me/GetAgency")]
        public IHttpActionResult GetAgency()
        {
            try
            {
                var claims = (User.Identity as ClaimsIdentity).Claims;
                var name = claims.FirstOrDefault(x => x.Type == ClaimTypes.Name).Value;
                var user = userService.FindByName(name);

                var agencies = userService.FindAll().Where(x => x.Id != user.Id && !string.IsNullOrEmpty(x.Name) && !string.IsNullOrEmpty(x.Code)).Select(x => new
                {
                    x.Id,
                    x.Name,
                    x.Code,
                });
                return Json(agencies);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }

        [HttpPost]
        [Authorize(Roles = nameof(Roles.Moderator))]
        public async Task AddClaim()
        {
            var claims = (User.Identity as ClaimsIdentity).Claims;
            var name = claims.FirstOrDefault(x => x.Type == ClaimTypes.Name).Value;
            var user = userService.FindByName(name);

            string id = HttpContext.Current.Request.Form["modal-id"]?.ToString() ?? string.Empty;
            string type = HttpContext.Current.Request.Form["modal-type"]?.ToString() ?? string.Empty;
            if (Guid.TryParse(id, out Guid userId))
            {
                var claim = await UserManager.GetClaimsAsync(userId);

                if (type == "revoke")
                {
                    await UserManager.AddClaimAsync(userId, new Claim(nameof(Claims.Rejected), nameof(Claims.Rejected)));
                }
                else if (type == "reset-password")
                {
                    var token = await UserManager.GeneratePasswordResetTokenAsync(userId);
                    var userNew = await UserManager.ResetPasswordAsync(userId, token, Constants.AUTH_ADMIN);
                }
                else if (type == "approve" || type == "cancel")
                {
                    if (!claim.Any(x => x.Type == nameof(Claims.Approved)))
                    {
                        await UserManager.AddClaimAsync(userId, new Claim(nameof(Claims.Approved), nameof(Claims.Approved)));
                    }
                    else
                    {
                        await UserManager.RemoveClaimAsync(userId, new Claim(nameof(Claims.Approved), nameof(Claims.Approved)));
                    }
                }
            }
        }

        [HttpPost]
        public async Task<long> RequestApproval()
        {
            var claims = (User.Identity as ClaimsIdentity).Claims;
            var name = claims.FirstOrDefault(x => x.Type == ClaimTypes.Name).Value;
            var user = userService.FindByName(name);
            var claim = user.Claims;

            string agency = HttpContext.Current.Request.Form["AgencyName"]?.ToString() ?? string.Empty;
            string code = HttpContext.Current.Request.Form["AgencyCode"]?.ToString() ?? string.Empty;
            string department = HttpContext.Current.Request.Form["ListDepartmentSelected"]?.ToString() ?? string.Empty;
            string role = HttpContext.Current.Request.Form["role"]?.ToString() ?? string.Empty;
            string parent = HttpContext.Current.Request.Form["parent"]?.ToString() ?? string.Empty;
            string policy = HttpContext.Current.Request.Form["policy"]?.ToString() ?? string.Empty;

            if (string.IsNullOrEmpty(policy) || policy != "agree")
            {
                if (!string.IsNullOrEmpty(agency)) user.Name = agency;
                if (!string.IsNullOrEmpty(code)) user.Code = code;
                if (!string.IsNullOrEmpty(department)) user.Department = department;
                userService.Update(user);
            }
            else if (claim.Any(x => x.ClaimType == nameof(Claims.RequestApproval)))
            {
                if (!string.IsNullOrEmpty(parent) && Guid.TryParse(parent, out Guid parentId)) user.ParentId = parentId;
                userService.Update(user);
                await UserManager.RemoveFromRoleAsync(user.Id, role);
                await UserManager.AddToRoleAsync(user.Id, role);
                return 1;
            }
            else
            {
                if (!string.IsNullOrEmpty(parent) && Guid.TryParse(parent, out Guid parentId)) user.ParentId = parentId;
                userService.Update(user);
                await UserManager.RemoveFromRoleAsync(user.Id, role);
                await UserManager.AddToRoleAsync(user.Id, role);
                await UserManager.AddClaimAsync(user.Id, new Claim(nameof(Claims.RequestApproval), nameof(Claims.RequestApproval)));
                return 1;
            }
            return 0;
        }

        [HttpPost]
        public long CheckClaim()
        {
            var claims = (User.Identity as ClaimsIdentity).Claims;
            var name = claims.FirstOrDefault(x => x.Type == ClaimTypes.Name).Value;
            var user = userService.FindByName(name);
            var claim = user.Claims;

            if (claim.Select(x => x.ClaimType).Contains(nameof(Claims.Approved)))
            {
                return 3;
            }
            else if (claim.Select(x => x.ClaimType).Contains(nameof(Claims.RequestApproval)))
            {
                return 2;
            }
            else if (!string.IsNullOrEmpty(user.Name) && !string.IsNullOrEmpty(user.Code) && !string.IsNullOrEmpty(user.Department))
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }

        [HttpGet]
        [Route("api/Me/GetUserRoles")]
        [Authorize(Roles = nameof(Roles.Administrator))]
        public IHttpActionResult GetUserRoles(int? page, int rowsPerPage = 10)
        {
            try
            {
                var users = userService.FindPaginated(page.Value - 1, rowsPerPage);
                var agencies = mapper.Map<List<UserRoleModel>>(users.Item1);
                int total = users.Item2;
                var grid = new WebGrid(agencies, canPage: false, canSort: false);
                var htmlString = grid.GetHtml(
                    tableStyle: "webGrid table table-nomargin table-bordered",
                    headerStyle: "header",
                    alternatingRowStyle: "alt",
                    htmlAttributes: new { id = "DataTable" },
                    columns: grid.Columns(
                        grid.Column(header: "", format: e => new HtmlString("<input type='checkbox' />"), style: "ajax_table_checkbox"),
                        grid.Column("Ordinal", header: "STT", style: "ajax_table_ordinal"),
                        grid.Column("Hometown", "Đơn vị"),
                        grid.Column(header: "Trạng thái", format: x => new HtmlString(x.Status)),
                        grid.Column("Danh sách quyền", format: e =>
                        {
                            if (e.RolesName is string item)
                            {
                                var roleList = item.Split(',').Select(x => x.Trim()).ToList();
                                roleList = roleList.Select(x =>
                                {
                                    x = $"<span class='label'>{x}</span>";
                                    return x;
                                }).ToList();
                                return new HtmlString(string.Join("", roleList));
                            }
                            else return "";
                        }),
                        grid.Column("Email", header: "Email", style: "ajax_table_email"),
                        grid.Column(header: "Thao tác", style: "ajax_table_action", format: e => new HtmlString(
                            !e.IsApproved ?
                            $"<a href='#' class='btn btn-mini btn-info' rel='tooltip' title='Chi tiết' data-original-title='Default Tooltip' onclick=onDetail('{e.UserId}','{e.Email}')><i class='icon-exclamation-sign bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' rel='tooltip' title='Sửa' onclick=onEdit('{e.UserId}','{e.Email}')><i class='icon-pencil bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' rel='tooltip' title='Đặt lại mật khẩu' onclick=onResetPassword('{e.UserId}','{e.Email}')><i class='icon-undo bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' rel='tooltip' title='Xem tệp tin' onclick=onReport('{e.UserId}','{e.Email}')><i class='icon-file-alt bigger-120'></i></a>" +
                            $"<a href='/Manage/ManageRole?userId={e.UserId}' rel='tooltip' title='Cấu hình quyền' class='btn btn-mini btn-info'><i class='icon-cog bigger-120'></i></a>" +
                            $"<a href='#' rel='tooltip' title='Kiểm duyệt' class='btn btn-mini btn-info' onclick=onApprove('{e.UserId}','{e.Email}')><i class='icon-ok bigger-120'></i></a>" +
                            $"<a href='#' rel='tooltip' title='Thu hồi' onclick=onRevoke('{e.UserId}','{e.Email}') class='btn btn-mini btn-info'><i class='icon-hand-down bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' rel='tooltip' title='Xóa' onclick=onDelete('{e.UserId}','{e.Email}')><i class='icon-trash bigger-120'></i></a>" :
                            $"<a href='#' class='btn btn-mini btn-info' rel='tooltip' title='Chi tiết' data-original-title='Default Tooltip' onclick=onDetail('{e.UserId}','{e.Email}')><i class='icon-exclamation-sign bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' rel='tooltip' title='Sửa' onclick=onEdit('{e.UserId}','{e.Email}')><i class='icon-pencil bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' rel='tooltip' title='Đặt lại mật khẩu' onclick=onResetPassword('{e.UserId}','{e.Email}')><i class='icon-undo bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' rel='tooltip' title='Xem tệp tin' onclick=onReport('{e.UserId}','{e.Email}')><i class='icon-file-alt bigger-120'></i></a>" +
                            $"<a href='/Manage/ManageRole?userId={e.UserId}' rel='tooltip' title='Cấu hình quyền' class='btn btn-mini btn-info'><i class='icon-cog bigger-120'></i></a>" +
                            $"<a href='#' rel='tooltip' title='Từ chối' onclick=onCancel('{e.UserId}','{e.Email}') class='btn btn-mini btn-info'><i class='icon-remove bigger-120'></i></a>" +
                            $"<a href='#' rel='tooltip' title='Thu hồi' onclick=onRevoke('{e.UserId}','{e.Email}') class='btn btn-mini btn-info'><i class='icon-hand-down bigger-120'></i></a>" +
                            $"<a href='#' rel='tooltip' title='Xóa' onclick=onDelete('{e.UserId}','{e.Email}') class='btn btn-mini btn-info'><i class='icon-trash bigger-120'></i></a>"
                        ))
                    )
                 );

                return Json(new
                {
                    Data = htmlString.ToHtmlString(),
                    Total = total,
                    Pagination = Math.Ceiling((double)total / rowsPerPage),
                });

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }

        [HttpGet]
        [Route("api/Me/GetChildrenUsers")]
        public async Task<IHttpActionResult> GetChildrenUsersAsync(int? page, int rowsPerPage = 10, bool status = true)
        {
            try
            {
                var claims = (User.Identity as ClaimsIdentity).Claims;
                var name = claims.FirstOrDefault(x => x.Type == ClaimTypes.Name).Value;
                var user = userService.FindByName(name);
                var role = await UserManager.GetRolesAsync(user.Id);
                (IEnumerable<ApplicationUser>, int) users;
                if (role.Contains(nameof(Roles.Administrator)))
                {
                    users = userService.FindPaginated(page.Value - 1, rowsPerPage, status);
                }
                else
                {
                    users = userService.FindPaginatedChildren(user.Id, page.Value - 1, rowsPerPage, status);
                }

                var agencies = mapper.Map<List<UserModel>>(users.Item1);
                int total = users.Item2;
                var grid = new WebGrid(agencies, canPage: false, canSort: false);
                var htmlString = grid.GetHtml(
                    tableStyle: "webGrid table table-nomargin table-bordered",
                    headerStyle: "header",
                    alternatingRowStyle: "alt",
                    htmlAttributes: new { id = "DataTable" },
                    columns: grid.Columns(
                        grid.Column(header: "", format: e => new HtmlString("<input type='checkbox' />"), style: "ajax_table_checkbox"),
                        grid.Column("Ordinal", header: "STT"),
                        grid.Column("Email", header: "Email", style: "ajax_table_email"),
                        grid.Column(header: "Trạng thái", format: x => new HtmlString(x.Status)),
                        grid.Column("Hometown", header: "Đơn vị", style: "ajax_table_hometown"),
                        grid.Column(header: "Thao tác", style: "ajax_table_action", format: e =>
                        new HtmlString(e.IsRejected ?
                            $"<a href='#' class='btn btn-mini btn-info' rel='tooltip' title='Chi tiết' onclick=onDetail('{e.Id}','{e.Email}')><i class='icon-exclamation-sign bigger-120'></i></a>" :
                            e.IsApproved ?
                            $"<a href='#' class='btn btn-mini btn-info' rel='tooltip' title='Chi tiết' onclick=onDetail('{e.Id}','{e.Email}')><i class='icon-exclamation-sign bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' rel='tooltip' title='Từ chối' onclick=onCancel('{e.Id}','{e.Email}')><i class='icon-remove bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' rel='tooltip' title='Thu hồi' onclick=onRevoke('{e.Id}','{e.Email}')><i class='icon-hand-down bigger-120'></i></a>" :
                            $"<a href='#' class='btn btn-mini btn-info' rel='tooltip' title='Chi tiết' onclick=onDetail('{e.Id}','{e.Email}')><i class='icon-exclamation-sign bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' rel='tooltip' title='Kiểm duyệt' onclick=onApprove('{e.Id}','{e.Email}')><i class='icon-ok bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' rel='tooltip' title='Thu hồi' onclick=onRevoke('{e.Id}','{e.Email}')><i class='icon-hand-down bigger-120'></i></a>"
                        ))
                    )
                 );

                return Json(new
                {
                    Data = htmlString.ToHtmlString(),
                    Total = total,
                    Pagination = Math.Ceiling((double)total / rowsPerPage),
                });

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }

        private async Task<bool> IsApproved()
        {
            var claimToken = (User.Identity as ClaimsIdentity).Claims;
            var name = claimToken.FirstOrDefault(x => x.Type == ClaimTypes.Name).Value;
            var user = await UserManager.FindByNameAsync(name);
            var claims = await UserManager.GetClaimsAsync(user.Id);
            return claims.Any(x => x.Value == nameof(Claims.Approved));
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }

        private long DirSize(DirectoryInfo d)
        {
            long size = 0;
            FileInfo[] fis = d.GetFiles();
            foreach (FileInfo fi in fis)
            {
                size += fi.Length;
            }
            DirectoryInfo[] dis = d.GetDirectories();
            foreach (DirectoryInfo di in dis)
            {
                size += DirSize(di);
            }
            return size;
        }

        private long CountFile(DirectoryInfo d)
        {
            long size = 0;
            FileInfo[] fis = d.GetFiles();
            size += fis.Length;
            DirectoryInfo[] dis = d.GetDirectories();
            foreach (DirectoryInfo di in dis)
            {
                size += CountFile(di);
            }
            return size;
        }
    }
}