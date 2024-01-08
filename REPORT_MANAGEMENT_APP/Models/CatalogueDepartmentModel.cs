using REPORT_MANAGEMENT_CORE.Data.Domains;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;

namespace REPORT_MANAGEMENT_APP.Models
{
    public partial class CatalogueDepartmentModel
    {
        [JsonProperty("Số thứ tự")]
        public int? Ordinal { get; set; }
        [JsonProperty("Mã B quản lý")]
        public string Code { get; set; }
        [JsonProperty("Năm làm việc")]
        public int? YearOfWork { get; set; }
        [JsonProperty("Số ký hiệu")]
        public string Sign { get; set; }
        [JsonProperty("Tên B quản lý")]
        public string Name { get; set; }
    }  
}
