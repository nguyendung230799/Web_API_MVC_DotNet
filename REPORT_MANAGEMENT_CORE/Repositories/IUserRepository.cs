using REPORT_MANAGEMENT_CORE.Data.Domains;
using REPORT_MANAGEMENT_CORE.Data.Query;
using System;
using System.Collections.Generic;

namespace REPORT_MANAGEMENT_CORE.Repositories
{
    public interface IUserRepository : IGenericRepository<ApplicationUser>
    {
        bool HasAgency(string agencyCode);
        ApplicationUser FindByName(string name);
        List<ApplicationUser> FindAllInfo();
        List<UserRoleQuery> GetUserRoles(int pageNumber, int rowsOfPage);
        (IEnumerable<ApplicationUser>, int) FindPaginated(int? offset, int rowsPerPage);
        (IEnumerable<ApplicationUser>, int) FindPaginated(int? offset, int rowsPerPage, bool status);
        (IEnumerable<ApplicationUser>, int) FindPaginatedChildren(Guid parentId, int? offset, int rowsPerPage, bool status);
    }
}
