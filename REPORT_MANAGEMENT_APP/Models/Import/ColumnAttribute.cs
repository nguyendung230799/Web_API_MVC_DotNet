using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace REPORT_MANAGEMENT_APP.Models
{
    public class ColumnAttribute
    {
        public string ColumnName { get; set; }
        public int ColumnIndex { get; set; }
        public bool IsRequired { get; set; }
    }
}