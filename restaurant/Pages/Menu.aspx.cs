using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace restaurant.Pages
{
    public partial class Menu : System.Web.UI.Page
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["Helah7685aConStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid("All");
            }
        }

        protected void FilterMenu(object sender, EventArgs e)
        {
            string selectedCategory = ddlCategories.SelectedValue;
            BindGrid(selectedCategory);
        }

        private void BindGrid(string category)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM MenuItems";
                if (category != "All")
                {
                    query += " WHERE Category = @Category";
                }

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    if (category != "All")
                    {
                        command.Parameters.Add(new SqlParameter("@Category", category));
                    }

                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();

                        if (dt.Rows.Count == 0)
                        {
                            DisplayErrorMessage("لا توجد عناصر في هذه الفئة.");
                        }
                    }
                }
            }
        }

        //protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    if (e.CommandName == "Order")
        //    {
        //        int itemId = Convert.ToInt32(e.CommandArgument);
        //        // منطق معالجة الطلب هنا
        //    }
        //}

        [WebMethod]
        public static object RateItem(int id, int rating)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Helah7685aConStr"].ConnectionString;

            if (id <= 0 || rating < 1 || rating > 5)
            {
                return new { success = false, message = "قيم المدخلات غير صحيحة." };
            }

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string selectQuery = "SELECT Rating, RatingCount FROM MenuItems WHERE Id = @Id";
                    SqlCommand selectCommand = new SqlCommand(selectQuery, connection);
                    selectCommand.Parameters.Add(new SqlParameter("@Id", id));
                    SqlDataReader reader = selectCommand.ExecuteReader();

                    if (reader.Read())
                    {
                        decimal currentRating = reader.GetDecimal(0);
                        int ratingCount = reader.GetInt32(1);
                        reader.Close();

                        decimal newRating = (currentRating * ratingCount + rating) / (ratingCount + 1);
                        string updateQuery = "UPDATE MenuItems SET Rating = @Rating, RatingCount = @RatingCount WHERE Id = @Id";
                        SqlCommand updateCommand = new SqlCommand(updateQuery, connection);
                        updateCommand.Parameters.Add(new SqlParameter("@Rating", newRating));
                        updateCommand.Parameters.Add(new SqlParameter("@RatingCount", ratingCount + 1));
                        updateCommand.Parameters.Add(new SqlParameter("@Id", id));
                        updateCommand.ExecuteNonQuery();
                    }

                    return new { success = true, message = "تم تحديث التقييم بنجاح." };
                }
            }
            catch (Exception ex)
            {
                return new { success = false, message = "حدث خطأ: " + ex.Message };
            }
        }

        private void DisplayErrorMessage(string message)
        {
            Response.Write("<script>alert('" + message + "');</script>");
        }
    }
}