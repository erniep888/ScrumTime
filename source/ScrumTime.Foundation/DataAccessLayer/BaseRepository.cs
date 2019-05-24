using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MongoDB.Bson;
using MongoDB.Driver;
using MongoDB.Driver.Linq;
using ScrumTime.Foundation.Models;

namespace ScrumTime.Foundation.DataAccessLayer
{
    public class BaseRepository<T> where T : IScrumTimeModel
    {
        protected ScrumTimeContext scrumTimeContext;

        protected String collectionName;

        public BaseRepository(String collectionName)
        {
            scrumTimeContext = new ScrumTimeContext();
            this.collectionName = collectionName;
        }

        public IQueryable<T> GetCollection()
        {
            return scrumTimeContext.Database.GetCollection<T>(collectionName).AsQueryable<T>();            
        }

        public T GetById(ObjectId Id)
        {
            return GetCollection().Where(m => m.Id == Id).FirstOrDefault();
        }
    }
}
