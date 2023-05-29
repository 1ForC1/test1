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
using System.Windows.Shapes;
using Trade.DataSetTableAdapters;

namespace Trade
{
    public partial class GostWindow : Window
    {
        public class Product
        {
            public string ProductName { get; set; }
            public string ProductPhoto { get; set; }
            public string ProductDescription { get; set; }
            public double ProductCost { get; set; }
            public string ProductCategory { get; set; }
            public string ProductArticleNumber { get; set; }
        }

        DataSet ds = new DataSet();
        ProductTableAdapter productTA = new ProductTableAdapter();
        List<Product> order = new List<Product>();
        List<Product> items = new List<Product>();
        public GostWindow()
        {
            InitializeComponent();
            productTA.Fill(ds.Product);

            for (int i = 0; i < ds.Product.Rows.Count; i++)
            {
                items.Add(new Product
                {
                    ProductName = ds.Product.Rows[i][1].ToString(),
                    ProductPhoto = "/Images/"+ds.Product.Rows[i][11].ToString(),
                    ProductDescription = ds.Product.Rows[i][10].ToString(),
                    ProductCost = Convert.ToDouble(ds.Product.Rows[i][3]),
                    ProductCategory = ds.Product.Rows[i][7].ToString(),
                    ProductArticleNumber = ds.Product.Rows[i][0].ToString()
                });
            }
            ListView.ItemsSource = items;
        }

        private void AddOrderBtn_Click(object sender, RoutedEventArgs e)
        {
            if (ListView.SelectedItem != null)
            {
                order.Add(items[ListView.Items.IndexOf(ListView.SelectedItem)]);
                CheckOrderBtn.Visibility = Visibility.Visible;
            }
        }

        private void CheckOrderBtn_Click(object sender, RoutedEventArgs e)
        {
            ShowOrderWindow window = new ShowOrderWindow(order);
            window.ShowDialog();
        }
    }
}
