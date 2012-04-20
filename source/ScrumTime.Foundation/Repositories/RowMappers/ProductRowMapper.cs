using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ScrumTime.Foundation.Models;

namespace ScrumTime.Foundation.Repositories.RowMappers
{
    public class ProductRowMapper
    {
        public Product current;
        /// <summary>
        /// The Map is expected to be called once for each object found 
        /// as a result of the query. In the case of a one-to-many, Map 
        /// is called once for the Master and zero or more times for the
        /// Detail records.  Map has no implicit knownledge of the relationship
        /// amoung the objects.  The current object is used to represent
        /// the Master record.
        /// </summary>
        /// <param name="product"></param>
        /// <param name="release"></param>
        /// <returns></returns>
        public Product Map(Product product, Release release)
        {
            Product master = null;

            if (product == null)
                master = current;
            else if (current != null && current.ProductId == product.ProductId)
            {
                release.Product = current;
                current.Releases.Add(release);
            }
            else
            {
                master = current;
                current = product;
                if (current.Releases == null)
                    current.Releases = new List<Release>();
                release.Product = current;
                current.Releases.Add(release);
            }

            return master;
        }
    }
}