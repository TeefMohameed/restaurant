using restaurant.App_Code;
using System;
using System.Data.SqlClient;

namespace restaurant.Pages
{
    public partial class notificationType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PopulateNotifications();
            }
        }

        private void PopulateNotifications()
        {
            try
            {
                // إنشاء كائن من CRUD
                CRUD myCrud = new CRUD();

                // استعلام لجلب بيانات الإشعارات من جدول notificationType
                string mySql = @"SELECT notificationTypeId, orderId, message, status, date 
                                 FROM notificationType 
                                 ORDER BY date DESC";

                // تنفيذ الاستعلام وجلب البيانات
                SqlDataReader dr = myCrud.getDrPassSql(mySql);

                // ربط البيانات بجريد فيو
                gvNotification.DataSource = dr;
                gvNotification.DataBind();
            }
            catch (Exception ex)
            {
                // عرض رسالة خطأ عند وجود مشكلة
                lblOutput.Text = "Error while populating notifications: " + ex.Message;
            }
        }
    }
}