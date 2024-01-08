using REPORT_MANAGEMENT_CORE.Data.Domains;
using REPORT_MANAGEMENT_CORE.Data.Query;
using REPORT_MANAGEMENT_CORE.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;

namespace REPORT_MANAGEMENT_CORE.Services.Implement
{
    public class UserService : IUserService
    {
        private readonly IUnitOfWork _unitOfWork;

        public UserService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public void Update(ApplicationUser entity)
        {
            _unitOfWork.Users.Update(entity);
            _unitOfWork.Complete();
        }
        public List<ApplicationUser> FindAll()
        {
            return _unitOfWork.Users.FindAll().ToList();
        }

        public List<ApplicationUser> FindAllInfo()
        {
            return _unitOfWork.Users.FindAllInfo().ToList();
        }

        public ApplicationUser FindByName(string name)
        {
            var lst = _unitOfWork.Users.FindByName(name);
            return lst;
        }


        public List<UserRoleQuery> GetUserRoles(int pageNumber = 1, int rowsOfPage = 10)
        {
            return _unitOfWork.Users.GetUserRoles(pageNumber, rowsOfPage).ToList();
        }

        public ApplicationUser Find(Guid id)
        {
            return _unitOfWork.Users.Find(id);
        }
        public (IEnumerable<ApplicationUser>, int) FindPaginated(int? offset, int rowsPerPage)
        {
            return _unitOfWork.Users.FindPaginated(offset, rowsPerPage);
        }
        public (IEnumerable<ApplicationUser>, int) FindPaginated(int? offset, int rowsPerPage, bool status)
        {
            return _unitOfWork.Users.FindPaginated(offset, rowsPerPage, status);
        }

        public (IEnumerable<ApplicationUser>, int) FindPaginatedChildren(Guid parentId, int? offset, int rowsPerPage, bool status)
        {
            return _unitOfWork.Users.FindPaginatedChildren(parentId, offset, rowsPerPage, status);
        }
    }
}