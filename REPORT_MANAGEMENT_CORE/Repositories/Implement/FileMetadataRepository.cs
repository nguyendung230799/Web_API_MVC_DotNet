using REPORT_MANAGEMENT_CORE.Data;

namespace REPORT_MANAGEMENT_CORE.Repositories.Implement
{
    public class FileMetadataRepository : GenericRepository<Data.Domains.FileMetadata>, IFileMetadataRepository
    {
        public FileMetadataRepository(ApplicationDbContext context) : base(context) { }
    }
}
