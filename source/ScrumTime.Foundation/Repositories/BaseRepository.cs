using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PetaPoco;

namespace ScrumTime.Foundation.Repositories
{
    public class BaseRepository
    {
        protected Database database;

        public BaseRepository(Database database)
        {
            this.database = database;
        }
    }
}