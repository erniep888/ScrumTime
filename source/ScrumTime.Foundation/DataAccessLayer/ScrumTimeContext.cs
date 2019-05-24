namespace ScrumTime.Foundation.DataAccessLayer
{
    using System.Configuration;
    using MongoDB.Driver;

    using ScrumTime.Foundation.Models;

    public class ScrumTimeContext 
    {

        public MongoDatabase Database { get; private set; }

        public ScrumTimeContext()
        {
            var connectionString = ConfigurationManager.AppSettings["ScrumTimeMongoDBConnection"];
            var server = MongoServer.Create(connectionString);
            Database = server.GetDatabase("ScrumTime");            
        }



        public void DeleteAllCollections()
        {
            foreach (var collectionName in Database.GetCollectionNames())
            {
                Database.DropCollection(collectionName);
            }
        }

        public MongoCollection<StoryPoint> StoryPoints()
        {
            return Database.GetCollection<StoryPoint>("StoryPoints");
        }
        
        public MongoCollection<BugSeverity> BugSeverities()
        {
            return Database.GetCollection<BugSeverity>("BugSeverities");
        }

        public MongoCollection<BugPriority> BugPriorities()
        {
            return Database.GetCollection<BugPriority>("BugPriorities");
        }

        public MongoCollection<BugStatus> BugStatuses()
        {
            return Database.GetCollection<BugStatus>("BugStatuses");
        }
    }
}
