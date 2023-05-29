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
using static Trade.GostWindow;
using Trade.DataSetTableAdapters;

namespace Trade
{
    public partial class ShowOrderWindow : Window
    {
        List<Product> order = new List<Product>();
        DataSet ds = new DataSet();
        OrderPickupPointTableAdapter orderPickupPointTA = new OrderPickupPointTableAdapter();
        OrderTableAdapter orderTA = new OrderTableAdapter();
        OrderProductTableAdapter orderProductTA = new OrderProductTableAdapter();
        public ShowOrderWindow(List<Product> products)
        {
            InitializeComponent();
            orderPickupPointTA.Fill(ds.OrderPickupPoint);
            order = products;
            ListView.ItemsSource = order;

            decimal cost = 0;
            foreach (var item in order)
            {
                cost += Convert.ToDecimal(item.ProductCost);
            }
            CostTB.Text = "Полная стоимость: " + cost;

            PickUpCB.ItemsSource = ds.OrderPickupPoint.DefaultView;
            PickUpCB.SelectedValuePath = "OrderPickupPointID";
            PickUpCB.DisplayMemberPath = "OrderPickupPoint";
        }

        private void DeleteOrderBtn_Click(object sender, RoutedEventArgs e)
        {
            if (ListView.SelectedItem != null)
            {
                order.RemoveAt(ListView.Items.IndexOf(ListView.SelectedItem));
                ListView.Items.Refresh();
                decimal cost = 0;
                foreach (var item in order)
                {
                    cost += Convert.ToDecimal(item.ProductCost);
                }
                CostTB.Text = "Полная стоимость: " + cost;
            }
        }

        private void ConfirmOrderBtn_Click(object sender, RoutedEventArgs e)
        {
            if (PickUpCB.SelectedItem != null && order.Count > 0)
            {
                try
                {
                    Random random = new Random();
                    int id = Convert.ToInt32(orderTA.InsertQuery(DateTime.Now.ToString(), DateTime.Now.AddDays(5).ToString(), (int)PickUpCB.SelectedValue, random.Next(100, 999), "Новый"));
                    foreach (var item in order)
                    {
                        orderProductTA.Insert(id, item.ProductArticleNumber, 1);
                    }
                    order.Clear();
                    Close();
                }
                catch { }
            }
        }
    }
}
