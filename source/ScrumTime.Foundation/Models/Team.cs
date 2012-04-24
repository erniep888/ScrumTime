using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScrumTime.Foundation.Models
{
    public class Team
    {
        public int TeamId { get; set; }

        public int ProductId { get; set; }

        public Product ParentProduct { get; set; }
    }
}
