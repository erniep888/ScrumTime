using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Data.Services.Client;
using ScrumTime.Service;
using ScrumTime.ClientAPI.Define;


namespace ScrumTime
{
    /// <summary>
    /// Interaction logic for StoriesPage.xaml
    /// </summary>
    public partial class StoriesPage : Page
    {
        public StoriesPage()
        {
            InitializeComponent();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Uri serviceUri = new Uri("http://localhost:1980/ScrumTime.svc/");
            ScrumTimeEntities entities = new ScrumTimeEntities(serviceUri);

            var ernieParticipant = (from p in entities.Participants
                               where p.Name == "Ernie"
                               select p).Single();

            ProjectManager projectManager = new ProjectManager(serviceUri);
            Project project = projectManager.FindProject(ernieParticipant, "Project1");

            StoryPageGrid.DataContext = project;
            
        }
    }
}
