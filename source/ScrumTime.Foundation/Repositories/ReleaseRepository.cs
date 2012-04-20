using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PetaPoco;

namespace ScrumTime.Foundation.Repositories
{
    public class ReleaseRepository : BaseRepository
    {
        public static readonly string ReleaseTableName = "Releases";        

        private readonly string basicSelectSql = @"SELECT * FROM " + ReleaseTableName;

        public ReleaseRepository(Database database)
            : base(database)
        {
        }
    }
}