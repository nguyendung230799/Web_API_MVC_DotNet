using System;
using System.ComponentModel;

namespace REPORT_MANAGEMENT_CORE.Data.Domains
{
    public partial class File : EntityBase
    {
        public string Name { get; set; }

        public string Description { get; set; }

        public string Path { get; set; }

        public Guid FolderId { get; set; }

        public Guid? MetadataId { get; set; }
        public override bool IsDeleted { get; set; }
    }
}