using System;
using System.Collections.Generic;

namespace ScrumTime.Domain.Models
{
    public class Product
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }

        public ICollection<Release> Releases {get;set;}
    }
}