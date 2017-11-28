using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ModelFirstHWtrains
{
    public partial class Form1 : Form
    {
        Model1Container db;
        public Form1()
        {
            InitializeComponent();
            db = new Model1Container();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            loadData();
        }

        void loadData()
        {
            var trainlist =  db.TrainSet.Select( t => new { TNumber = t.TNumber }).ToList();
            dataGridView1.DataSource = trainlist;

            var sitlist = db.SitSet.Select(s => new { SitNum = s.SitNum, trainNumber = s.Train.TNumber }).ToList();
            dataGridView2.DataSource = sitlist;

            var Tickets = db.TicketSet.ToList();
            dataGridView3.DataSource = Tickets;
        }
    }
}
