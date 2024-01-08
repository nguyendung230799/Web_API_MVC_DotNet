using REPORT_MANAGEMENT_CORE.Data;
using REPORT_MANAGEMENT_CORE.Data.Domains;

namespace REPORT_MANAGEMENT_CORE.Repositories.Implement
{
    public class FolderRepository : GenericRepository<Folder>, IFolderRepository
    {
        public FolderRepository(ApplicationDbContext context) : base(context) { }
    }
}
