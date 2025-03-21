using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace restaurant.Pages
{
    public partial class Menu : System.Web.UI.Page
    {
        // سلسلة الاتصال بقاعدة البيانات
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["Helah7685aConStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // تحميل البيانات لأول مرة
                BindGrid("All");
            }
        }

        // تصفية القائمة بناءً على الفئة
        protected void FilterMenu(object sender, EventArgs e)
        {
            string selectedCategory = ddlCategories.SelectedValue;
            BindGrid(selectedCategory);
        }

        // ربط البيانات بجدول GridView
        private void BindGrid(string category)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT menuId, Name, Description, Price, ImageUrl, Rating FROM MenuItems";

                if (category != "All")
                {
                    query += " WHERE Category = @Category";
                }

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    if (category != "All")
                    {
                        command.Parameters.AddWithValue("@Category", category);
                    }

                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }

        // معالجة الحدث عند الضغط على النجوم
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Rate")
            {
                try
                {
                    // استخراج القيم من CommandArgument
                    string commandArgument = e.CommandArgument.ToString();
                    string[] args = commandArgument.Split(';');

                    if (args.Length == 2 && int.TryParse(args[0], out int menuId) && int.TryParse(args[1], out int rating))
                    {
                        // تحديث التقييم في قاعدة البيانات
                        AddRatingToDatabase(menuId, rating);

                        // إعادة تحميل البيانات
                        BindGrid("All");

                        // تأكيد العملية
                        Response.Write("<script>alert('Rating submitted successfully!');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid rating or menu ID.');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error: {ex.Message}');</script>");
                }
            }
        }

        // تحديث التقييم في قاعدة البيانات
        private void AddRatingToDatabase(int menuId, int rating)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = @"
            UPDATE MenuItems 
            SET Rating = @Rating
            WHERE menuId = @menuId";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@menuId", menuId);
                    command.Parameters.AddWithValue("@Rating", rating);

                    command.ExecuteNonQuery();
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect(@"~\pages\order.aspx");
        }
    }
    
}