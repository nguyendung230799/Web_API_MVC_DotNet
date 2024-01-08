using REPORT_MANAGEMENT_CORE.Data.Domains;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace REPORT_MANAGEMENT_CORE.Services
{
    public interface ICatalogueBudgetService
    {
        List<CatalogueBudget> FindAll();
    }
}