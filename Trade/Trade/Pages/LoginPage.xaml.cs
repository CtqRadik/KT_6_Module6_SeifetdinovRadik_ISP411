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
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                StringBuilder error = new StringBuilder();
                if (String.IsNullOrEmpty(LoginTextBox.Text))
                {
                    error.AppendLine("Введите логин");
                }
                if (String.IsNullOrEmpty(LoginPasswordBox.Password))
                {
                    error.AppendLine("Введите пароль");
                }
                if (error.Length > 0)
                {
                    MessageBox.Show(error.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                if (Data.TradeEntities.GetContext().User.Any(d => d.UserLogin == LoginTextBox.Text && d.UserPassword == LoginPasswordBox.Password))
                {
                    var user = Data.TradeEntities.GetContext().User.Where(d => d.UserLogin == LoginTextBox.Text && d.UserPassword == LoginPasswordBox.Password).FirstOrDefault();
                    switch (user.Role.RoleName)
                    {
                        case "Администратор":
                            Classes.Manager.MainFrame.Navigate(new Pages.AdminProductPage());
                            break;
                        case "Менеджер":
                            Classes.Manager.MainFrame.Navigate(new Pages.ProductPage());
                            break;
                        case "Клиент":
                            Classes.Manager.MainFrame.Navigate(new Pages.ProductPage());
                            break;
                    }
                    MessageBox.Show("Успех", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);

                }
                else
                {
                    MessageBox.Show("Неверный логин или пароль", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void GuestButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.ProductPage());
        }
    }
}
