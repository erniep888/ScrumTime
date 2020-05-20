using System;
using System.Collections.Generic;
using System.Text;

namespace ScrumTime.Domain.Repositories
{
    public interface ICRUDRepository<T> : IDisposable
    {
        void Insert(T item);
        void Delete(T item);
        void Delete(long Id);
        void Update(T item);
        void Save(T item);
    }
}
