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

namespace WpfApp1
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            LoadPartners();
        }
        private void LoadPartners()
        {
            try
            {
                using (var db = new ekzEntities())
                {
                    // Загружаем типы партнеров заранее
                    var partnerTypes = db.Тип_партнера_.ToDictionary(t => t.Код, t => t.Тип);

                    // Получаем данные партнеров с вычислением количества
                    var partners = db.Партнер_
                        .AsEnumerable() // Переключаем на клиентскую обработку
                        .Select(p => new
                        {
                            p.Код,
                            p.Наименование_партнера,
                            p.Директор,
                            p.Телефон_партнера,
                            p.Рейтинг,
                            Тип_партнера = partnerTypes.TryGetValue((int)p.Тип_партнера, out var type) ? type : "Не указан",
                            TotalQuantity = db.Реализация_продукции_
                                            .Where(pp => pp.Код_партнера == p.Код)
                                            .Sum(pp => (int?)pp.Количество_продукции) ?? 0
                        })
                        .Select(p => new
                        {
                            p.Код,
                            p.Наименование_партнера,
                            p.Директор,
                            p.Телефон_партнера,
                            p.Рейтинг,
                            p.Тип_партнера,
                            Discount = CalculateDiscount(p.TotalQuantity)
                        })
                        .ToList();

                    PartnersList.ItemsSource = partners;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Произошла ошибка: " + ex.Message);
            }
        }

        private double CalculateDiscount(int totalQuantity)
        {
            if (totalQuantity > 300000)
                return 15;
            if (totalQuantity > 50000)
                return 10;
            if (totalQuantity >= 10000)
                return 5;
            return 0;
        }
    }
}

}
