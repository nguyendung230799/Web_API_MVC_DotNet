using REPORT_MANAGEMENT_CORE.Data;
using REPORT_MANAGEMENT_CORE.Data.Domains;
using System;
using System.Data.Entity;
using System.Runtime.Remoting.Contexts;
using System.Web.Configuration;

namespace REPORT_MANAGEMENT_CORE.Repositories.Implement
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly ApplicationDbContext _context;
        public UnitOfWork(ApplicationDbContext context)
        {
            _context = context;
            Users = new UserRepository(_context);
            Files = new FileRepository(_context);
            Folders = new FolderRepository(_context);
            FileMetadata = new FileMetadataRepository(_context);
            CatalogueBudgets = new CatalogueBudgetRepository(_context);
            CatalogueDepartments = new CatalogueDepartmentRepository(_context);
        }

        public IGenericRepository<T> GenericRepository<T>() where T : class
        {
            return new GenericRepository<T>(_context);
        }
        public IUserRepository Users { get; private set; }
        public IFileRepository Files { get; private set; }
        public IFileMetadataRepository FileMetadata { get; private set; }
        public IFolderRepository Folders { get; private set; }
        public ICatalogueBudgetRepository CatalogueBudgets { get; private set; }
        public ICatalogueDepartmentRepository CatalogueDepartments { get; private set; }
        public int Complete()
        {
            return _context.SaveChanges();
        }

        private bool disposed = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    _context.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        //public void Dispose() => _context.Dispose();

        public void Commit() 
        {
            _context.SaveChanges();
        }

        public void RollBack()
        {
            foreach (var entry in _context.ChangeTracker.Entries())
            {
                switch (entry.State)
                {
                    case EntityState.Added:
                        entry.State = EntityState.Detached;
                        break;
                }
            }
        }
    }
}

