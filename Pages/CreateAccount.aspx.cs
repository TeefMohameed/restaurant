using System;
using System.Configuration;
using System.Data.SqlClient;

namespace restaurant.Pages
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCreateUser_Click(object sender, EventArgs e)
        {
            string newUserName = txtNewUserName.Text.Trim();
            string newEmail = txtNewEmail.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();

            if (string.IsNullOrEmpty(newUserName) || string.IsNullOrEmpty(newEmail) || string.IsNullOrEmpty(newPassword))
            {
                lblOutput.ForeColor = System.Drawing.Color.Red;
                lblOutput.Text = "يرجى ملء جميع الحقول.";
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["Helah7685aConStr"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "INSERT INTO Users (UserName, Email, Password) VALUES (@UserName, @Email, @Password)";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@UserName", newUserName);
                        cmd.Parameters.AddWithValue("@Email", newEmail);
                        cmd.Parameters.AddWithValue("@Password", newPassword);
                        cmd.ExecuteNonQuery();

                        lblOutput.ForeColor = System.Drawing.Color.Green;
                        lblOutput.Text = "تم إنشاء الحساب بنجاح!";
                    }
                }
            }
            catch (Exception ex)
            {
                lblOutput.ForeColor = System.Drawing.Color.Red;
                lblOutput.Text = "حدث خطأ أثناء إنشاء الحساب: " + ex.Message;
            }
        }
    }
}