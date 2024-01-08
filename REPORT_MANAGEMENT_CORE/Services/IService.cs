using REPORT_MANAGEMENT_CORE.Data.Domains;
using System.Collections.Generic;

namespace REPORT_MANAGEMENT_CORE.Services
{
    public abstract class IService<T> where T : EntityBase
    {
        public virtual IEnumerable<T> FindAll()
        {
            return new List<T>();
        }

        public virtual void AddOrUpdateRange(IEnumerable<T> listEntities)
        {

        }
    }
}