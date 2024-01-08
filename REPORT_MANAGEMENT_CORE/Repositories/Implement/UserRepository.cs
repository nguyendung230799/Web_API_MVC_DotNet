using REPORT_MANAGEMENT_CORE.Data;
using REPORT_MANAGEMENT_CORE.Data.Domains;
using REPORT_MANAGEMENT_CORE.Data.Query;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace REPORT_MANAGEMENT_CORE.Repositories.Implement
{
    public class UserRepository : GenericRepository<ApplicationUser>, IUserRepository
    {
        public UserRepository(ApplicationDbContext context) : base(context) { }

        public bool HasAgency(string agencyCode)
        {
            return _context.Users.FirstOrDefault(x => x.Code == agencyCode) != null;
        }

        public ApplicationUser FindByName(string name)
        {
            return _context.Users.AsNoTracking().FirstOrDefault(x => x.UserName == name);

        }

        public List<ApplicationUser> FindAllInfo()
        {
            return _context.Users.Include(x => x.Roles).Include(x => x.Claims).ToList();
        }

        public (IEnumerable<ApplicationUser>, int) FindPaginated(int? offset, int rowsPerPage)
        {
            var dictRoles = _context.Roles.ToDictionary(x => x.Id, x => x.Name);
            var listUser = _context.Users.AsNoTracking().Include(x => x.Roles).Include(x => x.Claims)
                .ToList()
                .OrderByDescending(x => x.Email)
                .Select((x, y) =>
                {
                    x.Ordinal = y + 1;
                    x.RolesName = string.Join(",", x.Roles.Select(z => dictRoles[z.RoleId]));
                    return x;
                });
            return (listUser.Skip(offset.Value * rowsPerPage).Take(rowsPerPage).ToList(), listUser.Count());
        }

        public (IEnumerable<ApplicationUser>, int) FindPaginated(int? offset, int rowsPerPage, bool status)
        {
            var dictRoles = _context.Roles.ToDictionary(x => x.Id, x => x.Name);
            var listUser = _context.Users.AsNoTracking().Include(x => x.Roles).Include(x => x.Claims)
                .Where(x => !(x.Claims.Select(y => y.ClaimType).Contains("Rejected") ^ !status))
                .ToList()
                .OrderByDescending(x => x.Email)
                .Select((x, y) =>
                {
                    x.Ordinal = y + 1;
                    x.RolesName = string.Join(",", x.Roles.Select(z => dictRoles[z.RoleId]));
                    return x;
                });
            return (listUser.Skip(offset.Value * rowsPerPage).Take(rowsPerPage).ToList(), listUser.Count());
        }

        public (IEnumerable<ApplicationUser>, int) FindPaginatedChildren(Guid parentId, int? offset, int rowsPerPage, bool status)
        {
            var dictRoles = _context.Roles.ToDictionary(x => x.Id, x => x.Name);
            var listUser = _context.Users.AsNoTracking().Include(x => x.Roles).Include(x => x.Claims)
                .Where(x => x.ParentId == parentId && (x.Claims.Select(y => y.ClaimType).Contains("Rejected") ^ status)).ToList()
                .OrderByDescending(x => x.Email)
                .Select((x, y) =>
                {
                    x.Ordinal = y + 1;
                    x.RolesName = string.Join(",", x.Roles.Select(z => dictRoles[z.RoleId]));
                    return x;
                });
            return (listUser.Skip(offset.Value * rowsPerPage).Take(rowsPerPage).ToList(), listUser.Count());
        }

        public List<UserRoleQuery> GetUserRoles(int pageNumber = 1, int rowsOfPage = 10)
        {
            string sql = $@"
						SELECT
							a.Id,
							a.UserName,
							a.Email,
							a.Name Agency,
							d.Name AgencyParent,
							c.Name Role,
							e.ClaimValue,
							CASE
								WHEN 
									(c.Name = 'Moderator' AND e.ClaimValue = 'Approved') THEN 1 
									ELSE 0 
								END IsAuthorize 

							INTO #temp 
						FROM
							[User] a
							LEFT JOIN [UserRole] b ON a.Id = b.UserId
							LEFT JOIN [Role] c ON b.RoleId = c.Id
							LEFT JOIN [User] d ON d.ParentId = a.Id 
							LEFT JOIN [UserClaim] e ON a.Id = e.UserId

						SELECT
							COUNT(temp.Id) OVER() AS Total,
							ROW_NUMBER() OVER(ORDER BY Email DESC) AS Ordinal,
							temp.Id UserId,
							temp.UserName,
							temp.Agency,
							temp.AgencyParent,
							temp.Email,
							CAST(SUM (IsAuthorize) AS BIT) IsAuthorize,
							STUFF(
								(
								SELECT
									', ' + CAST (Role AS VARCHAR(MAX)) 
								FROM
									#temp 
								WHERE
									(Id = temp.ID) FOR XML PATH (''), TYPE).value ('.', 'VARCHAR(MAX)'), 1, 2, ''
							) AS RolesName 
						FROM
							#temp temp 
						GROUP BY
							temp.Id,
							temp.UserName,
							temp.Agency,
							temp.AgencyParent,
							temp.Email
						ORDER BY Email DESC
						OFFSET {(pageNumber - 1) * rowsOfPage} ROWS 
						FETCH NEXT {rowsOfPage} ROWS ONLY
						DROP TABLE #temp
						";
            return _context.FromSqlQuery<UserRoleQuery>(sql).ToList();
        }

    }
}
