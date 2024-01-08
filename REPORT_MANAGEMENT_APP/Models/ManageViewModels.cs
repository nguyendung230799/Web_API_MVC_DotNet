using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace REPORT_MANAGEMENT_APP.Models
{
    public class IndexViewModel
    {
        public bool HasPassword { get; set; }
        public IList<UserLoginInfo> Logins { get; set; }
        public string PhoneNumber { get; set; }
        public string UserName { get; set; }
        public byte[] ProfilePicture { get; set; }
        public string Hometown { get; set; }
        public string Description { get; set; }
        public string Email { get; set; }
        public bool TwoFactor { get; set; }
        public bool BrowserRemembered { get; set; }
        public string AgencyName { get; set; }
        public string AgencyDisplay
        {
            get
            {
                if (!string.IsNullOrEmpty(AgencyName) && !string.IsNullOrEmpty(AgencyCode))
                {
                    return $"{AgencyName} - {AgencyCode}";
                } else if (!string.IsNullOrEmpty(AgencyName))
                {
                    return AgencyName;
                } else
                {
                    return AgencyCode;
                }
            }
        }
        public string AgencyParentName { get; set; }
        public string AgencyCode { get; set; }
        public int AgencyRank { get; set; }
        public string AgencyDepartment { get; set; }
        public System.Web.Mvc.SelectList ListDepartment { get; set; }
        public List<string> ListDepartmentSelected { get; set; }


    }

    public class ManageLoginsViewModel
    {
        public IList<UserLoginInfo> CurrentLogins { get; set; }
        public IList<AuthenticationDescription> OtherLogins { get; set; }
    }

    public class FactorViewModel
    {
        public string Purpose { get; set; }
    }

    public class SetPasswordViewModel
    {
        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "New password")]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm new password")]
        [Compare("NewPassword", ErrorMessage = "The new password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }

    public class ChangePasswordViewModel
    {
        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Current password")]
        public string OldPassword { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "New password")]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm new password")]
        [Compare("NewPassword", ErrorMessage = "The new password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }

    public class ChangeAgencyViewModel
    {
        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Agency Name")]
        public string AgencyName { get; set; }
        [Required]
        [Display(Name = "Agency Code")]
        public string AgencyCode { get; set; }
        public string AgencyDepartment => String.Join(StringUtilities.COMMA, ListDepartmentSelected);

        [Display(Name = "Agency Department")]
        public List<string> ListDepartmentSelected { get; set; }

        [Display(Name = "Agency Level")]
        public string AgencyLevel { get; set; }

        [Required]
        [Display(Name = "Agency Parent")]
        public Guid AgencyParent { get; set; }

        [Display(Name = "Agency List Parent")]
        public System.Web.Mvc.SelectList AgencyListParent { get; set; }
        public bool Disabled { get; set; } = true;
        public System.Web.Mvc.SelectList ListDepartment { get; set; }
    }

    public class AddPhoneNumberViewModel
    {
        [Required]
        [Phone]
        [Display(Name = "Phone Number")]
        public string Number { get; set; }
    }

    public class VerifyPhoneNumberViewModel
    {
        [Required]
        [Display(Name = "Code")]
        public string Code { get; set; }

        [Required]
        [Phone]
        [Display(Name = "Phone Number")]
        public string PhoneNumber { get; set; }
    }

    public class ConfigureTwoFactorViewModel
    {
        public string SelectedProvider { get; set; }
        public ICollection<System.Web.Mvc.SelectListItem> Providers { get; set; }
    }
}