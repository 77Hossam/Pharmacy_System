<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pharmacy2.aspx.cs" Inherits="Pharmacy_new.pharmacy2" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>Other Page</title>
	<style>
		body {
			background-image: url("images/pexels-karolina-grabowska-4084639\ \(1\).jpg");
			background-repeat: no-repeat;
			background-size: cover;
			background-color: rgba(86, 196, 200, 0.5);
			display: flex;
			flex-direction: row;
			height: 100vh;
		}

		#sidebar {
			background-color: rgba(255, 255, 255, 0.722);
			width: 20%;
			min-width: 250px;
			height: 100%;
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
			padding: 20px;
			display: flex;
			flex-direction: column;
			align-items: center;
		}

		#sidebar img {
			width: 40%;
			border-radius: 20%;
		}

		#sidebar h2 {
			margin-top: 10px;
			font-size: 24px;
			color: #333;
		}

		#sidebar p {
			margin-top: 5px;
			font-size: 16px;
			color: #333;
		}

		#sidebar #comment-button {
			margin-top: 20px;
			background-color: #46c7ba;
			color: #fff;
			padding: 10px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
		}

		#comment-box {
			display: none;
			margin-top: 20px;
			width: 80%;
		}

		#comment-box textarea {
			width: 100%;
			height: 100px;
			padding: 10px;
			resize: none;
			border-radius: 5px;
			border: 1px solid #ccc;
		}

		#comment-box button {
			margin-top: 10px;
			background-color: #46c7ba;
			color: #fff;
			padding: 10px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
		}
		
		#drug-form {
			display: flex;
			flex-direction: column;
			align-items: center;
			background-color: rgba(255, 255, 255, 0.722);
			width: 100%;
			padding: 20px;
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
			border-radius: 10px;
			margin: 170px ; 
            margin-top: 10%;
            margin-right: 150px;
		}
		
		#drug-form input {
			margin-top: 10px;
			padding: 10px;
			border-radius: 5px;
			border: 1px solid #ccc;
		}
		
		#drug-form button {
			margin-top: 10px;
			background-color: #46c7ba;
			color: #fff;
			padding: 10px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
		}

		#prescription-box {
			display: flex;
			flex-direction: column;
			align-items: center;
			background-color: rgba(255, 255, 255, 0.722);
			width: 100%;
			padding: 20px;
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
			border-radius: 10px;
			margin: 170px ; 
            margin-top: 0%;
            margin-right: 150px;

		}

		#prescription-box h3 {
			margin-top: 0;
			font-size: 24px;
			color: #333;
		}

		#prescription-box p {
			margin-top: 10px;
			font-size: 16px;
			color: #333;
		}
        
        #prescription-box table{
            border-collapse: collapse;
            width: 80%;
            margin-top: 20px;
        }
        
        #prescription-box th{
            background-color: #46c7ba;
            color: #fff;
            font-size: 20px;
            padding: 10px;
        }
        
        #prescription-box td{
            border: 1px solid #ccc;
            padding: 10px;
            font-size: 16px;
            text-align: center;
        }
        
        #prescription-box td:first-child{
            font-weight: bold;
        }
        
        #prescription-box td:last-child{
            font-style: italic;
        }

        #prescription-box #save_button {
			margin-top: 20px;
			background-color: #46c7ba;
			color: #fff;
			padding: 10px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
		}

		#prescription-box #Back_button {
			margin-top: 20px;
			background-color: #46c7ba;
			color: #fff;
			padding: 10px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
		}
	</style>
</head>
<body>
	<div id="sidebar" runat="server" >
		<img src="images/user (1).png" alt="Profile Picture">
		<h2>ID: <span id="patientID" runat="server"></span></h2>
		<p>Name: <span id="patientname" runat="server" ></span></p>
		<p>Age: <span id="age1" runat="server" ></span></p>
		<p>Drugs:</p>
								<form runat="server" id="Mango">
		<asp:ListBox ID="drugsList" runat="server"></asp:ListBox>
											</form>

		<button id="comment-button">Add Comment</button>
		<div id="comment-box">
			<textarea placeholder="Type your comment here..."></textarea>
			<button>Submit</button>
		</div>

	</div>
	<div id="content">
		<div id="drug-form">
			<h3>Add Drug to the bill</h3>
			<input type="text" placeholder="Drug Name">
			<input type="text" placeholder="Dosage">
			<button type="submit">Add</button>
		</div>
		<div id="prescription-box">
			<h3>Order Bill</h3>
			<table>
				<tr>
				  <th>Drug Name</th>
				  <th>Dosage</th>
				  <th>Instructions</th>
				</tr>
				<tr>
				  <td><asp:Label runat="server" Text="Panadol" /></td>
				  <td><asp:Label runat="server" Text="500mg" /></td>
				  <td><asp:Label runat="server" Text="Take every 4 hours as needed for pain" /></td>
				</tr>
				<tr>
				  <td><asp:Label runat="server" Text="Crestor" /></td>
				  <td><asp:Label runat="server" Text="10mg" /></td>
				  <td><asp:Label runat="server" Text="Take 1 tablet before bedtime" /></td>
				</tr>
				<tr>
				  <td><asp:Label runat="server" Text="Capoten" /></td>
				  <td><asp:Label runat="server" Text="25mg" /></td>
				  <td><asp:Label runat="server" Text="Take 1 tablet after breakfast" /></td>
				</tr>
				<tr>
					<td><asp:Label runat="server" Text="Capoten" /></td>
					<td><asp:Label runat="server" Text="25mg" /></td>
					<td><asp:Label runat="server" Text="Take 1 tablet after breakfast" /></td>
				  </tr>
			  </table>
		</table>
		<div id="button-container">
			<button id="save_button" runat="server" >Save</button>
			<button id="Back_button"   runat="server" >Back </button>
		</div>
	</div>
		</div>
	</div>
	<script>
		var commentButton = document.getElementById("comment-button");
		var commentBox = document.getElementById("comment-box");
		var backButton = document.getElementById("Back-button");

backButton.addEventListener("click", function() {
  window.location.href = "Pharmacy1.html";
});

		commentButton.addEventListener("click", function() {
			commentBox.style.display = "block";
		});
    </script>
</body>
</html>