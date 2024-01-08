using REPORT_MANAGEMENT_CORE.Data;
using REPORT_MANAGEMENT_CORE.Data.Domains;
using REPORT_MANAGEMENT_CORE.Data.Model;
using REPORT_MANAGEMENT_CORE.Data.Query;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;

namespace REPORT_MANAGEMENT_CORE.Repositories.Implement
{
    public class FileRepository : GenericRepository<File>, IFileRepository
    {
        public FileRepository(ApplicationDbContext context) : base(context) { }


        public FileFilterQuery FindReport(Guid id)
        {
            string sql = "";
            sql += $@"
                SELECT                 
                a.Name AS FileName,                 
                a.Description AS FileDescription,                 
                a.Path AS FilePath,                 
                a.Id AS FileId,                 
                b.Path AS FolderPath,                 
                c.Name AS AgencyName,                 
                c.Code AS AgencyCode,                 
                c.Department AS AgencyDepartment,                 
                d.Module,                 
                d.SubModule,                 
                d.TimeModule,                 
                d.Department as FileDepartment,
                d.TokenKey AS FileTokenKey
                FROM [File] AS a                 
                INNER JOIN [Folder] AS b ON b.Id = a.FolderId                 
                INNER JOIN [User] AS c ON c.Id = b.UserId                 
                LEFT JOIN [FileMetadata] d ON a.MetadataId = d.Id                 
                WHERE a.IsActivated = 1      
                AND a.Id = '{id}'
                ORDER BY d.UpdatedAt DESC
                ";

            return _context.FromSqlQuery<FileFilterQuery>(sql).FirstOrDefault();
        }

        public List<FileFilterQuery> FindAllReports()
        {
            string sql = "";
            sql += @"
                SELECT                 
                a.Name AS FileName,                 
                a.Description AS FileDescription,                 
                a.Path AS FilePath,                 
                a.Id AS FileId,                 
                b.Path AS FolderPath,                 
                c.Name AS AgencyName,                 
                c.Code AS AgencyCode,                 
                c.Department AS AgencyDepartment,                 
                d.Module,                 
                d.SubModule,                 
                d.TimeModule,                 
                d.Department as FileDepartment,    
                d.TokenKey AS FileTokenKey
                FROM [File] AS a                 
                INNER JOIN [Folder] AS b ON b.Id = a.FolderId                 
                INNER JOIN [User] AS c ON c.Id = b.UserId                 
                LEFT JOIN [FileMetadata] d ON a.MetadataId = d.Id                 
                ORDER BY d.UpdatedAt DESC
                ";

            return _context.FromSqlQuery<FileFilterQuery>(sql).ToList();
        }

        public List<FileFilterQuery> FindAllReports(FileFilterModel file)
        {
            if (file == null)
            {
                return new List<FileFilterQuery>();
            }
            var listParameter = new List<DbParameter>()
            {
                new SqlParameter("@agencyParentId", file.AgencyParentId),
                new SqlParameter("@agencyCode", file.AgencyCode ?? string.Empty),
                new SqlParameter("@quarterMonth", file.QuarterMonth),
                new SqlParameter("@yearOfWork", file.YearOfWork ?? 0),
                new SqlParameter("@yearOfBudget", file.YearOfBudget ?? 0),
                new SqlParameter("@sourceOfBudget", file.SourceOfBudget ?? 0),
                new SqlParameter("@module", file.Module ?? string.Empty),
                new SqlParameter("@subModule", file.SubModule ?? string.Empty),
                new SqlParameter("@agencyDepartment", file.AgencyDepartment ?? string.Empty),
            };

            string sql = "";
            sql += @"
                SELECT
                a.Name AS FileName,
                a.Description AS FileDescription,
                a.Path AS FilePath,
                a.Id AS FileId,
                b.Path AS FolderPath,
                c.Name AS AgencyName,
                c.Code AS AgencyCode,
                c.Department AS AgencyDepartment,
                e.Module,
                e.UpdatedAt AS LastModified,
                e.SubModule,
                e.TimeModule,
                e.Department AS FileDepartment,
                e.TokenKey AS FileTokenKey
                FROM [File] AS a
                INNER JOIN [Folder] AS b ON b.Id = a.FolderId
                INNER JOIN [User] AS c ON c.Id = b.UserId
                LEFT JOIN [FileMetadata] e ON a.MetadataId = e.Id
                WHERE a.IsActivated = 1
                AND (c.ParentId = @agencyParentId)
                AND ((ISNULL(@agencyCode, '') = '') OR c.Code = @agencyCode)
                AND ((ISNULL(@quarterMonth, '') = '') OR e.TimeModule IN (SELECT * FROM f_split(@quarterMonth, '.')))
                AND ((ISNULL(@yearOfWork, 0) = 0) OR e.YearOfWork = @yearOfWork)
                AND ((ISNULL(@yearOfBudget, 0) = 0) OR e.YearOfBudget = @yearOfBudget)
                AND ((ISNULL(@sourceOfBudget, 0) = 0) OR e.SourceOfBudget = @sourceOfBudget)
                AND ((ISNULL(@module, '') = '') OR e.Module = @module)
                AND ((ISNULL(@subModule, '') = '') OR e.SubModule = @subModule)
                AND ((ISNULL(@agencyDepartment, '') = '') OR e.Department IN (SELECT * FROM f_split(@agencyDepartment, ',')))
                ORDER BY e.UpdatedAt DESC
                ";
            return _context.FromSqlQuery<FileFilterQuery>(sql, listParameter).ToList();
        }


