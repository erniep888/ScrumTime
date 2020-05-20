namespace ScrumTime.Domain.Models
{
    public class Release
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public long ProductId {get; set;}
    }
}