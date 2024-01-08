using System;

namespace REPORT_MANAGEMENT_CORE.Data.Domains
{
    public partial class CatalogueDepartment : EntityBase
    {
        public string Code { get; set; }
        public int? YearOfWork { get; set; }
        public string Sign { get; set; }
        public string Name { get; set; }
        public int? Ordinal { get; set; }
    }
}