        public List<FileFilterQuery> FindAllReportsByParent(Guid userId, int pageNumber, int rowsOfPage)
        {
            if (userId == null)
            {
                return new List<FileFilterQuery>();
            }
            var listParameter = new List<DbParameter>()
            {
                new SqlParameter("@agencyId", userId),
            };

            string sql = $@"
                SELECT              
                COUNT(a.Id) OVER() AS Total,
                ROW_NUMBER() OVER(ORDER BY d.UpdatedAt DESC) AS Ordinal,
				a.Id AS Id,
                a.Name AS FileName,                 
                a.Description AS FileDescription,                 
                a.Path AS FilePath,                 
                a.Id AS FileId,                 
                b.Path AS FolderPath,                 
                c.Name AS AgencyName,                 
                c.Code AS AgencyCode,                 
                c.Department AS AgencyDepartment,                 
                d.Module,                 
                d.SubModule,                 
                d.TimeModule,                 
                d.Department as FileDepartment,
                d.TokenKey AS FileTokenKey
                FROM [File] AS a                 
                INNER JOIN [Folder] AS b ON b.Id = a.FolderId                 
                INNER JOIN [User] AS c ON c.Id = b.UserId                 
                LEFT JOIN [FileMetadata] d ON a.MetadataId = d.Id                 
                WHERE a.IsActivated = 1         
                AND c.ParentId = '{userId}'
                ORDER BY d.UpdatedAt DESC
				OFFSET {(pageNumber - 1) * rowsOfPage} ROWS 
				FETCH NEXT {rowsOfPage} ROWS ONLY
                ";

            return _context.FromSqlQuery<FileFilterQuery>(sql, listParameter).ToList();
        }

        public List<FileFilterQuery> FindAllReports(Guid userId, int pageNumber, int rowsOfPage)
        {
            if (userId == null)
            {
                return new List<FileFilterQuery>();
            }
            var listParameter = new List<DbParameter>()
            {
                new SqlParameter("@userId", userId),
            };

            string sql = $@"
                SELECT              
                COUNT(a.Id) OVER() AS Total,
                ROW_NUMBER() OVER(ORDER BY d.UpdatedAt DESC) AS Ordinal,
                a.Name AS FileName,                 
                a.Description AS FileDescription,                 
                a.Path AS FilePath,                 
                a.Id AS FileId,                 
                b.Path AS FolderPath,                 
                c.Name AS AgencyName,                 
                c.Code AS AgencyCode,                 
                c.Department AS AgencyDepartment,                 
                d.Module,                 
                d.SubModule,                 
                d.TimeModule,                 
                d.Department as FileDepartment,
                d.TokenKey AS FileTokenKey
                FROM [File] AS a                 
                INNER JOIN [Folder] AS b ON b.Id = a.FolderId                 
                INNER JOIN [User] AS c ON c.Id = b.UserId                 
                LEFT JOIN [FileMetadata] d ON a.MetadataId = d.Id                 
                WHERE a.IsActivated = 1         
                AND c.Id = '{userId}'
                ORDER BY d.UpdatedAt DESC
				OFFSET {(pageNumber - 1) * rowsOfPage} ROWS 
				FETCH NEXT {rowsOfPage} ROWS ONLY
                ";
            return _context.FromSqlQuery<FileFilterQuery>(sql, listParameter).ToList();
        }

