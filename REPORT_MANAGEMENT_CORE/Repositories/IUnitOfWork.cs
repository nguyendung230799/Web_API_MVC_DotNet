using System;

namespace REPORT_MANAGEMENT_CORE.Repositories
{
    public interface IUnitOfWork : IDisposable
    {
        IUserRepository Users { get; }
        IFileRepository Files { get; }
        IFileMetadataRepository FileMetadata { get; }
        IFolderRepository Folders { get; }
        ICatalogueBudgetRepository CatalogueBudgets { get; }
        ICatalogueDepartmentRepository CatalogueDepartments { get; }
        int Complete();
        void RollBack();
        void Commit();
        IGenericRepository<T> GenericRepository<T>() where T : class;

    }
}
