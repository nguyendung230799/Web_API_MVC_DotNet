using REPORT_MANAGEMENT_CORE.Data.Domains;
using REPORT_MANAGEMENT_CORE.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace REPORT_MANAGEMENT_CORE.Services.Implement
{
    public class CatalogueDepartmentService : ICatalogueDepartmentService
    {
        private readonly IUnitOfWork _unitOfWork;
        public CatalogueDepartmentService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public List<CatalogueDepartment> FindAll()
        {
            return _unitOfWork.CatalogueDepartments.FindAll().ToList();
        }
    }
}