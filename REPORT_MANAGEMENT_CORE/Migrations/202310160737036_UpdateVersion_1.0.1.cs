namespace REPORT_MANAGEMENT_APP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    using System.IO;

    public partial class UpdateVersion_101 : DbMigration
    {
        public override void Up()
        {
            string path = AppDomain.CurrentDomain.BaseDirectory.Replace("REPORT_MANAGEMENT_APP", "REPORT_MANAGEMENT_CORE");
            var sqlFile = Path.Combine(path, @"Migrations/Functions/f_split.sql");
            SqlFile(sqlFile);
            //var sqlFile1 = Path.Combine(path, @"Migrations/MasterData/catalogue_budget.sql");
            //SqlFile(sqlFile1);
            var sqlFile2 = Path.Combine(path, @"Migrations/MasterData/catalogue_manager.sql");
            SqlFile(sqlFile2);
            var sqlFile3 = Path.Combine(path, @"Migrations/MasterData/catalogue_unit.sql");
            SqlFile(sqlFile3);
        }

        public override void Down()
        {
        }
    }
}
