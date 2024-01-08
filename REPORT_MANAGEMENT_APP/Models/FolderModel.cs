using System;

namespace REPORT_MANAGEMENT_APP.Models
{
    public class FolderModel
    {
        public Guid Id { get; set; }
        public string Path { get; set; }
        public Guid UserId { get; set; }
    }
}
