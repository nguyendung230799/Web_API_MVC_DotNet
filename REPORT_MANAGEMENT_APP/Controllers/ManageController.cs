using AutoMapper;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using REPORT_MANAGEMENT_APP.Models;
using REPORT_MANAGEMENT_CORE.Data.Domains;
using REPORT_MANAGEMENT_CORE.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace REPORT_MANAGEMENT_APP.Controllers
{
    [Authorize]
    public class ManageController : Controller
    {
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;
        private ApplicationRoleManager _roleManager;
        private ICatalogueDepartmentService _catalogueDepartmentService;
        private readonly IUserService _userService;
        private readonly IMapper _mapper;
        public SelectList ListDepartmentInitial;


        public ManageController(IUserService userService, IMapper mapper, ICatalogueDepartmentService catalogueDepartmentService)
        {
            _userService = userService;
            _mapper = mapper;
            _catalogueDepartmentService = catalogueDepartmentService;
        }

        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
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
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
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

        public ActionResult ApproveAgency(int? page)
        {
            ViewBag.RowsPerPage = Constants.ROWS_PER_PAGE;
            //int rowPerPage = 5;
            //int skip = page.HasValue ? page.Value - 1 : 0;
            //var users = _userService.FindAll();
            //users = users.Skip(skip * rowPerPage).Take(rowPerPage).ToList();
            //var agencies = _mapper.Map<List<UserModel>>(users);
            return View();
        }

        public ActionResult RejectAgency()
        {
            ViewBag.RowsPerPage = Constants.ROWS_PER_PAGE;
            return View();
        }
        //
        // GET: /Manage/Index
        public async Task<ActionResult> Agency(ManageMessageId? message)
        {
            ViewBag.StatusMessage =
                message == ManageMessageId.ChangePasswordSuccess ? "Mật khẩu đã được thay đổi."
                : message == ManageMessageId.SetPasswordSuccess ? "Mật khẩu đã được thiết lập."
                : message == ManageMessageId.SetTwoFactorSuccess ? "Xác thực 2 yếu tố đã được thiết lập."
                : message == ManageMessageId.Error ? "Có lỗi đã xảy ra."
                : message == ManageMessageId.AddPhoneSuccess ? "Số điện thoại đã được thêm."
                : message == ManageMessageId.RemovePhoneSuccess ? "Số điện thoại đã bị loại bỏ."
                : message == ManageMessageId.ChangeAgencySuccess ? "Đơn vị đã được thay đổi."
                : "";

            var userId = User.Identity.GetUserId<Guid>();
            var user = _userService.Find(userId);
            user = (ApplicationUser)user.EmptyStringPipe();
            var isAuthorize = await UserManager.IsInRoleAsync(userId, nameof(Roles.Moderator));
            ViewBag.StatusAgency = !isAuthorize ? "Đơn vị người dùng chưa được kiểm duyệt." : "";

            var model = new IndexViewModel
            {
                HasPassword = HasPassword(),
                UserName = User.Identity.GetUserName(),
                Email = await UserManager.GetEmailAsync(userId),
                Description = user?.Description ?? "",
                ProfilePicture = user?.ProfilePicture ?? new byte[0],
                AgencyName = user?.Name ?? "",
                AgencyDepartment = user?.Department ?? "",
                AgencyCode = user?.Code ?? "",
                AgencyRank = user?.Rank ?? 0,
                PhoneNumber = await UserManager.GetPhoneNumberAsync(userId),
                TwoFactor = await UserManager.GetTwoFactorEnabledAsync(userId),
                Logins = await UserManager.GetLoginsAsync(userId),
                BrowserRemembered = await AuthenticationManager.TwoFactorBrowserRememberedAsync(User.Identity.GetUserId())
            };

            var listDepartmentInitial = _catalogueDepartmentService.FindAll().Select(x => new SelectListItem()
            {
                Text = x.Name,
                Value = x.Code
            });
            ListDepartmentInitial = new SelectList(listDepartmentInitial, nameof(SelectListItem.Value), nameof(SelectListItem.Text), nameof(SelectListItem.Value));
            ListDepartmentInitial.Where(x => model.AgencyDepartment.Split(StringUtilities.CHAR_COMMA).Contains(x.Value)).Select(x => x.Selected = true).ToList();
            model.ListDepartment = ListDepartmentInitial;
            model.ListDepartmentSelected = model.AgencyDepartment?.Split(StringUtilities.CHAR_COMMA).ToList() ?? new List<string>();
            return View(model); // PartialView
        }

        public async Task<ActionResult> Index()
        {

            var userId = User.Identity.GetUserId<Guid>();
            var user = _userService.Find(userId);
            user = (ApplicationUser)user.EmptyStringPipe();
            var isAuthorize = await UserManager.IsInRoleAsync(userId, nameof(Roles.Moderator));
            ViewBag.StatusAgency = !isAuthorize ? "Đơn vị người dùng chưa được kiểm duyệt." : "";
            var userParentId = _userService.Find(user.ParentId ?? Guid.Empty);

            var model = new IndexViewModel
            {
                HasPassword = HasPassword(),
                UserName = User.Identity.GetUserName(),
                Email = await UserManager.GetEmailAsync(userId),
                Description = user?.Description ?? "",
                ProfilePicture = user?.ProfilePicture ?? new byte[0],
                AgencyParentName = userParentId?.Name ?? "Không có đơn vị cha",
                AgencyName = user?.Name ?? "",
                AgencyDepartment = user?.Department ?? "",
                AgencyCode = user?.Code ?? "",
                AgencyRank = user?.Rank ?? 0,
                PhoneNumber = await UserManager.GetPhoneNumberAsync(userId),
                TwoFactor = await UserManager.GetTwoFactorEnabledAsync(userId),
                Logins = await UserManager.GetLoginsAsync(userId),
                BrowserRemembered = await AuthenticationManager.TwoFactorBrowserRememberedAsync(User.Identity.GetUserId())
            };
            return View(model); // PartialView
        }

        //
        // POST: /Manage/RemoveLogin
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> RemoveLogin(string loginProvider, string providerKey)
        {
            ManageMessageId? message;
            var result = await UserManager.RemoveLoginAsync(User.Identity.GetUserId<Guid>(), new UserLoginInfo(loginProvider, providerKey));
            if (result.Succeeded)
            {
                var user = await UserManager.FindByIdAsync(User.Identity.GetUserId<Guid>());
                if (user != null)
                {
                    await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                }
                message = ManageMessageId.RemoveLoginSuccess;
            }
            else
            {
                message = ManageMessageId.Error;
            }
            return RedirectToAction("ManageLogins", new { Message = message });
        }

        //
        // GET: /Manage/AddPhoneNumber
        public ActionResult AddPhoneNumber()
        {
            return View();
        }

        //
        // POST: /Manage/AddPhoneNumber
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> AddPhoneNumber(AddPhoneNumberViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            // Generate the token and send it
            var code = await UserManager.GenerateChangePhoneNumberTokenAsync(User.Identity.GetUserId<Guid>(), model.Number);
            if (UserManager.SmsService != null)
            {
                var message = new IdentityMessage
                {
                    Destination = model.Number,
                    Body = "Your security code is: " + code
                };
                await UserManager.SmsService.SendAsync(message);
            }
            return RedirectToAction("VerifyPhoneNumber", new { PhoneNumber = model.Number });
        }

        //
        // POST: /Manage/EnableTwoFactorAuthentication
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> EnableTwoFactorAuthentication()
        {
            await UserManager.SetTwoFactorEnabledAsync(User.Identity.GetUserId<Guid>(), true);
            var user = await UserManager.FindByIdAsync(User.Identity.GetUserId<Guid>());
            if (user != null)
            {
                await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
            }
            return RedirectToAction("Index", "Manage");
        }

        //
        // POST: /Manage/DisableTwoFactorAuthentication
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DisableTwoFactorAuthentication()
        {
            await UserManager.SetTwoFactorEnabledAsync(User.Identity.GetUserId<Guid>(), false);
            var user = await UserManager.FindByIdAsync(User.Identity.GetUserId<Guid>());
            if (user != null)
            {
                await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
            }
            return RedirectToAction("Index", "Manage");
        }

        //
        // GET: /Manage/VerifyPhoneNumber
        public async Task<ActionResult> VerifyPhoneNumber(string phoneNumber)
        {
            _ = await UserManager.GenerateChangePhoneNumberTokenAsync(User.Identity.GetUserId<Guid>(), phoneNumber);
            // Send an SMS through the SMS provider to verify the phone number
            return phoneNumber == null ? View("Error") : View(new VerifyPhoneNumberViewModel { PhoneNumber = phoneNumber });
        }

        //
        // POST: /Manage/VerifyPhoneNumber
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> VerifyPhoneNumber(VerifyPhoneNumberViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            var result = await UserManager.ChangePhoneNumberAsync(User.Identity.GetUserId<Guid>(), model.PhoneNumber, model.Code);
            if (result.Succeeded)
            {
                var user = await UserManager.FindByIdAsync(User.Identity.GetUserId<Guid>());
                if (user != null)
                {
                    await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                }
                return RedirectToAction("Index", new { Message = ManageMessageId.AddPhoneSuccess });
            }
            // If we got this far, something failed, redisplay form
            ModelState.AddModelError("", "Failed to verify phone");
            return View(model);
        }

        //
        // POST: /Manage/RemovePhoneNumber
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> RemovePhoneNumber()
        {
            var result = await UserManager.SetPhoneNumberAsync(User.Identity.GetUserId<Guid>(), null);
            if (!result.Succeeded)
            {
                return RedirectToAction("Index", new { Message = ManageMessageId.Error });
            }
            var user = await UserManager.FindByIdAsync(User.Identity.GetUserId<Guid>());
            if (user != null)
            {
                await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
            }
            return RedirectToAction("Index", new { Message = ManageMessageId.RemovePhoneSuccess });
        }

        //
        // GET: /Manage/ChangePassword
        public ActionResult ChangePassword()
        {
            return View();
        }

        /*
        public ActionResult ChangeAgency()
        {
            _ = Guid.TryParse(User.Identity.GetUserId<Guid>(), out Guid userUUID);
            var agency = _unitOfWork.Agencies.GetAgencyByUserId(userUUID) ?? new Agency();
            var agencyChildren = _unitOfWork.Agencies.Find(x => x.ParentId == agency.Id).Select(x => x.Code).ToList();
            var listAgency = _mapper.Map<List<AgencyModel>>(_unitOfWork.Agencies.Find(x => x.Code != agency.Code && !agencyChildren.Contains(x.Code)).ToList());

            listAgency.Insert(0, new AgencyModel()
            {
                Id = Guid.Empty,
                Name = "Không có đơn vị cấp trên",
                Code = "",
                Level = 0
            });

            var model = _mapper.Map<ChangeAgencyViewModel>(agency ?? new Data.Domains.Agency(userUUID));
            model.ListDepartment = ListDepartmentInitial;
            model.ListDepartmentSelected = agency.Department?.Split(StringUtilities.CHAR_COMMA).ToList() ?? new List<string>();
            model.AgencyListParent = new SelectList(listAgency, nameof(AgencyModel.Id), nameof(AgencyModel.NameCode), nameof(AgencyModel.Id)); ;
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangeAgency(ChangeAgencyViewModel model)
        {
            _ = Guid.TryParse(User.Identity.GetUserId<Guid>(), out Guid userUUID);
            var agency = _unitOfWork.Agencies.GetAgencyByUserId(userUUID) ?? new Data.Domains.Agency(userUUID);


            if (!ModelState.IsValid)
            {
                var agencyChildren = _unitOfWork.Agencies.Find(x => x.ParentId == agency.Id).Select(x => x.Code).ToList();
                var listAgency = _mapper.Map<List<AgencyModel>>(_unitOfWork.Agencies.Find(x => x.Code != agency.Code && !agencyChildren.Contains(x.Code)).ToList());
                listAgency.Insert(0, new AgencyModel()
                {
                    Id = Guid.Empty,
                    Name = "Không có đơn vị cấp trên",
                    Code = "",
                    Level = 0
                });
                model.ListDepartment = ListDepartmentInitial;
                model.AgencyListParent = new SelectList(listAgency, nameof(AgencyModel.Id), nameof(AgencyModel.NameCode), nameof(AgencyModel.Id));
                return View(model);
            }


            if (model.AgencyCode != agency.Code && _unitOfWork.Agencies.HasAgency(model.AgencyCode))
            {
                var agencyChildren = _unitOfWork.Agencies.Find(x => x.ParentId == agency.Id).Select(x => x.Code).ToList();
                var listAgency = _mapper.Map<List<AgencyModel>>(_unitOfWork.Agencies.Find(x => x.Code != agency.Code && !agencyChildren.Contains(x.Code)).ToList());
                listAgency.Insert(0, new AgencyModel()
                {
                    Id = Guid.Empty,
                    Name = "Không có đơn vị cấp trên",
                    Code = "",
                    Level = 0
                });
                model.ListDepartment = ListDepartmentInitial;
                model.AgencyListParent = new SelectList(listAgency, nameof(AgencyModel.Id), nameof(AgencyModel.NameCode), nameof(AgencyModel.Id));
                ModelState.AddModelError("", "Mã đơn vị đã tồn tại.");
                return View(model);
            }

            if (model.AgencyParent == Guid.Empty) model.AgencyParent = agency.ParentId;
            _mapper.Map(model, agency);
            var agencyParent = _unitOfWork.Agencies.GetById(model.AgencyParent);
            agency.Level = (agencyParent?.Level ?? 0) + 1;

            _unitOfWork.Agencies.Update(agency);
            _unitOfWork.Complete();

            return RedirectToAction("Index", new { Message = ManageMessageId.ChangeAgencySuccess });

        }
        */

        //
        // POST: /Manage/ChangePassword
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ChangePassword(ChangePasswordViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            var result = await UserManager.ChangePasswordAsync(User.Identity.GetUserId<Guid>(), model.OldPassword, model.NewPassword);
            if (result.Succeeded)
            {
                var user = await UserManager.FindByIdAsync(User.Identity.GetUserId<Guid>());
                if (user != null)
                {
                    await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                }
                return RedirectToAction("Index", new { Message = ManageMessageId.ChangePasswordSuccess });
            }
            AddErrors(result);
            return View(model);
        }

        //
        // GET: /Manage/SetPassword
        public ActionResult SetPassword()
        {
            return View();
        }

        //
        // POST: /Manage/SetPassword
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> SetPassword(SetPasswordViewModel model)
        {
            if (ModelState.IsValid)
            {
                var result = await UserManager.AddPasswordAsync(User.Identity.GetUserId<Guid>(), model.NewPassword);
                if (result.Succeeded)
                {
                    var user = await UserManager.FindByIdAsync(User.Identity.GetUserId<Guid>());
                    if (user != null)
                    {
                        await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                    }
                    return RedirectToAction("Index", new { Message = ManageMessageId.SetPasswordSuccess });
                }
                AddErrors(result);
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Manage/ManageLogins
        public async Task<ActionResult> ManageLogins(ManageMessageId? message)
        {
            ViewBag.StatusMessage =
                message == ManageMessageId.RemoveLoginSuccess ? "The external login was removed."
                : message == ManageMessageId.Error ? "An error has occurred."
                : "";
            var user = await UserManager.FindByIdAsync(User.Identity.GetUserId<Guid>());
            if (user == null)
            {
                return View("Error");
            }
            var userLogins = await UserManager.GetLoginsAsync(User.Identity.GetUserId<Guid>());
            var otherLogins = AuthenticationManager.GetExternalAuthenticationTypes().Where(auth => userLogins.All(ul => auth.AuthenticationType != ul.LoginProvider)).ToList();
            ViewBag.ShowRemoveButton = user.PasswordHash != null || userLogins.Count > 1;
            return View(new ManageLoginsViewModel
            {
                CurrentLogins = userLogins,
                OtherLogins = otherLogins
            });
        }

        //
        // POST: /Manage/LinkLogin
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LinkLogin(string provider)
        {
            // Request a redirect to the external login provider to link a login for the current user
            return new AccountController.ChallengeResult(provider, Url.Action("LinkLoginCallback", "Manage"), User.Identity.GetUserId());
        }

        //
        // GET: /Manage/LinkLoginCallback
        public async Task<ActionResult> LinkLoginCallback()
        {
            var loginInfo = await AuthenticationManager.GetExternalLoginInfoAsync(XsrfKey, User.Identity.GetUserId());
            if (loginInfo == null)
            {
                return RedirectToAction("ManageLogins", new { Message = ManageMessageId.Error });
            }
            var result = await UserManager.AddLoginAsync(User.Identity.GetUserId<Guid>(), loginInfo.Login);
            return result.Succeeded ? RedirectToAction("ManageLogins") : RedirectToAction("ManageLogins", new { Message = ManageMessageId.Error });
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && _userManager != null)
            {
                _userManager.Dispose();
                _userManager = null;
            }

            base.Dispose(disposing);
        }


        [Authorize(Roles = nameof(Roles.Administrator))]
        public ActionResult ManageUser(int? message)
        {
            ViewBag.RowsPerPage = Constants.ROWS_PER_PAGE;
            if (message == 1) ViewBag.StatusMessage = $"Đặt lại mật khẩu thành công";
            return View();
        }

        [Authorize(Roles = nameof(Roles.Administrator))]
        public async Task<ActionResult> ManageRole(string userId)
        {
            ViewBag.UserId = userId;
            var user = await UserManager.FindByIdAsync(new Guid(userId));
            if (user == null)
            {
                ViewBag.ErrorMessage = $"User with Id = {userId} cannot be found";
                return View("NotFound");
            }

            ViewBag.UserName = user.UserName;
            var model = new List<ManageUserRoleModel>();
            var roles = RoleManager.Roles.ToList();
            foreach (var role in roles)
            {
                model.Add(new ManageUserRoleModel()
                {
                    RoleId = role.Id,
                    RoleName = role.Name,
                    Selected = await UserManager.IsInRoleAsync(user.Id, role.Name)
                });
            }

            return View(model);
        }

        public ActionResult Locked()
        {
            return View();
        }

        [Authorize(Roles = nameof(Roles.Administrator))]
        public async Task<ActionResult> ResetPassword()
        {
            var userIdStr = Request.Form["modal-id"];
            if (Guid.TryParse(userIdStr, out Guid userId))
            {
                ViewBag.UserId = userId;
                var user = await UserManager.FindByIdAsync(userId);
                if (user == null)
                {
                    ViewBag.ErrorMessage = $"User with Id = {userId} cannot be found";
                    return View("NotFound");
                }

                if (!await UserManager.HasPasswordAsync(userId))
                {
                    await UserManager.AddPasswordAsync(userId, Constants.AUTH_ADMIN);
                }
                else
                {
                    var token = await UserManager.GeneratePasswordResetTokenAsync(userId);
                    var userNew = await UserManager.ResetPasswordAsync(userId, token, Constants.AUTH_ADMIN);
                    if (userNew.Succeeded)
                    {
                        return RedirectToAction("Index", new { Message = 1 });
                    }
                }
            }

            return HttpNotFound();
        }

        [Authorize(Roles = nameof(Roles.Administrator))]
        public async Task<ActionResult> RemovePermission(string userId)
        {
            ViewBag.userId = userId;
            var user = await UserManager.FindByIdAsync(new Guid(userId));
            if (user == null)
            {
                ViewBag.ErrorMessage = $"User with Id = {userId} cannot be found";
                return View("NotFound");
            }

            if (await UserManager.IsInRoleAsync(user.Id, nameof(Roles.Moderator)))
            {
                await UserManager.RemoveFromRoleAsync(user.Id, nameof(Roles.Moderator));
            }

            return RedirectToAction("Index");
        }

        [Authorize(Roles = nameof(Roles.Administrator))]
        public async Task<ActionResult> AddPermission(string userId)
        {
            ViewBag.userId = userId;
            var user = await UserManager.FindByIdAsync(new Guid(userId));
            if (user == null)
            {
                ViewBag.ErrorMessage = $"User with Id = {userId} cannot be found";
                return View("NotFound");
            }
            await UserManager.AddToRoleAsync(user.Id, nameof(Roles.Moderator));
            return RedirectToAction("Index");
        }

        [HttpPost]
        [Authorize(Roles = nameof(Roles.Administrator))]
        public async Task<ActionResult> ManageRole(List<ManageUserRoleModel> model, string userId)
        {
            var user = await UserManager.FindByIdAsync(new Guid(userId));
            if (user == null)
            {
                return View();
            }
            var roles = await UserManager.GetRolesAsync(user.Id);
            var result = await UserManager.RemoveFromRolesAsync(user.Id, roles.ToArray());
            if (!result.Succeeded)
            {
                ModelState.AddModelError("Error", "Cannot remove user existing roles");
                return View(model);
            }
            result = await UserManager.AddToRolesAsync(user.Id, model.Where(x => x.Selected).Select(y => y.RoleName).ToArray());
            if (!result.Succeeded)
            {
                ModelState.AddModelError("Error", "Cannot add selected roles to user");
                return View(model);
            }
            return RedirectToAction("ManageUser");
        }

        #region Helpers
        // Used for XSRF protection when adding external logins
        private const string XsrfKey = "XsrfId";

        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        private bool HasPassword()
        {
            var a = User.Identity.GetUserId<Guid>();

            var user = UserManager.FindById(User.Identity.GetUserId<Guid>());
            if (user != null)
            {
                return user.PasswordHash != null;
            }
            return false;
        }

        private bool HasPhoneNumber()
        {
            var user = UserManager.FindById(User.Identity.GetUserId<Guid>());
            if (user != null)
            {
                return user.PhoneNumber != null;
            }
            return false;
        }

        public enum ManageMessageId
        {
            AddPhoneSuccess,
            ChangePasswordSuccess,
            SetTwoFactorSuccess,
            SetPasswordSuccess,
            RemoveLoginSuccess,
            RemovePhoneSuccess,
            ChangeAgencySuccess,
            Error
        }

        #endregion
    }
}