        public List<FileFilterQuery> FindAllWrongReports(Guid? userId, int pageNumber, int rowsOfPage)
        {
            string sql = $@"
                SELECT              
                COUNT(a.Id) OVER() AS Total,
                ROW_NUMBER() OVER(ORDER BY d.UpdatedAt DESC) AS Ordinal,
				a.Id AS Id,
                a.Name AS FileName,                 
                a.Description AS FileDescription,                 
                a.Path AS FilePath,                 
                a.Id AS FileId,                 
                b.Path AS FolderPath,                 
                c.Name AS AgencyName,                 
                c.Code AS AgencyCode,                 
                c.Department AS AgencyDepartment,                 
                d.Module,                 
                d.SubModule,                 
                d.TimeModule,                 
                d.Department as FileDepartment,
                d.TokenKey AS FileTokenKey
                FROM [File] AS a                 
                INNER JOIN [Folder] AS b ON b.Id = a.FolderId                 
                INNER JOIN [User] AS c ON c.Id = b.UserId                 
                LEFT JOIN [FileMetadata] d ON a.MetadataId = d.Id                 
                WHERE a.IsActivated = 1        
                AND d.Department NOT IN (SELECT * FROM f_split(c.Department, ','))
                AND (ISNULL('{userId}', '') = '' OR c.Id = '{userId}')
                ORDER BY d.UpdatedAt DESC
				OFFSET {(pageNumber - 1) * rowsOfPage} ROWS 
				FETCH NEXT {rowsOfPage} ROWS ONLY
                ";
            return _context.FromSqlQuery<FileFilterQuery>(sql).ToList();
        }

        public List<FileFilterQuery> FindAllInActiveReports(Guid? userId, int pageNumber, int rowsOfPage)
        {
            //var listParameter = new List<DbParameter>()
            //{
            //    new SqlParameter("@userId", userId),
            //};

            string sql = $@"
                SELECT              
                COUNT(a.Id) OVER() AS Total,
                ROW_NUMBER() OVER(ORDER BY d.UpdatedAt DESC) AS Ordinal,
				a.Id AS Id,
                a.Name AS FileName,                 
                a.Description AS FileDescription,                 
                a.Path AS FilePath,                 
                a.Id AS FileId,                 
                b.Path AS FolderPath,                 
                c.Name AS AgencyName,                 
                c.Code AS AgencyCode,                 
                c.Department AS AgencyDepartment,                 
                d.Module,                 
                d.SubModule,                 
                d.TimeModule,                 
                d.Department as FileDepartment,
                d.TokenKey AS FileTokenKey
                FROM [File] AS a                 
                INNER JOIN [Folder] AS b ON b.Id = a.FolderId                 
                INNER JOIN [User] AS c ON c.Id = b.UserId                 
                LEFT JOIN [FileMetadata] d ON a.MetadataId = d.Id                 
                WHERE a.IsActivated = 0         
                AND (ISNULL('{userId}', '') = '' OR c.Id = '{userId}')
                ORDER BY d.UpdatedAt DESC
				OFFSET {(pageNumber - 1) * rowsOfPage} ROWS 
				FETCH NEXT {rowsOfPage} ROWS ONLY
                ";
            return _context.FromSqlQuery<FileFilterQuery>(sql).ToList();
        }

        public List<FileFilterQuery> FindAllReports(int pageNumber, int rowsOfPage)
        {
            string sql = $@"
                SELECT              
                COUNT(a.Id) OVER() AS Total,
                ROW_NUMBER() OVER(ORDER BY d.UpdatedAt DESC) AS Ordinal,
				a.Id AS Id,
                a.Name AS FileName,                 
                a.Description AS FileDescription,                 
                a.Path AS FilePath,                 
                a.Id AS FileId,                 
                b.Path AS FolderPath,                 
                c.Name AS AgencyName,                 
                c.Code AS AgencyCode,                 
                c.Department AS AgencyDepartment,                 
                d.Module,                 
                d.SubModule,                 
                d.TimeModule,                 
                d.Department as FileDepartment,
                d.TokenKey AS FileTokenKey
                FROM [File] AS a                 
                INNER JOIN [Folder] AS b ON b.Id = a.FolderId                 
                INNER JOIN [User] AS c ON c.Id = b.UserId                 
                LEFT JOIN [FileMetadata] d ON a.MetadataId = d.Id                 
                WHERE a.IsActivated = 1         
                ORDER BY d.UpdatedAt DESC
				OFFSET {(pageNumber - 1) * rowsOfPage} ROWS 
				FETCH NEXT {rowsOfPage} ROWS ONLY
                ";
            return _context.FromSqlQuery<FileFilterQuery>(sql).ToList();
        }
    }
}
