using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MongoDB.Bson;

namespace ScrumTime.Foundation.Models
{
    public interface IScrumTimeModel
    {
        ObjectId Id { get; set; }
    }
}
