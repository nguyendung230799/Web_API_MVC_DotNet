using REPORT_MANAGEMENT_CORE.Data;
using REPORT_MANAGEMENT_CORE.Data.Domains;
using System;
using System.Collections.Generic;
using System.Linq;

namespace REPORT_MANAGEMENT_CORE.Repositories.Implement
{
    public class CatalogueDepartmentRepository : GenericRepository<CatalogueDepartment>, ICatalogueDepartmentRepository
    {
        public CatalogueDepartmentRepository(ApplicationDbContext context) : base(context) { }

    }
}
