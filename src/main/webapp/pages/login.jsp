<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Mega City Cab</title>

    <!-- Bootstrap & MUI -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Custom Styles -->
    <style>
        /* Body Styling */
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

        /* Switch Container */
        .switch-container {
            display: inline-flex;
            align-items: center;
            background: rgba(255, 255, 255, 0.15);
            padding: 6px 18px;
            border-radius: 25px;
            backdrop-filter: blur(12px);
            box-shadow: 0 4px 12px rgba(255, 255, 255, 0.2);
        }

        /* Toggle Styling */
        .switch-toggle {
            cursor: pointer;
            padding: 10px 20px;
            font-weight: bold;
            font-size: 1.1rem;
            color: #ffffff;
            border-radius: 25px;
            transition: all 0.3s ease-in-out;
        }
        .switch-toggle:hover {
            background: rgba(255, 255, 255, 0.25);
        }
        .switch-toggle.active {
            background: linear-gradient(to right, #2a72db, #00d4ff);
            color: white;
            box-shadow: 0 5px 15px rgba(0, 174, 255, 0.5);
            transform: scale(1.08);
        }

        /* Divider */
        .divider {
            color: white;
            font-weight: bold;
            margin: 0 12px;
        }

        /* Login Container */
        .login-container {
            max-width: 480px;
            background: rgba(255, 255, 255, 0.12);
            padding: 50px;
            border-radius: 15px;
            box-shadow: 0px 6px 18px rgba(255, 255, 255, 0.1);
            transition: transform 0.4s ease-in-out;
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            text-align: center;
        }
        .login-container:hover {
            transform: translateY(-8px);
        }

        /* Input Fields */
        .form-control {
            border-radius: 10px;
            padding: 12px;
            font-size: 1rem;
            border: 1px solid rgba(255, 255, 255, 0.4);
            background: rgba(255, 255, 255, 0.15);
            color: white;
        }
        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        /* Login Button */
        .btn-login {
            background: linear-gradient(to right, #0066ff, #00d9ff);
            border: none;
            color: white;
            font-size: 1.1rem;
            padding: 12px 25px;
            border-radius: 10px;
            transition: all 0.4s ease-in-out;
        }
        .btn-login:hover {
            transform: scale(1.1);
            box-shadow: 0px 5px 15px rgba(0, 174, 255, 0.6);
        }

        /* Toggle Link */
        .switch-toggle {
            cursor: pointer;
            font-weight: bold;
            font-size: 1rem;
            text-decoration: underline;
            color: #00c6ff;
            transition: color 0.3s ease-in-out;
        }
        .switch-toggle:hover {
            color: #ffffff;
        }


    </style>
</head>
<body>
<div class="   vh-90">
    <div class="login-container">
        <h3 class="text-center mb-4">Login</h3>

        <!-- Toggle Switch -->
        <div class="d-flex justify-content-center mb-3">
            <div class="switch-container">
                <span id="toggleCustomer" class="switch-toggle active">Customer Login</span>
                <span class="divider">|</span>
                <span id="toggleAdmin" class="switch-toggle">Admin Login</span>
            </div>
        </div>
        <!-- Login Form -->
        <form id="loginForm" action="${pageContext.request.contextPath}/AuthController" method="post">
            <input type="hidden" name="action" value="login">
            <input type="hidden" id="userType" name="userType" value="customer">

            <!-- Customer Login Fields -->
            <div id="customerLoginFields">
                <div class="mb-3">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
            </div>

            <!-- Admin Login Fields (Initially Hidden) -->
            <div id="adminLoginFields" style="display: none;">
                <div class="mb-3">
                    <label>Username or Email</label>
                    <input type="text" name="username" class="form-control">
                </div>
            </div>

            <!-- Common Password Field -->
            <div class="mb-3">
                <label>Password</label>
                <input type="password" name="password" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-login w-100 mt-3">Login</button>

            <p class="text-center mt-3">
                Don't have an account? <a href="register.jsp">Register Here</a>
            </p>

            <!-- Forgot Password for Admin -->
            <p class="text-center mt-3" id="forgotPasswordLink" style="display: none;">
                <a href="#" data-bs-toggle="modal" data-bs-target="#adminForgotPasswordModal">Forgot Password?</a>
            </p>
        </form>
    </div>
</div>

<!-- Admin Forgot Password Modal -->
<div class="modal fade" id="adminForgotPasswordModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Reset Admin Password</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/AuthController" method="post">
                    <input type="hidden" name="action" value="adminForgotPassword">
                    <div class="mb-3">
                        <label>Email</label>
                        <input type="email" name="adminEmail" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Reset Password</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript for Toggle -->
<script>
    $(document).ready(function () {
        $("#toggleAdmin").click(function () {
            $("#userType").val("admin");
            $("#customerLoginFields").hide();
            $("#adminLoginFields").show();
            $("#forgotPasswordLink").show();
        });

        $("#toggleCustomer").click(function () {
            $("#userType").val("customer");
            $("#customerLoginFields").show();
            $("#adminLoginFields").hide();
            $("#forgotPasswordLink").hide();
        });
    });

    $(document).ready(function () {
        $("#toggleCustomer").click(function () {
            $("#toggleCustomer").addClass("active");
            $("#toggleAdmin").removeClass("active");
            $("#adminFields").hide();
            $("#customerFields").fadeIn();
        });

        $("#toggleAdmin").click(function () {
            $("#toggleAdmin").addClass("active");
            $("#toggleCustomer").removeClass("active");
            $("#customerFields").hide();
            $("#adminFields").fadeIn();
        });
    });
</script>
</body>
</html>
