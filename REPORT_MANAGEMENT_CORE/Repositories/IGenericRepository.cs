using System;
using System.Collections.Generic;
using System.Linq.Expressions;

namespace REPORT_MANAGEMENT_CORE.Repositories
{
    public interface IGenericRepository<T> where T : class
    {
        T Find(Guid id);
        IEnumerable<T> FindAll();
        IEnumerable<T> FindByCondition(Expression<Func<T, bool>> expression);
        void Add(T entity);
        void AddRange(IEnumerable<T> entities);
        void Remove(T entity);
        void RemoveRange(IEnumerable<T> entities);
        void UpdateRange(IEnumerable<T> entities);
        void Update(T entity);
    }
}


