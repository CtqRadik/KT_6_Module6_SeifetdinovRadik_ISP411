using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Trade.Pages
{
    /// <summary>
    /// Логика взаимодействия для AdminProductPage.xaml
    /// </summary>
    public partial class AdminProductPage : Page
    {
        public AdminProductPage()
        {
            InitializeComponent();
            ProductGrid.ItemsSource = Data.TradeEntities.GetContext().Product.ToList();
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.AddPage());
        }

        private void DeletButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void chamgeButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.LoginPage());
        }
    }
}
