using System;
using System.Collections.Generic;
using System.Linq;
using static REPORT_MANAGEMENT_CORE.Data.Domains.IdentityModels;

namespace REPORT_MANAGEMENT_APP.Models
{
    public class UserRoleModel
    {
        public Guid UserId { get; set; }
        public long Ordinal { get; set; }
        public int Total { get; set; }
        public string Hometown { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Name { get; set; }
        public string UserName { get; set; }
        public string Agency { get; set; }
        public string AgencyParent { get; set; }
        public string Email { get; set; }
        public bool IsAuthorize { get; set; }
        public string RolesName { get; set; }
        public IEnumerable<ApplicationUserRole> Roles { get; set; }
        public IEnumerable<ApplicationUserClaim> Claims { get; set; }
        public bool IsApproved => Claims.Select(x => x.ClaimType).ToList().Contains(nameof(REPORT_MANAGEMENT_APP.Claims.Approved));

        public string Status => Claims.Select(x => x.ClaimType).ToList() switch
        {
            var x when x.Contains(nameof(REPORT_MANAGEMENT_APP.Claims.Rejected)) => "<span class='label label-primary'>Bị từ chối <i class='icon-remove'></i></span>",
            var x when x.Contains(nameof(REPORT_MANAGEMENT_APP.Claims.Approved)) => "<span class='label label-success'>Đã kiểm duyệt <i class='icon-ok'></i></span>",
            var x when x.Contains(nameof(REPORT_MANAGEMENT_APP.Claims.RequestApproval)) => "<span class='label label-warning'>Yêu cầu kiểm duyệt <i class='icon-ok'></i></span>",
            _ => "<span class='label label-important'>Chưa được kiểm duyệt <i class='icon-remove'></i></span>"
        };
    }
}
