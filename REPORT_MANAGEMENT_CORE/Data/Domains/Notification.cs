using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace REPORT_MANAGEMENT_CORE.Data.Domains
{
    public class Notification : EntityBase
    {
        public Guid UserId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
    }
}