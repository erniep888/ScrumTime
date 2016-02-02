using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ScrumTime.Foundation.Models;

namespace ScrumTime.Foundation.DataAccessLayer
{
    public class ScrumTimeInitializer
    {
        public void InitialCreation()
        {
            var context = new ScrumTimeContext();
            context.DeleteAllCollections();

            // Create the default drop-down lists
        }


        
    }
}
