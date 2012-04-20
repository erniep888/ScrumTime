using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PetaPoco;
using ScrumTime.Foundation.Models;
using ScrumTime.Foundation.Repositories.RowMappers;

namespace ScrumTime.Foundation.Repositories
{
    public class ProductRepository : BaseRepository
    {
        public static readonly string ProductTableName = "Products";        

        private readonly Sql basicSelectSql = Sql.Builder
            .Select("*").From(ProductTableName)
            .Append(String.Format("Left Outer Join {0} on {1}.ProductId = {0}.ProductId",
                ReleaseRepository.ReleaseTableName, ProductTableName));

        public ProductRepository(Database database)
            : base(database)
        {            
        }

        public Product GetById(int productId)
        {
            var sql = basicSelectSql.Append(String.Format("where {0}.ProductId = @0", ProductTableName), productId);
            return database.Fetch<Product, Release, Product>(new ProductRowMapper().Map, sql).SingleOrDefault();            
        }

        public Product GetLikeName(string name)
        {
            var sqlString = String.Format(@"select * from {0} as p left outer join {1} as r on p.ProductId = r.ProductId  where (p.Name LIKE 'Acme%')",
                ProductTableName, ReleaseRepository.ReleaseTableName);
            var sql = basicSelectSql.Append(String.Format("where {0}.Name LIKE '%@0%'", ProductTableName), name) ;
            return database.Fetch<Product, Release, Product>(
                new ProductRowMapper().Map, sqlString).SingleOrDefault();
        }

        public List<Product> GetAll()
        {
            return database.Fetch<Product, Release, Product>(
                new ProductRowMapper().Map, basicSelectSql);
        }

        public bool Delete(Product product)
        {
            using (var scope = database.GetTransaction())
            {
                database.Execute(String.Format("delete from {0} where {0}.{1} = @0", 
                    ProductTableName, product.ProductId), product.ProductId);
                database.Delete(product);

                scope.Complete();
            }
            return true;
        }

        public bool Update(Product product)
        {
            database.Update(product);
            return true;
        }

        public bool Insert(Product product)
        {
            var returnValue = database.Insert(product);
            return true;
        }
    }
}