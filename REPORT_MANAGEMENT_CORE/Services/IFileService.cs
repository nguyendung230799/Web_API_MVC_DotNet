using REPORT_MANAGEMENT_CORE.Data.Domains;
using REPORT_MANAGEMENT_CORE.Data.Model;
using REPORT_MANAGEMENT_CORE.Data.Query;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace REPORT_MANAGEMENT_CORE.Services
{
    public interface IFileService
    {
        FileFilterQuery FindReport(Guid id);
        File Find(Guid id);
        void Update(File file);
        List<FileFilterQuery> FindAllReports();
        List<FileFilterQuery> FindAllReports(FileFilterModel file);
        List<FileFilterQuery> FindAllReports(Guid userId, int pageNumber, int rowsOfPage);
        List<FileFilterQuery> FindAllReports(int pageNumber, int rowsOfPage);
        List<FileFilterQuery> FindAllWrongReports(Guid? userId, int pageNumber, int rowsOfPage);
        List<FileFilterQuery> FindAllInActiveReports(Guid? userId, int pageNumber, int rowsOfPage);
        List<FileFilterQuery> FindAllReportsByParent(Guid userId, int pageNumber, int rowsOfPage);
    }
}