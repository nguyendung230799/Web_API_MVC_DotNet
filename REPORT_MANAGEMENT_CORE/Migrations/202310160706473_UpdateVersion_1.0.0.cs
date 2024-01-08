namespace REPORT_MANAGEMENT_APP.Migrations
{
    using System.Data.Entity.Migrations;

    public partial class UpdateVersion_100 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.ActivityLog",
                c => new
                {
                    Id = c.Guid(nullable: false, identity: true),
                    UserId = c.Guid(nullable: false, identity: true),
                    Content = c.String(),
                    Detail = c.String(),
                    CreatedAt = c.DateTime(nullable: false, defaultValueSql: "GETDATE()"),
                    UpdatedAt = c.DateTime(nullable: false, defaultValueSql: "GETDATE()"),
                    CreatedBy = c.String(),
                    UpdatedBy = c.String(),
                })
                .PrimaryKey(t => t.Id);

            CreateTable(
                "dbo.CatalogueBudgets",
                c => new
                {
                    Id = c.Guid(nullable: false, identity: true),
                    ParentId = c.Guid(),
                    CodeChain = c.String(),
                    LNS = c.String(),
                    L = c.String(),
                    K = c.String(),
                    M = c.String(),
                    TM = c.String(),
                    TTM = c.String(),
                    NG = c.String(),
                    TNG = c.String(),
                    Description = c.String(),
                    YearOfWork = c.Int(),
                    IsParent = c.Boolean(nullable: false),
                    DepartmentId = c.String(),
                    Type = c.String(),
                    RankCode = c.String(),
                    IsActivated = c.Boolean(nullable: false, defaultValue: true),
                    CreatedAt = c.DateTime(nullable: false, defaultValueSql: "GETDATE()"),
                    UpdatedAt = c.DateTime(nullable: false, defaultValueSql: "GETDATE()"),
                    CreatedBy = c.String(),
                    UpdatedBy = c.String(),
                })
                .PrimaryKey(t => t.Id);

            CreateTable(
                "dbo.CatalogueManager",
                c => new
                {
                    Id = c.Guid(nullable: false, identity: true),
                    Code = c.String(),
                    YearOfWork = c.Int(),
                    Sign = c.String(),
                    Name = c.String(),
                    Ordinal = c.Int(),
                    IsActivated = c.Boolean(nullable: false, defaultValue: true),
                    CreatedAt = c.DateTime(nullable: false, defaultValueSql: "GETDATE()"),
                    UpdatedAt = c.DateTime(nullable: false, defaultValueSql: "GETDATE()"),
                    CreatedBy = c.String(),
                    UpdatedBy = c.String(),
                })
                .PrimaryKey(t => t.Id);

            CreateTable(
                "dbo.Document",
                c => new
                {
                    Id = c.Guid(nullable: false, identity: true),
                    UserId = c.Guid(nullable: false, identity: true),
                    Content = c.String(),
                    ViewFrequency = c.Int(nullable: false),
                    IsRead = c.Boolean(nullable: false),
                    IsActivated = c.Boolean(nullable: false, defaultValue: true),
                    CreatedAt = c.DateTime(nullable: false, defaultValueSql: "GETDATE()"),
                    UpdatedAt = c.DateTime(nullable: false, defaultValueSql: "GETDATE()"),
                    CreatedBy = c.String(),
                    UpdatedBy = c.String(),
                })
                .PrimaryKey(t => t.Id);

            CreateTable(
                "dbo.FileMetadata",
                c => new
                {
                    Id = c.Guid(nullable: false, identity: true),
                    Module = c.String(),
                    SubModule = c.String(),
                    Department = c.String(),
                    TimeModule = c.String(),
                    YearOfWork = c.Int(),
                    YearOfBudget = c.Int(),
                    SourceOfBudget = c.Int(),
                    TypeModule = c.Int(),
                    TokenKey = c.String(),
                    CreatedAt = c.DateTime(nullable: false, defaultValueSql: "GETDATE()"),
                    UpdatedAt = c.DateTime(nullable: false, defaultValueSql: "GETDATE()"),
                    CreatedBy = c.String(),
                    UpdatedBy = c.String(),
                })
                .PrimaryKey(t => t.Id);

            CreateTable(
                "dbo.File",
                c => new
                {
                    Id = c.Guid(nullable: false, identity: true),
                    Name = c.String(),
                    Description = c.String(),
                    Path = c.String(),
                    FolderId = c.Guid(nullable: false, identity: true),
                    MetadataId = c.Guid(),
                    IsActivated = c.Boolean(nullable: false, defaultValue: true),
                    CreatedAt = c.DateTime(nullable: false, defaultValueSql: "GETDATE()"),
                    UpdatedAt = c.DateTime(nullable: false, defaultValueSql: "GETDATE()"),
                    CreatedBy = c.String(),
                    UpdatedBy = c.String(),
                })
                .PrimaryKey(t => t.Id);

            CreateTable(
                "dbo.Folder",
                c => new
                {
                    Id = c.Guid(nullable: false, identity: true),
                    Path = c.String(),
                    Description = c.String(),
                    UserId = c.Guid(nullable: false, identity: true),
                    IsActivated = c.Boolean(nullable: false, defaultValue: true),
                    CreatedAt = c.DateTime(nullable: false, defaultValueSql: "GETDATE()"),
                    UpdatedAt = c.DateTime(nullable: false, defaultValueSql: "GETDATE()"),
                    CreatedBy = c.String(),
                    UpdatedBy = c.String(),
                })
                .PrimaryKey(t => t.Id);

            CreateTable(
                "dbo.Notification",
                c => new
                {
                    Id = c.Guid(nullable: false, identity: true),
                    UserId = c.Guid(nullable: false, identity: true),
                    Title = c.String(),
                    Description = c.String(),
                    IsActivated = c.Boolean(nullable: false, defaultValue: true),
                    CreatedAt = c.DateTime(nullable: false, defaultValueSql: "GETDATE()"),
                    UpdatedAt = c.DateTime(nullable: false, defaultValueSql: "GETDATE()"),
                    CreatedBy = c.String(),
                    UpdatedBy = c.String(),
                })
                .PrimaryKey(t => t.Id);

            CreateTable(
                "dbo.Role",
                c => new
                {
                    Id = c.Guid(nullable: false, identity: true),
                    Name = c.String(nullable: false, maxLength: 256),
                })
                .PrimaryKey(t => t.Id)
                .Index(t => t.Name, unique: true, name: "RoleNameIndex");

            CreateTable(
                "dbo.UserRole",
                c => new
                {
                    UserId = c.Guid(nullable: false, identity: true),
                    RoleId = c.Guid(nullable: false, identity: true),
                })
                .PrimaryKey(t => new { t.UserId, t.RoleId })
                .ForeignKey("dbo.Role", t => t.RoleId, cascadeDelete: true)
                .ForeignKey("dbo.User", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId)
                .Index(t => t.RoleId);

            CreateTable(
                "dbo.User",
                c => new
                {
                    Id = c.Guid(nullable: false, identity: true),
                    ParentId = c.Guid(),
                    Code = c.String(),
                    Name = c.String(),
                    Ordinal = c.Long(nullable: false),
                    Rank = c.Int(),
                    Department = c.String(),
                    Description = c.String(),
                    Hometown = c.String(),
                    ProfilePicture = c.Binary(),
                    CreatedAt = c.DateTime(nullable: false, defaultValueSql: "GETDATE()"),
                    UpdatedAt = c.DateTime(nullable: false, defaultValueSql: "GETDATE()"),
                    Email = c.String(maxLength: 256),
                    EmailConfirmed = c.Boolean(nullable: false),
                    PasswordHash = c.String(),
                    SecurityStamp = c.String(),
                    PhoneNumber = c.String(),
                    PhoneNumberConfirmed = c.Boolean(nullable: false),
                    TwoFactorEnabled = c.Boolean(nullable: false),
                    LockoutEndDateUtc = c.DateTime(),
                    LockoutEnabled = c.Boolean(nullable: false),
                    AccessFailedCount = c.Int(nullable: false),
                    UserName = c.String(nullable: false, maxLength: 256),
                })
                .PrimaryKey(t => t.Id)
                .Index(t => t.UserName, unique: true, name: "UserNameIndex");

            CreateTable(
                "dbo.UserClaim",
                c => new
                {
                    Id = c.Int(nullable: false, identity: true),
                    UserId = c.Guid(nullable: false, identity: true),
                    ClaimType = c.String(),
                    ClaimValue = c.String(),
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.User", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);

            CreateTable(
                "dbo.UserLogin",
                c => new
                {
                    LoginProvider = c.String(nullable: false, maxLength: 128),
                    ProviderKey = c.String(nullable: false, maxLength: 128),
                    UserId = c.Guid(nullable: false, identity: true),
                })
                .PrimaryKey(t => new { t.LoginProvider, t.ProviderKey, t.UserId })
                .ForeignKey("dbo.User", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);

        }

        public override void Down()
        {
            DropForeignKey("dbo.UserRole", "UserId", "dbo.User");
            DropForeignKey("dbo.UserLogin", "UserId", "dbo.User");
            DropForeignKey("dbo.UserClaim", "UserId", "dbo.User");
            DropForeignKey("dbo.UserRole", "RoleId", "dbo.Role");
            DropIndex("dbo.UserLogin", new[] { "UserId" });
            DropIndex("dbo.UserClaim", new[] { "UserId" });
            DropIndex("dbo.User", "UserNameIndex");
            DropIndex("dbo.UserRole", new[] { "RoleId" });
            DropIndex("dbo.UserRole", new[] { "UserId" });
            DropIndex("dbo.Role", "RoleNameIndex");
            DropTable("dbo.UserLogin");
            DropTable("dbo.UserClaim");
            DropTable("dbo.User");
            DropTable("dbo.UserRole");
            DropTable("dbo.Role");
            DropTable("dbo.Notification");
            DropTable("dbo.Folder");
            DropTable("dbo.File");
            DropTable("dbo.FileMetadata");
            DropTable("dbo.Document");
            DropTable("dbo.CatalogueManager");
            DropTable("dbo.CatalogueBudgets");
            DropTable("dbo.ActivityLog");
        }
    }
}
