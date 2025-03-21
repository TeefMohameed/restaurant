using restaurant.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace restaurant.Pages
{
    public partial class notificationType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadNotifications("all");
            }
        }

        protected void rblNotificationType_SelectedIndexChanged(object sender, EventArgs e)
        {
            // جلب النوع المختار من RadioButtonList
            string selectedType = rblNotificationType.SelectedValue;
            LoadNotifications(selectedType);
        }

        private void LoadNotifications(string type)
        {
            try
            {
                // إنشاء كائن CRUD
                CRUD myCrud = new CRUD();

                // بناء استعلام SQL
                string mySql = @"SELECT notificationTypeId, orderId, message, status, date 
                         FROM notificationType ";
                Dictionary<string, object> myParams = null;

                if (type != "all")
                {
                    mySql += "WHERE status = @status ";
                    myParams = new Dictionary<string, object>
            {
                { "@status", type }
            };
                }

                mySql += "ORDER BY date DESC";

                // قراءة البيانات لـ GridView
                using (SqlDataReader dr = myCrud.getDrPassSql(mySql, myParams ?? new Dictionary<string, object>()))
                {
                    gvNotification.DataSource = dr;
                    gvNotification.DataBind();
                }

                // قراءة البيانات لـ Repeater
                List<dynamic> notifications = new List<dynamic>();
                using (SqlDataReader dr = myCrud.getDrPassSql(mySql, myParams ?? new Dictionary<string, object>()))
                {
                    while (dr.Read())
                    {
                        notifications.Add(new
                        {
                            message = dr["message"].ToString(),
                            status = dr["status"].ToString(),
                            date = Convert.ToDateTime(dr["date"])
                        });
                    }
                }

                // ربط البيانات بـ Repeater
                if (notifications.Count > 0)
                {
                    rptNotifications.DataSource = notifications;
                    rptNotifications.DataBind();
                }
            }
            catch
            {
                // تجاهل الأخطاء بدون عرض أي رسالة
            }
        }
    }
}