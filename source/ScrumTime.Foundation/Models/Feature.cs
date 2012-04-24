using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScrumTime.Foundation.Models
{
    public class Feature
    {
        public int FeatureId { get; set; }

        public int ProductId { get; set; }
        public Product Product { get; set; }

        public ICollection<Story> Stories { get; set; }

    }
}
