namespace REPORT_MANAGEMENT_APP.Migrations
{
    using REPORT_MANAGEMENT_CORE.Data;
    using System.Data.Entity.Migrations;

    internal sealed class Configuration : DbMigrationsConfiguration<ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
            AutomaticMigrationDataLossAllowed = false;
        }

        protected override void Seed(ApplicationDbContext context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method
            //  to avoid creating duplicate seed data.
            /*
            context.Users.AddOrUpdate(x => x.Id,
                new REPORT_MANAGEMENT_CORE.Data.Domains.ApplicationUser
                {
                    Id = Guid.NewGuid(),
                    UserName = Constants.EMAIL_ADMIN,
                    Email = Constants.EMAIL_ADMIN,
                    Hometown = Constants.HOMETOWN,
                    EmailConfirmed = true
                });
            */
        }
    }
}
