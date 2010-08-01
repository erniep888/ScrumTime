using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ScrumTime.Helpers
{
    public class StoryPoints
    {
        static StoryPoints _Instance;
        List<int> _Points;

        private StoryPoints()
        {
            _Points = new List<int>();
            _Points.Add(0);
            _Points.Add(1);
            _Points.Add(2);
            _Points.Add(3);
            _Points.Add(5);
            _Points.Add(8);
            _Points.Add(13);
            _Points.Add(20);
            _Points.Add(40);
            _Points.Add(100);
        }

        public static List<int> All()
        {
            if (_Instance == null)
                _Instance = new StoryPoints();
            return _Instance._Points;
        }

    }
}