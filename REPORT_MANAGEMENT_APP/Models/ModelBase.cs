using System;

namespace REPORT_MANAGEMENT_APP.Models
{
    public class ModelBase
    {
        public virtual Guid Id { get; set; }
        public int? Page { get; set; }
        public int? Total { get; set; }
        public bool IsDeleted { get; set; }
        public bool IsModified { get; set; }
        public bool IsAdded { get; set; }
        public bool IsFilter { get; set; }
        public bool IsSelected { get; set; }
        public bool IsChecked { get; set; }
        public bool IsParent { get; set; }
        public bool IsActivated { get; set; }
        public virtual string DetailInfoModalTitle => "Chi tiết";
        public virtual bool IsEditable => !IsParent && !IsDeleted;
    }
}


