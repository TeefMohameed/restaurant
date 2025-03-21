using restaurant.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace restaurant.myResturant
{
    public partial class order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                populategvorders();
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            // Required for exporting GridView to Excel
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();
            string mySql = @"INSERT INTO orders (userId, orderDate, totalAmount)
                             VALUES (@userId, @orderDate, @totalAmount)";
            Dictionary<string, object> myPara = new Dictionary<string, object>
            {
                { "@userId", txtUserId.Text },
                { "@orderDate", txtOrderDate.Text },
                { "@totalAmount", txtTotalAmount.Text },
            };
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            lblOutput.Text = rtn >= 1 ? "Insert successful" : "Insert failed";
            populategvorders();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();
            string mySql = @"UPDATE orders 
                             SET userId = @userId, 
                                 totalAmount = @totalAmount, 
                                 orderDate = @orderDate
                             WHERE orderId = @orderId";
            Dictionary<string, object> myPara = new Dictionary<string, object>
            {
                { "@orderId", txtOrderId.Text },
                { "@userId", txtUserId.Text },
                { "@totalAmount", txtTotalAmount.Text },
                { "@orderDate", txtOrderDate.Text }
            };
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            lblOutput.Text = rtn >= 1 ? "Update successful" : "Update failed";
            populategvorders();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();
            string mySql = "DELETE FROM orders WHERE orderId = @orderId";
            Dictionary<string, object> myPara = new Dictionary<string, object>
            {
                { "@orderId", txtOrderId.Text }
            };
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            lblOutput.Text = rtn >= 1 ? "Delete successful" : "Delete failed";
            populategvorders();
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            populategvorders();
        }

        protected void populategvorders()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"SELECT orderId, userId, totalAmount, orderDate
                             FROM orders";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            gvOrder.DataSource = dr;
            gvOrder.DataBind();
        }

        protected void populateForm_Click(object sender, EventArgs e)
        {
            LinkButton lnkButton = (LinkButton)sender;
            int orderId = int.Parse(lnkButton.CommandArgument);

            CRUD myCrud = new CRUD();
            string mySql = "SELECT * FROM orders WHERE orderId = @orderId";
            Dictionary<string, object> myPara = new Dictionary<string, object> { { "@orderId", orderId } };
            SqlDataReader dr = myCrud.getDrPassSql(mySql, myPara);

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    txtOrderId.Text = dr["orderId"].ToString();
                    txtUserId.Text = dr["userId"].ToString();
                    txtTotalAmount.Text = dr["totalAmount"].ToString();
                    txtOrderDate.Text = dr["orderDate"].ToString();
                }
            }
        }

        protected void btnExportToExcel_Click(object sender, EventArgs e)
        {
            gvOrder.AllowPaging = false;
            populategvorders();

            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=Orders.xls");
            HttpContext.Current.Response.Charset = "";
            HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                gvOrder.RenderControl(hw);
                HttpContext.Current.Response.Output.Write(sw.ToString());
                HttpContext.Current.Response.Flush();
                HttpContext.Current.Response.End();
            }
        }

        protected void gvOrder_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}