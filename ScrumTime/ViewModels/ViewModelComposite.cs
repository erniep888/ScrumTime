using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ScrumTime.ViewModels
{
    public class ViewModelComposite<T>
    {
        public MenuViewModel MenuViewModel { get; set; }
        public T Payload { get; set; }
    }
}