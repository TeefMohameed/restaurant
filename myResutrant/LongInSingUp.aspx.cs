using restaurant.App_Code;
using System;
using System.Collections.Generic;

namespace restaurant.myResturant
{
    public partial class LongInSingUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // أي منطق لتحميل الصفحة (إن لزم الأمر)
        }

        // معالج الحدث عند الضغط على زر "تسجيل دخول"
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string userName = txtUserName.Text;
            string password = txtPassword.Text;

            // تتبع القيم المدخلة
            Response.Write("<script>alert('Username: " + userName + " | Password: " + password + "');</script>");

            if (userName == "teef" && password == "2003")
            {
                Response.Redirect("~/Pages/Home.aspx");
            }
            else
            {
                Response.Write("<script>alert('اسم المستخدم أو كلمة المرور غير صحيحة');</script>");
            }
        }

        // معالج الحدث عند الضغط على زر "إنشاء حساب"
        protected void btnGoToSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/CreateAccount.aspx");
        }
    }
}
