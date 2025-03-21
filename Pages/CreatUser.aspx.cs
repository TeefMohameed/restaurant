using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace restaurant.Pages

{
    public partial class CreateUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // منطق التحميل إذا لزم الأمر
        }

        protected void BtnCreateUser_Click(object sender, EventArgs e)
        {
            string newUserName = txtNewUserName.Text;
            string newPassword = txtNewPassword.Text;
            string email = txtNewEmail.Text;
            string role = "User"; // الدور الافتراضي
            DateTime createdAt = DateTime.Now;

            if (!string.IsNullOrEmpty(newUserName) && !string.IsNullOrEmpty(newPassword) && !string.IsNullOrEmpty(email))
            {
                // استبدل "YourConnectionString" بسلسلة الاتصال الخاصة بقاعدة البيانات
                string connectionString = "YourConnectionString";

                string insertQuery = @"INSERT INTO users (userName, password, email, role, createdAt)
                                       VALUES (@userName, @password, @Email, @Role, @CreatedAt)";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        connection.Open();
                        using (SqlCommand command = new SqlCommand(insertQuery, connection))
                        {
                            // إضافة المعلمات
                            command.Parameters.AddWithValue("@userName", newUserName);
                            command.Parameters.AddWithValue("@password", newPassword);
                            command.Parameters.AddWithValue("@Email", email);
                            command.Parameters.AddWithValue("@Role", role);
                            command.Parameters.AddWithValue("@CreatedAt", createdAt);

                            // تنفيذ الاستعلام
                            int rowsAffected = command.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                lblOutput.Text = "تم إنشاء الحساب بنجاح!";
                                lblOutput.ForeColor = System.Drawing.Color.Green;
                            }
                            else
                            {
                                lblOutput.Text = "فشل إنشاء الحساب، حاول مرة أخرى.";
                                lblOutput.ForeColor = System.Drawing.Color.Red;
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        lblOutput.Text = "خطأ: " + ex.Message;
                        lblOutput.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
            else
            {
                lblOutput.Text = "يرجى ملء جميع الحقول.";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}