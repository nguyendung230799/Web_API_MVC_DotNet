using System;

namespace REPORT_MANAGEMENT_APP.Models
{
    public class FileModel
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Path { get; set; }
        public Guid FolderId { get; set; }
        public bool IsActive { get; set; }
    }
}
