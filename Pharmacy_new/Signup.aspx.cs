using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

using MySql.Data.MySqlClient;
using System.Drawing;

namespace Pharmacy_new
{
	public partial class Signup : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			submitSignupButton.ServerClick += SubmitSignupButton_Click;
		}
		protected void SubmitSignupButton_Click(object sender, EventArgs e)
		{
			string fullName = fullname.Value;
			string email = signupEmail.Value;
			string password = new_password.Value;
			string confirmPassword = confirm_password.Value;

			if (password != confirmPassword)
			{
				// Passwords do not match, display an error message
				ScriptManager.RegisterStartupScript(this, GetType(), "PasswordMismatch", "alert('Passwords do not match.');", true);
				return;
			}

			string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

			using (MySqlConnection connection = new MySqlConnection(connectionString))
			{
				connection.Open();
				MySqlCommand emails = new MySqlCommand("select * from pharmacyStaff;", connection);
				MySqlDataReader emailsReader = emails.ExecuteReader();
				while (emailsReader.Read())
				{
					if (emailsReader["email"].ToString() == signupEmail.Value)
					{
						string script = "alert('This email is registered before');";
						ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", script, true);
						return;
					}
				}
				emailsReader.Close();
				// Insert the user data into the MySQL database
				string query = "INSERT INTO pharmacyStaff (fullName, Email, Password) VALUES (@FullName, @Email, @Password)";
				MySqlCommand command = new MySqlCommand(query, connection);
				 command.Parameters.AddWithValue("@FullName", fullName);
				command.Parameters.AddWithValue("@Email", email);
				 command.Parameters.AddWithValue("@Password", password);
				command.ExecuteNonQuery();
				connection.Close();
			}
			ScriptManager.RegisterStartupScript(this, GetType(), "SignupSuccessful", "alert('Signup successful!');", true);
			Response.Redirect("~/loginpharmacy1.aspx");
		}
	}
}