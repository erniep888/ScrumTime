using ScrumTime.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ScrumTime.Domain.Repositories.Implementations
{
    public class ProductRepository 
    {
        private ScrumTimeContext _context;

        public ProductRepository(ScrumTimeContext context)
        {
            _context = context;
        }
        public void Delete(Product item)
        {
            if (item != null)
            {
                _context.Products.Remove(item);
                _context.SaveChanges();
            }
        }

        public void Delete(long Id)
        {
            throw new NotImplementedException();
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }

        public Product GetById(long id)
        {            
            return _context.Products.FirstOrDefault<Product>(p => p.Id == id);
        }

        public void Insert(Product item)
        {
            throw new NotImplementedException();
        }

        public void Save(Product item)
        {
            throw new NotImplementedException();
        }

        public void Update(Product item)
        {
            throw new NotImplementedException();
        }
    }
}
