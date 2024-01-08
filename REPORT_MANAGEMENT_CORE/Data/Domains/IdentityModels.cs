using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace REPORT_MANAGEMENT_CORE.Data.Domains
{
    public class IdentityModels
    {
        public class ApplicationUserRole : IdentityUserRole<Guid> { }
        public class ApplicationUserClaim : IdentityUserClaim<Guid> { }
        public class ApplicationUserLogin : IdentityUserLogin<Guid> { }

        public class ApplicationRole : IdentityRole<Guid, ApplicationUserRole>
        {
            public ApplicationRole() { }
            public ApplicationRole(string name) { Name = name; }
        }

        public class ApplicationUserStore : UserStore<ApplicationUser, ApplicationRole, Guid,
            ApplicationUserLogin, ApplicationUserRole, ApplicationUserClaim>
        {
            public ApplicationUserStore(ApplicationDbContext context)
                : base(context)
            {
            }
        }

        public class ApplicationRoleStore : RoleStore<ApplicationRole, Guid, ApplicationUserRole>
        {
            public ApplicationRoleStore(ApplicationDbContext context)
                : base(context)
            {
            }
        }
    }
}