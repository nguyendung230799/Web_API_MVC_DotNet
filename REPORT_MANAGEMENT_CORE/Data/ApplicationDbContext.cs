using Microsoft.AspNet.Identity.EntityFramework;
using REPORT_MANAGEMENT_APP.Migrations;
using REPORT_MANAGEMENT_CORE.Data.Domains;
using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Common;
using System.Data.Entity;
using static REPORT_MANAGEMENT_CORE.Data.Domains.IdentityModels;

namespace REPORT_MANAGEMENT_CORE.Data
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser, ApplicationRole, Guid, ApplicationUserLogin, ApplicationUserRole, ApplicationUserClaim>
    {
        static string s_connectionString = EncryptConnectionString.EFConnectionString;
        public ApplicationDbContext()
            //: base("DefaultConnection")
            : base(s_connectionString)
        {
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<ApplicationDbContext, Configuration>());
        }

        public DbSet<File> Files { get; set; }
        public DbSet<Folder> Folders { get; set; }
        public DbSet<FileMetadata> FileMetadata { get; set; }
        public DbSet<CatalogueBudget> CatalogueBudgets { get; set; }
        public DbSet<CatalogueDepartment> CatalogueDepartments { get; set; }
        public DbSet<ActivityLog> ActivityLog { get; set; }
        public DbSet<Document> Documents { get; set; }
        public DbSet<Notification> Notifications { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            // This needs to go before the other rules!
            base.OnModelCreating(modelBuilder); 

            modelBuilder.Entity<ActivityLog>().ToTable("ActivityLog");
            modelBuilder.Entity<Notification>().ToTable("Notification");
            modelBuilder.Entity<CatalogueDepartment>().ToTable("CatalogueManager");
            modelBuilder.Entity<Document>().ToTable("Document");
            modelBuilder.Entity<File>().ToTable("File");
            modelBuilder.Entity<Folder>().ToTable("Folder");
            modelBuilder.Entity<FileMetadata>().ToTable("FileMetadata");
            modelBuilder.Entity<ApplicationUser>().ToTable("User");
            modelBuilder.Entity<ApplicationRole>().ToTable("Role");
            modelBuilder.Entity<ApplicationUserRole>().ToTable("UserRole");
            modelBuilder.Entity<ApplicationUserClaim>().ToTable("UserClaim");
            modelBuilder.Entity<ApplicationUserLogin>().ToTable("UserLogin");

        }


        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }
    }
}