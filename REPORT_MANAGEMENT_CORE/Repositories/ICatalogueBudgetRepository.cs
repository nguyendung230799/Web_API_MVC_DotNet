using REPORT_MANAGEMENT_CORE.Data.Domains;
using System.Collections.Generic;

namespace REPORT_MANAGEMENT_CORE.Repositories
{
    public interface ICatalogueBudgetRepository : IGenericRepository<CatalogueBudget>
    {
        List<CatalogueBudget> FindAll();
    }
}
