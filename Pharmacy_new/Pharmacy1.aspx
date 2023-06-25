<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pharmacy1.aspx.cs" Inherits="Pharmacy_new.Pharmacy1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>My Table</title>
	<style>
		body {
			background-image: url("images/pexels-karolina-grabowska-4084639\ \(1\).jpg");
			background-repeat: no-repeat;
			background-size: cover;
			background-color: rgba(238, 238, 238, 0.373);
			display: flex;
			justify-content: center;
			align-items: center;
			height: 100vh;
			margin-top: 0px;
		}
		.container {
		      display: flex;
            align-items: flex-start;

		}
		.buttons {
			display: flex;
            flex-direction: column;
            align-items: flex-end;
            margin-right: 20px;
		}
		table {
            background-color: rgba(255, 255, 255, 0.722);
            border-collapse: collapse;
            margin: 100px auto 0;
            width: 90%;
            height: 90%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
		th, td {
			padding: 25px;
			text-align: left;
			border: 1px solid rgb(106, 21, 21);
		}
		th {
			background-color: #40b7b7;
		}
		td:first-child {
			background-color: rgba(255, 255, 255, 0.8);
		}
		td:first-child a {
			color: rgb(0, 0, 0);
			text-decoration: none;
		}
		td:first-child a:hover {
			color: #17d6c3;
			text-decoration: underline;
		}
		.top-bar {
  display: flex;
  align-items: center;
  background-color: #d6b079;
  padding: 5px 20px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 7vh;
}

.logo {
  display: flex;
  align-items: center;
}

.logo img {
  height: 60px;
  margin-right: 10px;
}

.logo h1 {
  margin: 0;
  font-size: 1rem;
}
	</style>


</head>
<body>
	<div class="top-bar">
		<div class="logo">
			<img src="images/logo.png" alt="Logo">
			<h1>Faith is taking the first step even when you don't see the whole staircase.</h1>
		</div>
	</div>
	<form runat="server"> 
		 <div class="container">
		<div class="buttons">
        <asp:Button ID="viewDetailsBtn1" runat="server" Text="View Details" ></asp:Button>
        <asp:Button ID="viewDetailsBtn2" runat="server" Text="View Details"  style="margin-left: 20px;"></asp:Button>
        <asp:Button ID="viewDetailsBtn3" runat="server" Text="View Details"  style="margin-left: 20px;"></asp:Button>
			 <asp:Label ID="genderLabel" runat="server" Visible="false"></asp:Label>
			 </div>
        
	<table runat="server" id="dataTbl">
        <a href="Global.asax">Global.asax</a>
		<tr>
		  <th>PatientOrder</th>
		  <th>PatientName</th>
		  <th>Age</th>
		  <th>Drugs</th>
		</tr>

	  </table>
			 <</div>
</form>


	
</body>
</html>

