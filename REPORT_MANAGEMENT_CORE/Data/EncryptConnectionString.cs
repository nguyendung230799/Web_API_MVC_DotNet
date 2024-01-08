using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data.Entity.Core.EntityClient;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace REPORT_MANAGEMENT_CORE.Data
{
    public class EncryptConnectionString
    {
        public static string EFConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                //string connectionString = $"Server={address}; Database={database}; User ID={account}; Password={password}; Trusted_Connection=True; MultipleActiveResultSets=True; Integrated Security=False";

                // string connectionString = ConfigurationManager.AppSettings["DefaultConnection"];
                // string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                // var section = System.Web.Configuration.WebConfigurationManager.GetSection("secureAppSettings") as NameValueCollection;

                /*
                var section = System.Web.Configuration.WebConfigurationManager.GetSection("secureAppSettings") as NameValueCollection;
                if (section != null && section["Password"] != null)
                {
                    string passwordValue = section["Password"];
                }

                //string encoding = Encoding.UTF8.GetString(Convert.FromBase64String("RmlsZU1hbmFnZW1lbnRfQVBJ"));
                //string address = new IPAddress(0x0A3C6CF6).ToString();

                SqlConnectionStringBuilder providerCs = new SqlConnectionStringBuilder();
                providerCs.InitialCatalog = ConfigurationManager.AppSettings["DatabaseName"];
                providerCs.UserID = ConfigurationManager.AppSettings["UserId"];
                providerCs.Password = ConfigurationManager.AppSettings["Password"];
                providerCs.DataSource = ConfigurationManager.AppSettings["ServerName"];
                providerCs.DataSource = ConfigurationManager.GetSection("ServerName").ToString();
                //providerCs.UserID = CryptoService2.Decrypt(ConfigurationManager.AppSettings["UserId"]);

                providerCs.MultipleActiveResultSets = true;
                providerCs.TrustServerCertificate = false;

                EntityConnectionStringBuilder ecsb = new EntityConnectionStringBuilder();
                ecsb.Provider = "System.Data.SqlClient";
                ecsb.ProviderConnectionString = providerCs.ToString();

                ecsb.Metadata = string.Format("res://{0}/EDModel.csdl|res://{0}/EDModel.ssdl|res://{0}/EDModel.msl", typeof(ApplicationDbContext).Assembly.FullName);

                return ecsb.ToString();

                */
            }
        }
    }
}
    