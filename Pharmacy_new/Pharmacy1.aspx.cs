using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Diagnostics;
using System.Web.UI.HtmlControls;

namespace Pharmacy_new
{
	public partial class Pharmacy1 : System.Web.UI.Page
	{
		public long NID = 0;
		protected void Page_Load(object sender, EventArgs e)
		{
			//viewDetailsBtn1.Click += ViewDetails_Click1;
			if (!IsPostBack)
			{
				// Populate the table with data from the database
				PopulateTable();
			}
			// Assign the event handlers to the buttons
		    viewDetailsBtn1.Click+= viewDetailsBtn1_Click;
			viewDetailsBtn2.Click += ViewDetailsBtn2_Click;
			viewDetailsBtn3.Click += ViewDetailsBtn3_Click;
		}


		protected void viewDetailsBtn1_Click(object sender, EventArgs e)
		{
			UpdatePrescriptionForRow(0);
		}

		protected void ViewDetailsBtn2_Click(object sender, EventArgs e)
		{
			UpdatePrescriptionForRow(1);
		}

		protected void ViewDetailsBtn3_Click(object sender, EventArgs e)
		{
			UpdatePrescriptionForRow(2);
		}

		private void UpdatePrescriptionForRow(int rowNumber)
		{
			

			string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

			using (MySqlConnection connection = new MySqlConnection(connectionString))
			{
				string updateQuery = @"
            UPDATE Prescription
            SET activepharmacy = 1
            WHERE prsID IN (
                SELECT P.prsID
                FROM (
                    SELECT prsID
                    FROM Prescription
                    WHERE purchased = 0
                    ORDER BY prsID
                    LIMIT @RowNumber, 1
                ) AS P
            )";

				connection.Open();
				MySqlCommand refresh = new MySqlCommand("update Prescription set activePharmacy = 0 where activePharmacy = 1", connection);
				refresh.ExecuteNonQuery();
				MySqlCommand command = new MySqlCommand(updateQuery, connection);
				command.Parameters.AddWithValue("@RowNumber", rowNumber);
				int rowsAffected = command.ExecuteNonQuery();
				connection.Close();

				if (rowsAffected > 0)
				{
					// The update was successful
					// Redirect the user to Pharmacy2 web form or perform other actions
					Response.Redirect("Pharmacy2.aspx");
				}
				else
				{
					// The update failed
					// Display an error alert
					ClientScript.RegisterStartupScript(this.GetType(), "UpdateFailed", "alert('Update failed. Please try again.');", true);
				}
			}

			// Refresh the table after the update
			PopulateTable();
		}




		protected void PopulateTable()
		{
			string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

			// Query to retrieve the data from the database
			string query = @"
            SELECT P.prsID AS PatientOrder, PT.patient_fname AS PatientName, PT.age AS Age, GROUP_CONCAT(D.drugName SEPARATOR ', ') AS Drugs
            FROM Prescription P
            INNER JOIN patient PT ON P.NID = PT.NID
            INNER JOIN drug D ON P.prsID = D.presID
            WHERE P.purchased = 0
            GROUP BY P.prsID, PT.patient_fname, PT.age
            ORDER BY P.prsID
            LIMIT 3";

			using (MySqlConnection connection = new MySqlConnection(connectionString))
			{
				MySqlCommand command = new MySqlCommand(query, connection);
				connection.Open();
				MySqlDataReader reader = command.ExecuteReader();

				// Loop through the retrieved rows and populate the table dynamically
				int rowCounter = 0;
				while (reader.Read())
				{
					// Create a new table row dynamically
					HtmlTableRow row = new HtmlTableRow();

					// Create table cells and populate them with data
					HtmlTableCell orderCell = new HtmlTableCell();
					orderCell.InnerText = reader["PatientOrder"].ToString();
					row.Cells.Add(orderCell);


					HtmlTableCell nameCell = new HtmlTableCell();
					nameCell.InnerText = reader["PatientName"].ToString();
					row.Cells.Add(nameCell);

					HtmlTableCell ageCell = new HtmlTableCell();
					ageCell.InnerText = reader["Age"].ToString();
					row.Cells.Add(ageCell);

					HtmlTableCell drugCell = new HtmlTableCell();
					drugCell.InnerText = reader["Drugs"].ToString();
					row.Cells.Add(drugCell);
					// Make the patient order clickable
					//orderCell.InnerHtml = $"<a href='pharmacy2.aspx?patientOrder={reader["PatientOrder"]}&patientName={reader["PatientName"]}&age={reader["Age"]}&drug={reader["Drugs"]}'>{reader["PatientOrder"]}</a>";

					// Add the row to the table
					dataTbl.Rows.Add(row);

					rowCounter++;
				}

				// Close the data reader and connection
				reader.Close();
				connection.Close();
			}
		}


	}
}