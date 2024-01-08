using REPORT_MANAGEMENT_CORE.Data.Domains;
using REPORT_MANAGEMENT_CORE.Data.Model;
using REPORT_MANAGEMENT_CORE.Data.Query;
using REPORT_MANAGEMENT_CORE.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace REPORT_MANAGEMENT_CORE.Services.Implement
{
    public class FileService : IFileService
    {
        private readonly IUnitOfWork _unitOfWork;

        public FileService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public FileFilterQuery FindReport(Guid id)
        {
            return _unitOfWork.Files.FindReport(id);
        }

        public File Find(Guid id)
        {
            return _unitOfWork.Files.Find(id);
        }
        public void Update(File file)
        {
            _unitOfWork.Files.Update(file);
            _unitOfWork.Complete();
        }
        public List<FileFilterQuery> FindAllReports() { 
            return _unitOfWork.Files.FindAllReports();
        }
        public List<FileFilterQuery> FindAllReportsByParent(Guid userId, int pageNumber, int rowsOfPage)
        {
            return _unitOfWork.Files.FindAllReportsByParent(userId, pageNumber, rowsOfPage);
        }
        public List<FileFilterQuery> FindAllReports(Guid userId, int pageNumber, int rowsOfPage)
        {
            return _unitOfWork.Files.FindAllReports(userId, pageNumber, rowsOfPage);
        }
        public List<FileFilterQuery> FindAllReports(int pageNumber, int rowsOfPage)
        {
            return _unitOfWork.Files.FindAllReports(pageNumber, rowsOfPage);
        }

        public List<FileFilterQuery> FindAllInActiveReports(Guid? userId, int pageNumber, int rowsOfPage)
        {
            return _unitOfWork.Files.FindAllInActiveReports(userId, pageNumber, rowsOfPage);
        }
        public List<FileFilterQuery> FindAllWrongReports(Guid? userId, int pageNumber, int rowsOfPage)
        {
            return _unitOfWork.Files.FindAllWrongReports(userId, pageNumber, rowsOfPage);
        }
        public List<FileFilterQuery> FindAllReports(FileFilterModel file)
        {
            return _unitOfWork.Files.FindAllReports(file);
        }
    }
}