using REPORT_MANAGEMENT_CORE.Data;
using REPORT_MANAGEMENT_CORE.Data.Domains;
using System;
using System.Collections.Generic;
using System.Linq;

namespace REPORT_MANAGEMENT_CORE.Repositories.Implement
{
    public class CatalogueBudgetRepository : GenericRepository<CatalogueBudget>, ICatalogueBudgetRepository
    {
        public CatalogueBudgetRepository(ApplicationDbContext context) : base(context) { }

        public new List<CatalogueBudget> FindAll()
        {
            return _context.CatalogueBudgets.OrderBy(x => x.CodeChain).ToList().Select((x, y) =>
            {
                x.Ordinal = y + 1;
                return x;
            }).ToList();
        }
    }
}
