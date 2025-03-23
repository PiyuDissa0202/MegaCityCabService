<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | Mega City Cab</title>

    <!-- Bootstrap & jQuery -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Custom Styles -->
    <style>
        :root {
            --primary-color: #4dd0ff;
            --secondary-color: #531aff;
            --background-gradient: linear-gradient(135deg, #2c3e50, #000000);
            --card-bg: rgba(255, 255, 255, 0.1);
            --text-light: #f1f1f1;
            --border-color: rgba(255, 255, 255, 0.2);
        }

        body {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
            url('<%= request.getContextPath() %>/assets/images/banner.jpg')
            no-repeat center center fixed;
            background-size: cover;
            backdrop-filter: blur(3px);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-top: 150px;
        }

        .register-container {
            max-width: 450px;
            background: var(--card-bg);
            backdrop-filter: blur(12px);
            padding: 40px;
            border-radius: 15px;
            border: 1px solid var(--border-color);
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease-in-out;
        }

        .register-container:hover {
            transform: translateY(-5px);
        }

        .register-container h3 {
            text-align: center;
            font-weight: 600;
            margin-bottom: 20px;
            color: var(--primary-color);
        }

        .form-control {
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.2);
            border: 1px solid var(--border-color);
            color: white;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        .btn-register {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            border: none;
            color: white;
            padding: 12px;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease-in-out;
        }

        .btn-register:hover {
            transform: scale(1.05);
            box-shadow: 0px 4px 10px rgba(255, 77, 77, 0.5);
        }

        .text-link {
            color: var(--secondary-color);
            font-weight: 500;
            text-decoration: none;
        }

        .text-link:hover {
            text-decoration: underline;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .register-container {
                max-width: 90%;
                padding: 30px;
            }
        }
    </style>
</head>
<body>

<div class="register-container">
    <h3>Customer Registration</h3>

    <form id="registerForm" action="${pageContext.request.contextPath}/CustomerController" method="post">
        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" name="name" class="form-control" placeholder="Enter your full name" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" placeholder="Enter your email" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Phone Number</label>
            <input type="text" name="phone" class="form-control" placeholder="Enter your phone number" required>
        </div>
        <div class="mb-3">
            <label class="form-label">NIC (National ID)</label>
            <input type="text" name="nic" class="form-control" placeholder="Enter your NIC number" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" placeholder="Create a password" required>
        </div>

        <button type="submit" class="btn btn-register w-100 mt-3">Register</button>
        <p class="text-center mt-3">
            Already have an account? <a href="login.jsp" class="text-link">Login Here</a>
        </p>
    </form>
</div>

<!-- JavaScript Validation -->
<script>
    $("#registerForm").submit(function () {
        let name = $("input[name='name']").val();
        let phone = $("input[name='phone']").val();
        let nic = $("input[name='nic']").val();
        let password = $("input[name='password']").val();

        if (name.length < 3) {
            alert("Name must be at least 3 characters long.");
            return false;
        }
        if (phone.length < 10 || isNaN(phone)) {
            alert("Enter a valid phone number.");
            return false;
        }
        if (nic.length !== 10 && nic.length !== 12) {
            alert("NIC should be 10 or 12 characters long.");
            return false;
        }
        if (password.length < 6) {
            alert("Password must be at least 6 characters.");
            return false;
        }

        return true;
    });
</script>

</body>
</html>
