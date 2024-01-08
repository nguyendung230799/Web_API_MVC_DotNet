using REPORT_MANAGEMENT_CORE.Data.Domains;
using REPORT_MANAGEMENT_CORE.Data.Model;
using REPORT_MANAGEMENT_CORE.Data.Query;
using System;
using System.Collections.Generic;

namespace REPORT_MANAGEMENT_CORE.Repositories
{
    public interface IFileRepository : IGenericRepository<File>
    {
        FileFilterQuery FindReport(Guid id);
        List<FileFilterQuery> FindAllReports();
        List<FileFilterQuery> FindAllReports(FileFilterModel file);
        List<FileFilterQuery> FindAllReports(int pageNumber, int rowsOfPage);
        List<FileFilterQuery> FindAllReports(Guid agencyId, int pageNumber, int rowsOfPage);
        List<FileFilterQuery> FindAllWrongReports(Guid? agencyId, int pageNumber, int rowsOfPage);
        List<FileFilterQuery> FindAllInActiveReports(Guid? agencyId, int pageNumber, int rowsOfPage);
        List<FileFilterQuery> FindAllReportsByParent(Guid agencyId, int pageNumber, int rowsOfPage);
    }
}
