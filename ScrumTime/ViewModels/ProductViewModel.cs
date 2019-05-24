using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ScrumTime.Models;

namespace ScrumTime.ViewModels
{
    public class ProductViewModel
    {
        public Product ProductModel { get; set; }
        public bool IsCurrent { get; set; }
    }
}