using REPORT_MANAGEMENT_CORE.Data.Domains;
using REPORT_MANAGEMENT_CORE.Repositories;
using System.Collections.Generic;

namespace REPORT_MANAGEMENT_CORE.Services.Implement
{
    public class CatalogueBudgetService : ICatalogueBudgetService
    {
        private readonly IUnitOfWork _unitOfWork;
        public CatalogueBudgetService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public List<CatalogueBudget> FindAll() {
            return _unitOfWork.CatalogueBudgets.FindAll();
        }
    }
}