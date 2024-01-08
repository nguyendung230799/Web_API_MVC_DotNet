using REPORT_MANAGEMENT_CORE.Data.Domains;
using REPORT_MANAGEMENT_CORE.Data.Query;
using System;
using System.Collections.Generic;

namespace REPORT_MANAGEMENT_CORE.Services
{
    public interface IUserService
    {
        List<ApplicationUser> FindAll();
        void Update(ApplicationUser entity);
        List<ApplicationUser> FindAllInfo();
        ApplicationUser Find(Guid id);
        (IEnumerable<ApplicationUser>, int) FindPaginated(int? offset, int rowsPerPage);
        (IEnumerable<ApplicationUser>, int) FindPaginated(int? offset, int rowsPerPage, bool status);
        (IEnumerable<ApplicationUser>, int) FindPaginatedChildren(Guid parentId, int? offset, int rowsPerPage, bool status);
        List<UserRoleQuery> GetUserRoles(int pageNumber, int rowsOfPage);
        ApplicationUser FindByName(string name);
    }
}