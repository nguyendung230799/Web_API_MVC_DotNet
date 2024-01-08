using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace REPORT_MANAGEMENT_CORE.Data.Query
{
    public class UserRoleQuery
    {
        public Guid? UserId { get; set; }
        public long Ordinal { get; set; }
        public int Total { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserName { get; set; }
        public string Agency { get; set; }
        public string AgencyParent { get; set; }
        public string Email { get; set; }
        public bool IsAuthorize { get; set; }
        public string RolesName { get; set; }
        public IEnumerable<string> Roles { get; set; }
    }
}
