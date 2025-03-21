using restaurant.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace restaurant.Pages
{
    public partial class order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                populdateDdlstatus();
                populategvorder();
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            // Required for exporting GridView to Excel 
        }

        private void populdateDdlstatus()
        {
            CRUD myCrud = new CRUD();
            string mySql = "SELECT statusId, status FROM status";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlStatus.DataValueField = "statusId";
            ddlStatus.DataTextField = "status";
            ddlStatus.DataSource = dr;
            ddlStatus.DataBind();
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();
            string mySql = @"INSERT INTO orders (userId, orderDate, totalAmount, statusId) 
                             VALUES (@userId, @orderDate, @totalAmount, @statusId)";
            Dictionary<string, object> myPara = new Dictionary<string, object>
            {
                { "@userId", txtUserId.Text },
                { "@orderDate", txtOrderDate.Text },
                { "@totalAmount", txtTotalAmount.Text },
                { "@statusId", ddlStatus.SelectedValue }
            };
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);

            if (rtn >= 1)
            {
                // استدعاء AddNotification لإضافة إشعار
                int lastOrderId = GetLastInsertedOrderId();
                AddNotification(lastOrderId, "تم الطلب", "قيد التنفيذ");
                lblOutput.Text = "Order inserted and notification added!";
            }
            else
            {
                lblOutput.Text = "Insert failed.";
            }
            populategvorder();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();
            string mySql = @"UPDATE orders  
                             SET userId = @userId,  
                                 totalAmount = @totalAmount,  
                                 statusId = @statusId,  
                                 orderDate = @orderDate 
                             WHERE orderId = @orderId";
            Dictionary<string, object> myPara = new Dictionary<string, object>
            {
                { "@orderId", txtOrderId.Text },
                { "@userId", txtUserId.Text },
                { "@totalAmount", txtTotalAmount.Text },
                { "@statusId", ddlStatus.SelectedValue },
                { "@orderDate", txtOrderDate.Text }
            };
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            lblOutput.Text = rtn >= 1 ? "Update successful" : "Update failed";
            populategvorder();
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
            populategvorder();
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            populategvorder();
        }

        protected void populategvorder()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"SELECT orderId, userId, totalAmount, orderDate, s.statusId, s.status  
                             FROM orders o
INNER JOIN status s ON o.statusId = s.statusId";
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
                    ddlStatus.SelectedValue = dr["statusId"].ToString();
                    txtOrderDate.Text = dr["orderDate"].ToString();
                }
            }
        }

        protected void btnExportToExcel_Click(object sender, EventArgs e)
        {
            gvOrder.AllowPaging = false;
            populategvorder();

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

        private void AddNotification(int orderId, string message, string status)
        {
            try
            {
                CRUD myCrud = new CRUD();
                string mySql = @"INSERT INTO notificationType (orderId, message, status, date)
                                 VALUES (@orderId, @message, @status, @date)";
                Dictionary<string, object> myPara = new Dictionary<string, object>
                {
                    { "@orderId", orderId },
                    { "@message", message },
                    { "@status", status },
                    { "@date", DateTime.Now }
                };
                myCrud.InsertUpdateDelete(mySql, myPara);
            }
            catch (Exception ex)
            {
                lblOutput.Text = "Error while adding notification: " + ex.Message;
            }
        }

        private int GetLastInsertedOrderId()
        {
            CRUD myCrud = new CRUD();
            string mySql = "SELECT TOP 1 orderId FROM orders ORDER BY orderId DESC";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);

            if (dr.HasRows && dr.Read())
            {
                return int.Parse(dr["orderId"].ToString());
            }
            return 0; // إذا لم يتم العثور على أي طلب
        }
    }
}