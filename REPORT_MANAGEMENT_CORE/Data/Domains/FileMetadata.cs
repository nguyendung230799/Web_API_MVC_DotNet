using System.ComponentModel.DataAnnotations.Schema;

namespace REPORT_MANAGEMENT_CORE.Data.Domains
{
    public class FileMetadata : EntityBase
    {
        public FileMetadata() { }
        public FileMetadata(string module, string subModule, string department, int typeModule, string timeModule)
        {
            Module = module;
            SubModule = subModule;
            Department = department;
            TypeModule = typeModule;
            TimeModule = timeModule; // 1,2,3,4,I,II,III,IV
        }
        public string Module { get; set; }
        public string SubModule { get; set; }
        public string Department { get; set; }
        public string TimeModule { get; set; }
        public int? YearOfWork { get; set; }
        public int? YearOfBudget { get; set; }
        public int? SourceOfBudget { get; set; }
        public int? TypeModule { get; set; }
        public string TokenKey { get; set; }

        [NotMapped]
        public override bool IsActivated { get; set; }
    }
}
