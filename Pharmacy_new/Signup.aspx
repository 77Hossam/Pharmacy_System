<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Pharmacy_new.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Signup</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 110vh;
            margin: 0;
            padding: 5vh 0 0;
            background-color: #f6f6f69c;
            font-family: Arial, sans-serif;
        }

        .container {
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: rgba(224, 215, 215, 0.651);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            overflow: hidden;
            width: 80%;
            max-width: 400px;
            padding: 2rem;
            margin-bottom: 1rem;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            padding: 1rem;
        }

        h1 {
            margin-bottom: 2rem;
            font-size: 2.3rem;
            font-weight: bold;
            text-transform: lowercase;
            text-align: center;
            color: #009494;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .header-image {
            width: 155px;
            height: 100px;
            border-radius: 50%;
            background-image: url(images/logo.png);
            background-size: cover;
            background-position: center;
            margin-bottom: 0rem;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            max-width: 400px;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 90%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 10px;
            margin-bottom: 1.2rem;
            font-size: 1rem;
            font-weight: 400;
            background-color: #fff;
            color: #555;
        }

            input[type="text"]:focus,
            input[type="email"]:focus,
            input[type="password"]:focus {
                outline: none;
                border-bottom-color: #39abaf;
            }

        .form-group {
            margin-bottom: 0rem;
            width: 100%;
        }

        .form-check {
            margin-bottom: 2rem;
            width: 100%;
        }

        .form-check-label {
            font-size: 0.9rem;
            font-weight: normal;
            color: #555;
        }

        .btn-primary {
            background-color: #2e9fa1;
            border-color: #c2e3e2;
            color: #fff;
            width: 60%;
            margin-bottom: 1rem;
            font-size: 1rem;
            font-weight: bold;
            border-radius: 10px;
            text-transform: uppercase;
            padding: 0.7rem 1rem;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
        }

            .btn-primary:hover {
                background-color: #71e6e8;
                border-color: #96d8d2;
            }

        .text-muted {
            color: #888;
            font-size: 0.9rem;
            margin-top: 2rem;
        }

        .data-container {
            display: flex;
            flex-direction: column;
            align-items: auto;
            justify-content: auto;
            width: 100%;
            height: 8%;
            overflow: hidden;
            padding: 2rem;
            border-radius: 10px;
            background-color: rgba(224, 215, 215, 0.705);
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .data1 {
            font-size: 1.2rem;
            font-weight: bold;
            color: #070707;
            text-align: left;
            margin-top: 0rem;
        }

        .subdata1 {
            font-size: 0.9rem;
            font-weight: normal;
            color: #555;
            text-align: left;
            margin-top: 0rem;
        }

        .subdata2 {
            font-size: 0.9rem;
            font-weight: normal;
            color: #555;
            text-align: left;
            margin-top: 0rem;
        }

        .image-container {
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background-image: url(images/pexels-karolina-grabowska-4084639\ \(1\).jpg);
            background-size: cover;
            background-position: center;
            filter: blur(3px);
            z-index: -1;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h1><span class="header-image"></span>Start Your Journey With Us!</h1>
            <form id="signup_form"  runat="server">
                <div class="form-group">
                    <label for="fullname">Full Name:</label>
                    <input type="text" id="fullname" name="fullname" required="required" runat="server"/>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="signupEmail" name="signupEmail" required="required" runat="server"/>
                </div>
                <div class="form-group">
                    <label for="new-password">Password:</label>
                    <input type="password" id="new_password" name="new_password" required="required" runat="server"/>
                </div>
                <div class="form-group">
                    <label for="confirm-password">Confirm Password:</label>
                    <input type="password" id="confirm_password" name="confirm_password" required="required" runat="server"/>
                </div>
                <button type="submit" class="btn-primary" id="submitSignupButton" runat="server"> Sign Up</button>
            </form>
           
            <p class="text-muted"> Already have an account? <a href="loginpharmacy1.aspx">Login</a></p>
        </div>
        <div class="image-container"></div>
    </div>
    <div class="data-container">
    </div>
    
<!-- <script>
    const loginForm = document.getElementById("login");
    const signupForm = document.getElementById("signupForm");
    const switchFormLink = document.getElementById("switch-form-link");

    loginForm.addEventListener("submit", function (event) {
        event.preventDefault();
        const email = document.getElementById("txtemail").value;
        const password = document.getElementById("txtpassword").value;

        if (email === "user" && password === "pass") {
            window.location.href = "Pharmacy1.aspx";
        } else {
            alert("Invalid username or password. Please try again.");
        }
    });

    signupForm.addEventListener("submit", function (event) {
        event.preventDefault();
        const username = document.getElementById("fullname").value;
        const email = document.getElementById("email").value;
        const password = document.getElementById("new_password").value;
        const confirmPassword = document.getElementById("confirm_password").value;

        if (username === "" || email === "" || password === "" || confirmPassword === "") {
            alert("Please fill in all fields.");
            return;
        }

        if (password !== confirmPassword) {
            alert("Passwords do not match. Please try again.");
            return;
        }

        alert("Signup successful!");
        signupForm.submit();
    });

    switchFormLink.addEventListener("click", function (event) {
        event.preventDefault();
        if (loginForm.style.display === "none") {
            loginForm.style.display = "block";
            signupForm.style.display = "none";
            switchFormLink.textContent = "Sign up";
        } else {
            loginForm.style.display = "none";
            signupForm.style.display = "block";
            switchFormLink.textContent = "Login";
        }
    });
</script> -->


</body>
</html>
