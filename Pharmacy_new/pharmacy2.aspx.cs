using System;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Protobuf.WellKnownTypes;

namespace Pharmacy_new
{
	public partial class pharmacy2 : System.Web.UI.Page
	{
		public int prsID;
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

				using (MySqlConnection connection = new MySqlConnection(connectionString))
				{
					connection.Open();

					// Retrieve prescription details for active pharmacy
					string query = "SELECT * FROM Prescription WHERE activepharmacy = 1";
					MySqlCommand command = new MySqlCommand(query, connection);
					MySqlDataReader reader = command.ExecuteReader();

					if (reader.Read())
					{
						prsID = int.Parse(reader["prsID"].ToString());
						// Retrieve prescription details
						int presId = Convert.ToInt32(reader["prsId"]);
						string presNID = reader["NID"].ToString();


						// Update sidebar labels
						patientID.InnerHtml = presNID;
						reader.Close();

						// Retrieve patient details using NID
						string patientQuery = "SELECT patient_fname, age FROM patient WHERE NID = @NID";
						MySqlCommand patientCommand = new MySqlCommand(patientQuery, connection);
						patientCommand.Parameters.AddWithValue("@NID", presNID);
						MySqlDataReader patientReader = patientCommand.ExecuteReader();

						if (patientReader.Read())
						{
							string patientName = patientReader["patient_fname"].ToString();
							string age = patientReader["age"].ToString();

							patientname.InnerText= patientName;
							age1.InnerText = age;
						}

						patientReader.Close();

						// Retrieve drugs for the prescription
						string drugsQuery = "SELECT drugName FROM drug WHERE presid = @prsid";
						MySqlCommand drugsCommand = new MySqlCommand(drugsQuery, connection);
						drugsCommand.Parameters.AddWithValue("@prsid", presId);
						MySqlDataReader drugsReader = drugsCommand.ExecuteReader();

						while (drugsReader.Read())
						{
							string drugName = drugsReader["drugName"].ToString();
							ListItem drugItem = new ListItem(drugName);
							drugsList.Items.Add(drugItem);
						}
						
						drugsReader.Close();
					}

					reader.Close();
				}
			}
			// Register the button click event handler
			Back_button.ServerClick += BackButton_Click;
			save_button.ServerClick += save_button_Click;

		}
		protected void save_button_Click(object sender, EventArgs e)
		{
			string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

			using (MySqlConnection connection = new MySqlConnection(connectionString))
			{
				connection.Open();

				// Update the activepharmacy value in the database
				string updateQuery = "UPDATE Prescription SET purchased = 1 WHERE activePharmacy = 1;";

				MySqlCommand updateCommand = new MySqlCommand(updateQuery, connection);
				//updateCommand.Parameters.AddWithValue("@prsID", prsID);
				updateCommand.ExecuteNonQuery();
			}
			SetActivePharmacy(0);
			Response.Redirect("~/Pharmacy1.aspx");

		}
		protected void BackButton_Click(object sender, EventArgs e)
		{
			// Set the active pharmacy to 0
			SetActivePharmacy(0);

			// Redirect to Pharmacy1.aspx
			Response.Redirect("~/Pharmacy1.aspx");
		}

		private void SetActivePharmacy(int value)
		{
			string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

			using (MySqlConnection connection = new MySqlConnection(connectionString))
			{
				connection.Open();

				// Update the activepharmacy value in the database
				string updateQuery = "UPDATE Prescription SET activepharmacy = @activepharmacy WHERE activepharmacy = 1";
				MySqlCommand updateCommand = new MySqlCommand(updateQuery, connection);
				updateCommand.Parameters.AddWithValue("@activepharmacy", value);
				updateCommand.ExecuteNonQuery();
			}
		}
	}
}
