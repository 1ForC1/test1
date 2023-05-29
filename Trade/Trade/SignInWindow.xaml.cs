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
using Trade.DataSetTableAdapters;

namespace Trade
{
    public partial class MainWindow : Window
    {
        DataSet ds = new DataSet();
        UserTableAdapter userTA = new UserTableAdapter();
        public MainWindow()
        {
            InitializeComponent();
            userTA.Fill(ds.User);
        }

        //Метод авторизации пользователя, как гостя
        private void GostBtn_Click(object sender, RoutedEventArgs e)
        {
            GostWindow window = new GostWindow();
            window.Show();
            Close();
        }

        //Метод авторизации пользователя
        private void AuthBtn_Click(object sender, RoutedEventArgs e)
        {
            if (LoginTB.Text != "" && PasswordPB.Password != "")
            {
                for(int i=0; i < ds.User.Rows.Count; i++)
                {
                    if(ds.User.Rows[i][4].ToString()==LoginTB.Text&& ds.User.Rows[i][5].ToString() == PasswordPB.Password)
                    {
                        //Администратор
                        if (ds.User.Rows[i][6].ToString() == "1")
                        {
                            MessageBox.Show(ds.User.Rows[i][6].ToString());
                        } 
                        //Менеджер
                        else if (ds.User.Rows[i][6].ToString() == "2")
                        {
                            MessageBox.Show(ds.User.Rows[i][6].ToString());
                        }
                        return;
                    }
                }
                MessageBox.Show("Неверный логин или пароль!");
            }
            else
            {
                MessageBox.Show("Не все поля заполнены!");
            }
        }
    }
}
