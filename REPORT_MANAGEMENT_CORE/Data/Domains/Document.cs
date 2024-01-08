using System;

namespace REPORT_MANAGEMENT_CORE.Data.Domains
{
    public partial class Document : EntityBase
    {
        public Document() { }

        public Guid UserId { get; set; }
        public string Content { get; set; }
        public int ViewFrequency { get; set; }
        public bool IsRead { get; set; }
    }
}