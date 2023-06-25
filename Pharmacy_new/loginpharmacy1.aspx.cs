using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;
using System.Windows;
using System.Drawing;
using System.Security.Cryptography;
using System.Web.Helpers;

namespace Pharmacy_new
{
	public partial class loginpharmacy1 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			
			loginButton.ServerClick += LoginButton_Click;
			//submitSignupButton.ServerClick += SubmitSignupButton_Click;

		}
		private bool AuthenticateUser(string email, string password)
		{
			string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

			using (MySqlConnection connection = new MySqlConnection(connectionString))
			{
				connection.Open();

				string query = "SELECT COUNT(*) FROM pharmacyStaff WHERE email = @Email AND password = @Password";
				MySqlCommand command = new MySqlCommand(query, connection);
				command.Parameters.AddWithValue("@Email", email);
				command.Parameters.AddWithValue("@Password", password);

				int count = Convert.ToInt32(command.ExecuteScalar());

				return count > 0;
			}
		}

		protected void LoginButton_Click(object sender, EventArgs e)
		{
			string email = txtemail.Value;
			string password = txtpassword.Value;

			if (AuthenticateUser(email, password))
			{
				// Credentials are correct, update the state column to 1 in the database
				//UpdateStateColumn(email);
				Session["IsLoggedIn"] = true;
				Response.Redirect("~/Pharmacy1.aspx"); // Redirect to the next web form
			}
			else
			{
				// Invalid credentials, display an error message
				ScriptManager.RegisterStartupScript(this, GetType(), "InvalidCredentials", "alert('Invalid credentials.');", true);
			}
		}
		protected void SubmitSignupButton_Click(object sender, EventArgs e)
		{
			 //string fullName = fullname.Value;
             //string email = e
             //string password = new;
             //string confirmPassword = confirm_password.Value;
		 //if (password != confirmPassword)
    {
        // Passwords do not match, display an error message
        //ScriptManager.RegisterStartupScript(this, GetType(), "PasswordMismatch", "alert('Passwords do not match.');", true);
        //return;
    }

			string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

			using (MySqlConnection connection = new MySqlConnection(connectionString))
			{
				connection.Open();
				// Insert the user data into the MySQL database
               string query = "INSERT INTO patient (patiemt_fname, Email, Password) VALUES (@FullName, @Email, @Password)";
               MySqlCommand command = new MySqlCommand(query, connection);
              // command.Parameters.AddWithValue("@FullName", fullName);
               //command.Parameters.AddWithValue("@Email", email);
              // command.Parameters.AddWithValue("@Password", password);
               command.ExecuteNonQuery();
		connection.Close();
			}
			ScriptManager.RegisterStartupScript(this, GetType(), "SignupSuccessful", "alert('Signup successful!');", true);
		}
		/*private void UpdateStateColumn(string email)
		{
			string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

			using (MySqlConnection connection = new MySqlConnection(connectionString))
			{
				connection.Open();

				string query = "UPDATE Users SET State = 1 WHERE Email = @Email";
				MySqlCommand command = new MySqlCommand(query, connection);
				command.Parameters.AddWithValue("@Email", email);
				command.ExecuteNonQuery();
			}
		}*/



	}
}