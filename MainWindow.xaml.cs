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

namespace ScrumTime.Client
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void FileOpenProjectCommandHandler(object sender, ExecutedRoutedEventArgs e)
        {
            MessageBox.Show("Open Project");
            Microsoft.Win32.OpenFileDialog openFileDialog = new Microsoft.Win32.OpenFileDialog();
            openFileDialog.InitialDirectory = @"c:\";
            openFileDialog.DefaultExt = ".sct";
            openFileDialog.Filter = "ScrumTime Projects (.sct) | *.sct";
            bool? results = openFileDialog.ShowDialog();
            if (results != null && results == true)
            {
                string path = openFileDialog.FileName;
            }

        }

        private void FileSaveProjectCommandHandler(object sender, ExecutedRoutedEventArgs e)
        {

        }

        private void FileSaveAsProjectCommandHandler(object sender, ExecutedRoutedEventArgs e)
        {
            MessageBox.Show("Save As");
        }

        private void HelpAboutCommandHandler(object sender, ExecutedRoutedEventArgs e)
        {
            MessageBox.Show("ScrumTime v0.1");
        }

        private void FileExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            StoriesPage storiesPage = new StoriesPage();
            MainFrame.Navigate(storiesPage);
        }

    }
}
