using System;

namespace REPORT_MANAGEMENT_APP.Models
{
    public class AgencyModel
    {
        public Guid Id { get; set; }
        public Guid ParentId { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Management { get; set; }
        public string Department { get; set; }
        public int Level { get; set; }
        public Guid UserId { get; set; }
        public string NameCode => !string.IsNullOrEmpty(Code) ? string.Join(StringUtilities.DASH, new string[] { Name, Code }) : Name;
        public string Info => string.Join(StringUtilities.DASH, new string[] { Code, Name, Level.ToString() });

    }
}
