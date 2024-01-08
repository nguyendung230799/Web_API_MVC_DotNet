using System;

namespace REPORT_MANAGEMENT_CORE.Data.Domains
{
    public partial class Folder : EntityBase
    {
        public string Path { get; set; }
        public string Description { get; set; }
        public Guid UserId { get; set; }
    }
}