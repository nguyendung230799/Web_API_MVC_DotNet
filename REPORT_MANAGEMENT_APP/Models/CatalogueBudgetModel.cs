using REPORT_MANAGEMENT_CORE.Data.Domains;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;

namespace REPORT_MANAGEMENT_APP.Models
{
    public partial class CatalogueBudgetModel
    {
        //public Guid? Id { get; set; }
        //public Guid? ParentId { get; set; }
        //public string CodeChain { get; set; }
        [JsonProperty("STT")]
        public long Ordinal { get; set; }
        public string LNS { get; set; }
        public string L { get; set; }
        public string K { get; set; }
        public string M { get; set; }
        public string TM { get; set; }
        public string TTM { get; set; }
        public string NG { get; set; }
        public string TNG { get; set; }
        [JsonProperty("Mô tả")]
        public string Description { get; set; }
        //public int? YearOfWork { get; set; }
        //public bool IsParent { get; set; }
        [JsonProperty("Mã phòng ban")]
        public string DepartmentId { get; set; }
        [JsonProperty("Loại mục lục")]
        public string Type { get; set; }
        [JsonProperty("Mã cấp bậc")]
        public string LevelCode { get; set; }
        //public CatalogueBudget Parent { get; set; }
        //public ICollection<CatalogueBudget> Children { get; set; }

    }  
}
