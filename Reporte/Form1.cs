using Microsoft.Reporting.WinForms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace Reporte
{
    public partial class Form1 : Form
    {
        Base_de_Datos bd = new Base_de_Datos();
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            //Clientes
            DataSet D = new DataSet();
            SqlConnection cnn = Base_de_Datos.DbConnection.getDBConnection();
            string sp = "sp_saldosclientes";
            SqlDataAdapter da = new SqlDataAdapter(sp, cnn);
            da.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            da.Fill(D, D.Tables[0].TableName);

            ReportDataSource Rds = new ReportDataSource("Clientes", D.Tables[0]);
            this.reportViewer1.LocalReport.DataSources.Clear();
            this.reportViewer1.LocalReport.DataSources.Add(Rds);
            this.reportViewer1.LocalReport.Refresh();
            this.reportViewer1.RefreshReport();

            //Proveedores
            DataSet ds = new DataSet();
            string sp2 = "sp_saldosproveedores";
            SqlDataAdapter daa = new SqlDataAdapter(sp2, cnn);
            daa.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            daa.Fill(ds, ds.Tables[1].TableName);

            ReportDataSource rds1 = new ReportDataSource("Proveedores", ds.Tables[1]);
            this.reportViewer1.LocalReport.DataSources.Add(rds1);
            this.reportViewer1.LocalReport.Refresh();
            this.reportViewer1.RefreshReport();
        }
    }
}
