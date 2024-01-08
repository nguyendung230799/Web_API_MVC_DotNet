using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace REPORT_MANAGEMENT_CORE.Data.Domains
{
    public partial class ActivityLog : EntityBase
    {
        public ActivityLog() { }
        public Guid UserId { get; set; }
        public string Content { get; set; }
        public string Detail { get; set; }
        [NotMapped]
        public override bool IsActivated { get; set; }

    }
}