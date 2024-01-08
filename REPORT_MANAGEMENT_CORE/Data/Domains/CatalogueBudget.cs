using REPORT_MANAGEMENT_CORE.Data.Domains;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace REPORT_MANAGEMENT_CORE.Data.Domains
{

    public partial class CatalogueBudget : EntityBase
    {
        public Guid? ParentId { get; set; }
        public string CodeChain { get; set; }
        public string LNS { get; set; }
        public string L { get; set; }
        public string K { get; set; }
        public string M { get; set; }
        public string TM { get; set; }
        public string TTM { get; set; }
        public string NG { get; set; }
        public string TNG { get; set; }
        public string Description { get; set; }
        public int? YearOfWork { get; set; }
        public bool IsParent { get; set; }
        public string DepartmentId { get; set; }
        public string Type { get; set; }
        public string RankCode { get; set; }
        [NotMapped]
        public long Ordinal { get; set; }
    }  
}
