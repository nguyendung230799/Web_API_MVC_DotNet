using AutoMapper;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using MimeKit;
using Newtonsoft.Json;
using REPORT_MANAGEMENT_APP.Models;
using REPORT_MANAGEMENT_CORE.Data.Domains;
using REPORT_MANAGEMENT_CORE.Data.Model;
using REPORT_MANAGEMENT_CORE.Data.Query;
using REPORT_MANAGEMENT_CORE.Repositories;
using REPORT_MANAGEMENT_CORE.Services;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Helpers;
using System.Web.Http;
using System.Web.Http.Description;
using File = REPORT_MANAGEMENT_CORE.Data.Domains.File;

namespace REPORT_MANAGEMENT_APP.Controllers
{
    [Authorize]
    public class ReportAPIController : ApiController
    {
        private readonly ILogger<ReportAPIController> _logger;
        private readonly IMapper _mapper;
        private readonly string _webRootPath;
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;
        private ApplicationRoleManager _roleManager;

        private readonly IFileService _fileService;
        private readonly IUnitOfWork _unitOfWork;


        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? Request.GetOwinContext().Get<ApplicationSignInManager>();
            }
            private set
            {
                _signInManager = value;
            }
        }

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? Request.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        public ApplicationRoleManager RoleManager
        {
            get
            {
                return _roleManager ?? Request.GetOwinContext().GetUserManager<ApplicationRoleManager>();
            }
            private set
            {
                _roleManager = value;
            }
        }

        public ReportAPIController(
            ILogger<ReportAPIController> logger,
            IFileService fileService,
            IUnitOfWork unitOfWork,
            IMapper mapper)
        {
            _logger = logger;
            _mapper = mapper;
            _fileService = fileService;
            _unitOfWork = unitOfWork;
            _webRootPath = ConfigurationManager.AppSettings["FilePath"];
        }

        [HttpGet]
        [Authorize(Roles = nameof(Roles.Moderator))]
        [Route("api/ReportAPI/FindAllReportsByParent")]
        [ResponseType(typeof(ReportDetailModel))]
        public async Task<IHttpActionResult> FindAllReportsByParentAsync(int? page, int rowsPerPage = 10)
        {
            try
            {
                var claims = (User.Identity as ClaimsIdentity).Claims;
                var name = claims.FirstOrDefault(x => x.Type == ClaimTypes.Name).Value;
                var user = await UserManager.FindByNameAsync(name);

                var reports = _fileService.FindAllReportsByParent(user.Id, page ?? 0, rowsPerPage);
                int total = reports.FirstOrDefault()?.Total ?? 0;

                var grid = new WebGrid(reports, canPage: false, canSort: false);
                var htmlString = grid.GetHtml(
                    tableStyle: "webGrid table table-nomargin table-bordered",
                    headerStyle: "header",
                    alternatingRowStyle: "alt",
                    htmlAttributes: new { id = "DataTable" },
                    columns: grid.Columns(
                        grid.Column(header: "", format: e => new HtmlString("<input type='checkbox' />"), style: "ajax_table_checkbox"),
                        grid.Column("Ordinal", header: "STT", style: "ajax_table_ordinal"),
                        grid.Column("FileName", "Tên báo cáo"),
                        grid.Column("FileDescription", "Mô tả"),
                        grid.Column("SubModule", "Phân hệ"),
                        grid.Column("TimeModuleDisplay", "Thời gian"),
                        grid.Column(header: "Thao tác", style: "ajax_table_action", format: e => new HtmlString(
                            $"<a href='#' class='btn btn-mini btn-info' onclick=onDetail('{e.Id}','{e.FileName}') rel='tooltip' title='Xem chi tiết'><i class='icon-exclamation-sign bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' onclick=onReview('{e.Id}','{e.FileName}') rel='tooltip' title='Xem lịch sử'><i class='icon-time bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' onclick=onEdit('{e.Id}','{e.FileName}') rel='tooltip' title='Chỉnh sửa'><i class='icon-pencil bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' onclick=onDelete('{e.Id}','{e.FileName}') rel='tooltip' title='Xóa'><i class='icon-trash bigger-120'></i></a>" +
                            $"<a href='/Report/OnGetDownloadFileFromFolder?fileID={e.FileId}&tokenKey={e.HashTokenKey}' rel='tooltip' title='Tải về' class='btn btn-mini btn-info'><i class='icon-download-alt bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' onclick=onRevoke('{e.Id}','{e.FileName}') rel='tooltip' title='Thu hồi'><i class='icon-hand-down bigger-120'></i></a>"
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
        [Authorize(Roles = nameof(Roles.Moderator))]
        [Route("api/ReportAPI/FindAllReports")]
        [ResponseType(typeof(ReportDetailModel))]
        public async Task<IHttpActionResult> FindAllReports(int? page, int rowsPerPage = 10)
        {
            try
            {
                var claims = (User.Identity as ClaimsIdentity).Claims;
                var name = claims.FirstOrDefault(x => x.Type == ClaimTypes.Name).Value;
                var user = await UserManager.FindByNameAsync(name);
                var role = await UserManager.GetRolesAsync(user.Id);
                List<FileFilterQuery> reports;

                if (role.Contains(nameof(Roles.Administrator)))
                {
                    reports = _fileService.FindAllReports(page ?? 0, rowsPerPage);
                }
                else
                {
                    reports = _fileService.FindAllReports(user.Id, page ?? 0, rowsPerPage);
                }

                int total = reports.FirstOrDefault()?.Total ?? 0;

                var grid = new WebGrid(reports, canPage: false, canSort: false);
                var htmlString = grid.GetHtml(
                    tableStyle: "webGrid table table-nomargin table-bordered",
                    headerStyle: "header",
                    alternatingRowStyle: "alt",
                    htmlAttributes: new { id = "DataTable" },
                    columns: grid.Columns(
                        grid.Column(header: "", format: e => new HtmlString("<input type='checkbox' />"), style: "ajax_table_checkbox"),
                        grid.Column("Ordinal", header: "STT", style: "ajax_table_ordinal"),
                        grid.Column("FileName", "Tên báo cáo"),
                        grid.Column("FileDescription", "Mô tả"),
                        grid.Column("SubModule", "Phân hệ"),
                        grid.Column("TimeModuleDisplay", "Thời gian"),
                        grid.Column(header: "Thao tác", style: "ajax_table_action", format: e => new HtmlString(
                            $"<a href='#' class='btn btn-mini btn-info' onclick=onDetail('{e.Id}','{e.FileName}') rel='tooltip' title='Xem chi tiết'><i class='icon-exclamation-sign bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' onclick=onReview('{e.Id}','{e.FileName}') rel='tooltip' title='Xem lịch sử'><i class='icon-time bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' onclick=onEdit('{e.Id}','{e.FileName}') rel='tooltip' title='Chỉnh sửa'><i class='icon-pencil bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' onclick=onDelete('{e.Id}','{e.FileName}') rel='tooltip' title='Xóa'><i class='icon-trash bigger-120'></i></a>" +
                            $"<a href='/Report/OnGetDownloadFileFromFolder?fileID={e.FileId}&tokenKey={e.HashTokenKey}' rel='tooltip' title='Tải về' class='btn btn-mini btn-info'><i class='icon-download-alt bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' onclick=onRevoke('{e.Id}','{e.FileName}') rel='tooltip' title='Thu hồi'><i class='icon-hand-down bigger-120'></i></a>"
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
        [Route("api/ReportAPI/FindAllWrongReports")]
        [ResponseType(typeof(ReportDetailModel))]
        public async Task<IHttpActionResult> FindAllWrongReports(int? page, int rowsPerPage = 10)
        {
            try
            {
                var claims = (User.Identity as ClaimsIdentity).Claims;
                var name = claims.FirstOrDefault(x => x.Type == ClaimTypes.Name).Value;
                var user = await UserManager.FindByNameAsync(name);
                var role = await UserManager.GetRolesAsync(user.Id);
                List<FileFilterQuery> reports;

                if (role.Contains(nameof(Roles.Administrator)))
                {
                    reports = _fileService.FindAllWrongReports(null, page ?? 0, rowsPerPage);
                }
                else
                {
                    reports = _fileService.FindAllWrongReports(user.Id, page ?? 0, rowsPerPage);
                }

                int total = reports.FirstOrDefault()?.Total ?? 0;

                var grid = new WebGrid(reports, canPage: false, canSort: false);
                var htmlString = grid.GetHtml(
                    tableStyle: "webGrid table table-nomargin table-bordered",
                    headerStyle: "header",
                    alternatingRowStyle: "alt",
                    htmlAttributes: new { id = "DataTable" },
                    columns: grid.Columns(
                        grid.Column(header: "", format: e => new HtmlString("<input type='checkbox' />"), style: "ajax_table_checkbox"),
                        grid.Column("Ordinal", header: "STT", style: "ajax_table_ordinal"),
                        grid.Column("FileName", "Tên báo cáo"),
                        grid.Column("FileDescription", "Mô tả"),
                        grid.Column("SubModule", "Phân hệ"),
                        grid.Column("TimeModuleDisplay", "Thời gian"),
                        grid.Column(header: "Thao tác", style: "ajax_table_action", format: e => new HtmlString(
                            $"<a href='#' class='btn btn-mini btn-info' onclick=onDetail('{e.Id}','{e.FileName}') rel='tooltip' title='Xem chi tiết'><i class='icon-exclamation-sign bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' onclick=onReview('{e.Id}','{e.FileName}') rel='tooltip' title='Xem lịch sử'><i class='icon-time bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' onclick=onEdit('{e.Id}','{e.FileName}') rel='tooltip' title='Chỉnh sửa'><i class='icon-pencil bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' onclick=onDelete('{e.Id}','{e.FileName}') rel='tooltip' title='Xóa'><i class='icon-trash bigger-120'></i></a>" +
                            $"<a href='/Report/OnGetDownloadFileFromFolder?fileID={e.FileId}&tokenKey={e.HashTokenKey}' rel='tooltip' title='Tải về' class='btn btn-mini btn-info'><i class='icon-download-alt bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' onclick=onRevoke('{e.Id}','{e.FileName}') rel='tooltip' title='Thu hồi'><i class='icon-hand-down bigger-120'></i></a>"
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
        [Route("api/ReportAPI/FindAllInActiveReports")]
        [ResponseType(typeof(ReportDetailModel))]
        public async Task<IHttpActionResult> FindAllInActiveReports(int? page, int rowsPerPage = 10)
        {
            try
            {
                var claims = (User.Identity as ClaimsIdentity).Claims;
                var name = claims.FirstOrDefault(x => x.Type == ClaimTypes.Name).Value;
                var user = await UserManager.FindByNameAsync(name);
                var role = await UserManager.GetRolesAsync(user.Id);
                List<FileFilterQuery> reports;

                if (role.Contains(nameof(Roles.Administrator)))
                {
                    reports = _fileService.FindAllInActiveReports(null, page ?? 0, rowsPerPage);
                }
                else
                {
                    reports = _fileService.FindAllInActiveReports(user.Id, page ?? 0, rowsPerPage);
                }

                int total = reports.FirstOrDefault()?.Total ?? 0;

                var grid = new WebGrid(reports, canPage: false, canSort: false);
                var htmlString = grid.GetHtml(
                    tableStyle: "webGrid table table-nomargin table-bordered",
                    headerStyle: "header",
                    alternatingRowStyle: "alt",
                    htmlAttributes: new { id = "DataTable" },
                    columns: grid.Columns(
                        grid.Column(header: "", format: e => new HtmlString("<input type='checkbox' />"), style: "ajax_table_checkbox"),
                        grid.Column("Ordinal", header: "STT", style: "ajax_table_ordinal"),
                        grid.Column("FileName", "Tên báo cáo"),
                        grid.Column("FileDescription", "Mô tả"),
                        grid.Column("SubModule", "Phân hệ"),
                        grid.Column("TimeModuleDisplay", "Thời gian"),
                        grid.Column(header: "Thao tác", style: "ajax_table_action", format: e => new HtmlString(
                            $"<a href='#' class='btn btn-mini btn-info' onclick=onDetail('{e.Id}','{e.FileName}') rel='tooltip' title='Xem chi tiết'><i class='icon-exclamation-sign bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' onclick=onReview('{e.Id}','{e.FileName}') rel='tooltip' title='Xem lịch sử'><i class='icon-time bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' onclick=onEdit('{e.Id}','{e.FileName}') rel='tooltip' title='Chỉnh sửa'><i class='icon-pencil bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' onclick=onDelete('{e.Id}','{e.FileName}') rel='tooltip' title='Xóa'><i class='icon-trash bigger-120'></i></a>" +
                            $"<a href='/Report/OnGetDownloadFileFromFolder?fileID={e.FileId}&tokenKey={e.HashTokenKey}' rel='tooltip' title='Tải về' class='btn btn-mini btn-info'><i class='icon-download-alt bigger-120'></i></a>" +
                            $"<a href='#' class='btn btn-mini btn-info' onclick=onRevoke('{e.Id}','{e.FileName}') rel='tooltip' title='Thu hồi'><i class='icon-hand-down bigger-120'></i></a>"
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

        [HttpPost]
        [Authorize(Roles = nameof(Roles.Moderator))]
        [Route("api/ReportAPI/Filter")]
        //[ActionName("Filter")]
        [ResponseType(typeof(ReportDetailModel))]
        public async Task<IHttpActionResult> FindAllReports([FromBody] FileFilterModel file)
        {
            var claims = (User.Identity as ClaimsIdentity).Claims;
            var name = claims.FirstOrDefault(x => x.Type == ClaimTypes.Name).Value;
            var user = await UserManager.FindByNameAsync(name);
            if (user != null && await IsApproved(user))
            {
                file.AgencyParentId = user.Id;
                return Ok(_fileService.FindAllReports(file));
            }

            return BadRequest();
        }

        [HttpGet]
        [Authorize]
        public async Task<IHttpActionResult> GetFile([FromUri] Guid id)
        {
            if (!await IsApproved()) return InternalServerError();
            var datum = _fileService.FindReport(id);
            if (datum == null) return NotFound();
            else
            {
                //Build the File Path.  
                string path = Path.Combine(
                    _webRootPath,
                    "uploads/",
                    datum.FolderPath ?? string.Empty,
                    datum.FilePath ?? string.Empty
                    );

                //Read the File data into Byte Array.  
                byte[] bytes = System.IO.File.ReadAllBytes(path);
                string mimeType = MimeTypes.GetMimeType(path);

                var result = new HttpResponseMessage(HttpStatusCode.OK)
                {
                    Content = new ByteArrayContent(bytes)
                };

                result.Content.Headers.ContentDisposition =
                    new ContentDispositionHeaderValue("Attachment")
                    {
                        FileName = datum.FilePath
                    };

                result.Content.Headers.ContentType =
                    new MediaTypeHeaderValue(mimeType);

                return ResponseMessage(result);

                //Send the File to Download.  
                //return File(bytes, "application/octet-stream", fileName);
            }
        }

        [HttpPost]
        [Authorize(Roles = nameof(Roles.Moderator))]
        public async Task<IHttpActionResult> PostFile()
        {
            if (!await IsApproved()) return InternalServerError();
            var claims = (User.Identity as ClaimsIdentity).Claims;
            var name = claims.FirstOrDefault(x => x.Type == ClaimTypes.Name).Value;
            var user = await UserManager.FindByNameAsync(name);
            var claim = await UserManager.GetClaimsAsync(user.Id);
            if (claim == null) return NotFound();
            var file = HttpContext.Current.Request.Files[0];
            if (file == null) return BadRequest();

            string description = HttpContext.Current.Request.Form["description"]?.ToString() ?? string.Empty;
            string module = HttpContext.Current.Request.Form["module"]?.ToString() ?? string.Empty;
            string moduleName = HttpContext.Current.Request.Form["moduleName"]?.ToString() ?? string.Empty;
            string subModule = HttpContext.Current.Request.Form["subModule"]?.ToString() ?? string.Empty;
            string subModuleName = HttpContext.Current.Request.Form["subModuleName"]?.ToString() ?? string.Empty;
            string department = HttpContext.Current.Request.Form["department"]?.ToString() ?? string.Empty;
            string quarter = HttpContext.Current.Request.Form["quarter"]?.ToString();
            int yearOfWork = Convert(HttpContext.Current.Request.Form["yearOfWork"]?.ToString());
            int yearOfBudget = Convert(HttpContext.Current.Request.Form["yearOfBudget"]?.ToString());
            int sourceOfBudget = Convert(HttpContext.Current.Request.Form["sourceOfBudget"]?.ToString());
            int typeOfSettlement = Convert(HttpContext.Current.Request.Form["typeOfSettlement"]?.ToString());
            string tokenKey = HttpContext.Current.Request.Form["tokenKey"]?.ToString() ?? string.Empty;


            var fileMetaData = new FileMetadata(module, subModule, department, typeOfSettlement, quarter)
            {
                Id = Guid.NewGuid(),
                TimeModule = quarter,
                YearOfWork = yearOfWork,
                YearOfBudget = yearOfBudget,
                SourceOfBudget = sourceOfBudget,
                TypeModule = typeOfSettlement,
                TokenKey = tokenKey
            };
            _logger.LogInformation($"UploadFile {file.FileName}");

            if (user != null)
            {
                const bool AllowLimitSize = true;
                const bool AllowLimitFileType = true;
                const int limitFileSize = 10485760;


                var listFileError = new List<FileUploadInfoModel>();
                var responseData = new ResponseDataModel();
                string result;

                if (file == null)
                {
                    responseData.Status = Status.Error;
                    responseData.Message = $"Please, select file to upload.";
                    result = JsonConvert.SerializeObject(responseData);
                    return BadRequest(result);
                }

                if (AllowLimitFileType)
                {
                    var listFileTypeAllow = new HashSet<string> { ".jpg", ".png", ".gif", ".xls", ".xlsx", ".qlns" };
                    if (!listFileTypeAllow.Contains(Path.GetExtension(file.FileName)))
                    {
                        listFileError.Add(new FileUploadInfoModel()
                        {
                            FileName = file.FileName,
                            FileSize = file.ContentLength
                        });
                    }

                    if (listFileError.Count > 0)
                    {
                        responseData.Status = Status.Error;
                        responseData.Data = JsonConvert.SerializeObject(listFileError);
                        responseData.Message = $"File type upload only Allow Type: ({listFileTypeAllow}) {responseData.Data}";
                        result = JsonConvert.SerializeObject(responseData);
                        return BadRequest(result);
                    }
                }

                if (AllowLimitSize)
                {
                    if (file.ContentLength > limitFileSize)
                    {
                        listFileError.Add(new FileUploadInfoModel()
                        {
                            FileName = file.FileName,
                            FileSize = file.ContentLength
                        });
                    }

                    if (listFileError.Count > 0)
                    {
                        responseData.Status = Status.Error;
                        responseData.Data = JsonConvert.SerializeObject(listFileError);
                        responseData.Message = $"File upload must less 2MB ({responseData.Data})";
                        result = JsonConvert.SerializeObject(responseData);
                        return BadRequest(result);
                    }
                }

                var listLinkUploaded = new List<string>();

                if (file.ContentLength > 0)
                {
                    var templateUrl = Path.Combine(_webRootPath, "uploads", user.Code);
                    Directory.CreateDirectory(templateUrl);

                    var folderCreate = new Folder()
                    {
                        Id = Guid.NewGuid(),
                        Path = user.Code + "/",
                        IsActivated = true,
                        UserId = user.Id,
                    };
                    _unitOfWork.Folders.Add(folderCreate);
                    string filePath = Path.Combine(templateUrl, file.FileName);
                    string fileName = Path.GetFileNameWithoutExtension(filePath);

                    _unitOfWork.FileMetadata.Add(fileMetaData);

                    _unitOfWork.Files.Add(new File()
                    {
                        Id = Guid.NewGuid(),
                        Description = description,
                        IsActivated = true,
                        Name = fileName,
                        Path = file.FileName,
                        FolderId = folderCreate.Id,
                        MetadataId = fileMetaData.Id
                    });

                    using (var stream = System.IO.File.Create(filePath))
                    {
                        await file.InputStream.CopyToAsync(stream);
                    }
                    _unitOfWork.Complete();
                    listLinkUploaded.Add($"{_webRootPath}/uploads/{file.FileName}");
                }

                responseData.Status = Status.Success;
                responseData.Data = JsonConvert.SerializeObject(listLinkUploaded);
                responseData.Message = $"Uploaded 1 files successful.";
                result = JsonConvert.SerializeObject(responseData);

                return Ok(result);

            }

            return BadRequest();
        }

        [HttpPost]
        public async Task<IHttpActionResult> HandleReport()
        {
            var claims = (User.Identity as ClaimsIdentity).Claims;
            var name = claims.FirstOrDefault(x => x.Type == ClaimTypes.Name).Value;
            var user = await UserManager.FindByNameAsync(name);

            string id = HttpContext.Current.Request.Form["modal-id"]?.ToString() ?? string.Empty;
            string type = HttpContext.Current.Request.Form["modal-type"]?.ToString() ?? string.Empty;
            if (Guid.TryParse(id, out var fileId))
            {
                try
                {
                    if (type == "revoke")
                    {
                        var file = _fileService.Find(fileId);
                        file.IsActivated = false;
                        _fileService.Update(file);
                    }
                    return Ok();
                }
                catch (Exception ex)
                {
                    return BadRequest(ex.Message);
                }
            }
            return BadRequest();
        }

        private async Task<bool> IsApproved()
        {
            var claimToken = (User.Identity as ClaimsIdentity).Claims;
            var name = claimToken.FirstOrDefault(x => x.Type == ClaimTypes.Name).Value;
            var user = await UserManager.FindByNameAsync(name);
            var claims = await UserManager.GetClaimsAsync(user.Id);
            return IsApproved(claims);
        }

        private async Task<bool> IsApproved(ApplicationUser user)
        {
            var claims = await UserManager.GetClaimsAsync(user.Id);
            return IsApproved(claims);
        }

        private bool IsApproved(IList<Claim> claims)
        {
            return claims.Any(x => x.Value == nameof(Claims.Approved));
        }

        private static int Convert(string text)
        {
            if (!string.IsNullOrEmpty(text))
            {
                return int.TryParse(text, out int result) ? result : 0;
            }
            else { return 0; }
        }
    }
}