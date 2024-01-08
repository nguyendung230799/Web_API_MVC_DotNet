using System;

namespace REPORT_MANAGEMENT_APP.Models
{
    public class ManageUserRoleModel
    {
        public Guid RoleId { get; set; }
        public string RoleName { get; set; }
        public bool Selected { get; set; }
    }
}
