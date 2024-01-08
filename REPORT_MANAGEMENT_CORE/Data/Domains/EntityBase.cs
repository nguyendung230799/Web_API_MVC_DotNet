using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace REPORT_MANAGEMENT_CORE.Data.Domains
{
    public class EntityBase
    {
        [Key]
        [Column("Id")]
        //[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public virtual Guid Id { get; set; }
        public virtual bool IsActivated { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public DateTime CreatedAt { get; set; } = DateTime.Now;
        [DatabaseGenerated(DatabaseGeneratedOption.Computed)]
        public DateTime UpdatedAt { get; set; } = DateTime.Now;

        public string CreatedBy { get; set; }
        public string UpdatedBy { get; set; }

        [NotMapped]
        public virtual bool IsDeleted { get; set; }
        [NotMapped]
        public virtual bool IsModified { get; set; }
        [NotMapped]
        public virtual bool IsAdded { get; set; }
    }
}
