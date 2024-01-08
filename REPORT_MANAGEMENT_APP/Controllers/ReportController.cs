using Microsoft.AspNet.Identity.Owin;
using Microsoft.Extensions.Logging;
using MimeKit;
using Newtonsoft.Json;
using REPORT_MANAGEMENT_APP.Models;
using REPORT_MANAGEMENT_CORE.Data.Domains;
using REPORT_MANAGEMENT_CORE.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace REPORT_MANAGEMENT_APP.Controllers
{
    [Authorize]
    public class ReportController : Controller
    {
        private readonly ILogger<ReportController> _logger;
        private readonly IUnitOfWork _unitOfWork;
        //private readonly IMapper _mapper;
        private readonly string _webRootPath;
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;
        private ApplicationRoleManager _roleManager;
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

        public ReportController(IUnitOfWork unitOfWork, ILogger<ReportController> logger)
        {
            _unitOfWork = unitOfWork;
            _logger = logger;
            _webRootPath = ConfigurationManager.AppSettings["FilePath"];
        }


        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Self()
        {
            ViewBag.RowsPerPage = Constants.ROWS_PER_PAGE;
            return View();
        }

        public ActionResult All()
        {
            ViewBag.RowsPerPage = Constants.ROWS_PER_PAGE;
            return View();
        }

        public ActionResult Upload()
        {
            ViewBag.RowsPerPage = Constants.ROWS_PER_PAGE;
            return View();
        }

        public ActionResult Child()
        {
            ViewBag.RowsPerPage = Constants.ROWS_PER_PAGE;
            return View();
        }

        public ActionResult WrongInfo()
        {
            ViewBag.RowsPerPage = Constants.ROWS_PER_PAGE;
            return View();
        }

        public ActionResult Revoke()
        {
            ViewBag.RowsPerPage = Constants.ROWS_PER_PAGE;
            return View();
        }

        private static int Convert(string text)
        {
            if (!string.IsNullOrEmpty(text))
            {
                return int.TryParse(text, out int result) ? result : 0;
            }
            else { return 0; }
        }


        public ActionResult OnPostUploadFileSecurity()
        {
            var formFile = HttpContext.Request.Files.Count > 0 ? HttpContext.Request.Files[0] : null;
            if (formFile == null)
            {
                ViewBag.StatusMessage = "Chưa đính kèm tệp tin tải lên";
                return RedirectToAction("Index");
            }

            string description = HttpContext.Request.Form["description"].ToString();
            string module = HttpContext.Request.Form["module"].ToString();
            string moduleName = HttpContext.Request.Form["moduleName"].ToString();
            string subModule = HttpContext.Request.Form["subModule"].ToString();
            string subModuleName = HttpContext.Request.Form["subModuleName"].ToString();
            string department = HttpContext.Request.Form["department"].ToString();
            string quarter = HttpContext.Request.Form["quarter"].ToString();
            int yearOfWork = Convert(HttpContext.Request.Form["yearOfWork"].ToString());
            int yearOfBudget = Convert(HttpContext.Request.Form["yearOfBudget"].ToString());
            int sourceOfBudget = Convert(HttpContext.Request.Form["sourceOfBudget"].ToString());
            int typeOfSettlement = Convert(HttpContext.Request.Form["typeOfSettlement"].ToString());
            string tokenKey = HttpContext.Request.Form["tokenKey"].ToString();

            var fileMetaData = new FileMetadata(module, subModule, department, typeOfSettlement, quarter)
            {
                TimeModule = quarter,
                YearOfWork = yearOfWork,
                YearOfBudget = yearOfBudget,
                SourceOfBudget = sourceOfBudget,
                TypeModule = typeOfSettlement,
                TokenKey = tokenKey
            };

            _logger.LogInformation($"Upload File {formFile?.FileName ?? string.Empty}");

            const bool AllowLimitSize = true;
            const bool AllowLimitFileType = true;

            var listFileError = new List<FileUploadInfoModel>();

            if (AllowLimitFileType)
            {
                var listFileTypeAllow = ".jpg|.png|.gif|.xls|.xlsx|.qlns";

                var fileInfo = new FileInfo(formFile.FileName);
                if (!listFileTypeAllow.Contains(fileInfo.Extension))
                {
                    listFileError.Add(new FileUploadInfoModel()
                    {
                        FileName = formFile.FileName,
                        FileSize = formFile.ContentLength
                    });
                }

                if (listFileError.Count > 0)
                {
                    ViewBag.StatusMessage = $"File type upload only Allow Type: ({listFileTypeAllow}) {JsonConvert.SerializeObject(listFileError)}";
                    return RedirectToAction("Index");
                }
            }

            if (AllowLimitSize)
            {
                var limitFileSize = 2097152;

                if (formFile.ContentLength > limitFileSize)
                {
                    listFileError.Add(new FileUploadInfoModel()
                    {
                        FileName = formFile.FileName,
                        FileSize = formFile.ContentLength
                    });
                }

                if (listFileError.Count > 0)
                {
                    ViewBag.StatusMessage = $"Error: File upload must less 2MB ({JsonConvert.SerializeObject(listFileError)})";
                    return RedirectToAction("Index");
                }
            }

            var listLinkUploaded = new List<string>();

            if (formFile.ContentLength > 0)
            {
                /*
                _ = Guid.TryParse(User.Identity.GetUserId<Guid>(), out Guid userUUID);
                var currentAgency = _unitOfWork.Agencies.GetAgencyByUserId(userUUID);
                if (currentAgency == null)
                {
                    ViewBag.StatusMessage = "Error: No information of Agency";
                    return RedirectToAction("Index");
                }
                
                var templateUrl = $"{_webRootPath}/uploads/{currentAgency.Code}";
                Directory.CreateDirectory(templateUrl);

                var folderCreate = new Folder()
                {
                    Path = currentAgency.Code + "/",
                    UserId = userUUID,
                };
                
                _unitOfWork.Folders.Add(folderCreate);
                string filePath = Path.Combine(templateUrl, formFile.FileName);
                string fileName = Path.GetFileName(formFile.FileName);
                _unitOfWork.FileMetadata.Add(fileMetaData);

                _unitOfWork.Files.Add(new Data.Domains.File()
                {
                    Description = description,
                    IsActive = true,
                    Name = fileName,
                    Path = formFile.FileName,
                    FolderId = folderCreate.Id,
                    MetadataId = fileMetaData.Id
                });

                using (var stream = System.IO.File.Create(filePath))
                {
                    await formFile.InputStream.CopyToAsync(stream);
                }
                _unitOfWork.Complete();
                listLinkUploaded.Add($"{_webRootPath}/uploads/{formFile.FileName}");
                */
            }

            ViewBag.StatusMessage = $"Uploaded 1 files successful.";
            return RedirectToAction("Index");

        }

        public ActionResult OnGetDownloadFileFromFolder(string fileId, string tokenKey)
        {
            var listDataSaved = _unitOfWork.Files.FindAllReports();
            _ = Guid.TryParse(fileId, out Guid castFileId);
            var dataSaved = listDataSaved.FirstOrDefault(x => x.FileId == castFileId);
            if (dataSaved is null)
            {
                return HttpNotFound();
            }

            //Build the File Path.  
            string path = Path.Combine(
                _webRootPath,
                "uploads/",
                dataSaved?.FolderPath ?? string.Empty,
                dataSaved?.FilePath ?? string.Empty
                );

            //Read the File data into Byte Array.  
            try
            {
                MemoryStream ms = new MemoryStream();
                //using (FileStream file = new FileStream(path, FileMode.Open, FileAccess.Read))
                //{
                //    file.CopyTo(ms);
                //}

                DecryptFile(path, ref ms, tokenKey);

                //byte[] bytes = System.IO.File.ReadAllBytes(path);
                string mimeType = MimeTypes.GetMimeType(path);

                //Send the File to Download.  
                //return File(bytes, "application/octet-stream", fileName);
                return File(ms.ToArray(), mimeType, dataSaved.FilePath.Replace(".qlns", ".xlsx"));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                return HttpNotFound();
            }

        }

        private Task DecryptFile(string inputFile, ref MemoryStream outputFile, string hashTokenKey)
        {
            try
            {
                var UE = new UnicodeEncoding();
                byte[] key = UE.GetBytes(hashTokenKey);

                var fsIn = new FileStream(inputFile, FileMode.Open, FileAccess.Read);

                var RMCrypto = new RijndaelManaged();
                var cs = new CryptoStream(fsIn,
                    RMCrypto.CreateDecryptor(key, key),
                    CryptoStreamMode.Read);


                int data;
                while ((data = cs.ReadByte()) != -1)
                    outputFile.WriteByte((byte)data);
                // cs.FlushFinalBlock();
                // outputFile.Seek(0, SeekOrigin.Begin);

                return Task.Run(() =>
                {
                    Console.WriteLine("Encryption Success!");
                });
            }
            catch (Exception ex)
            {
                return Task.Run(() =>
                {
                    _logger.LogError(ex.Message, ex);
                });
            }
        }

    }
}
