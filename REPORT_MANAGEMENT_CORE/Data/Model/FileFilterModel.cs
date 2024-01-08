using System;
using System.Collections.Generic;

namespace REPORT_MANAGEMENT_CORE.Data.Model
{
    public class FileFilterModel
    {
        Dictionary<string, string> DictionaryQuarter = new Dictionary<string, string>()
        {
            ["0"] = "",
            ["I"] = "1.2.3.1,2,3",
            ["II"] = "4.5.6.4,5,6",
            ["III"] = "7.8.9.7,8,9",
            ["IV"] = "10.11.12.10,11,12",
        };
        public Guid AgencyParentId { get; set; }
        public string AgencyCode { get; set; }
        public string AgencyDepartment { get; set; }
        public string Module { get; set; }
        public string SubModule { get; set; }
        public string Quarter { get; set; }
        public string QuarterMonth
        {
            get
            {
                if (int.TryParse(Quarter, out int result))
                {
                    return Quarter;
                }
                else if (DictionaryQuarter.ContainsKey(Quarter))
                {
                    return DictionaryQuarter[Quarter];
                }
                else return string.Empty;
            }
        }

        public int? YearOfWork { get; set; }
        public int? YearOfBudget { get; set; }
        public int? SourceOfBudget { get; set; }
        public int? TypeOfSettlement { get; set; }
    }
}