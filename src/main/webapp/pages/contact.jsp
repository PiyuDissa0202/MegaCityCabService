<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
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

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .contact-container {
            max-width: 650px;
            background: #82c5df;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            transition: 0.3s;
        }

        .contact-container:hover {
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.3);
        }

        h2 {
            color: #1e40af;
            font-weight: bold;
        }

        .form-label {
            font-weight: 600;
            color: #1e3a8a;
        }

        .form-control {
            border-radius: 8px;
            border: 1px solid #93c5fd;
            transition: 0.3s;
        }

        .form-control:focus {
            border-color: #2563eb;
            box-shadow: 0px 0px 8px rgba(37, 99, 235, 0.5);
        }

        .btn-primary {
            background-color: #2563eb;
            border: none;
            font-weight: bold;
            padding: 10px;
            border-radius: 8px;
            transition: 0.3s;
        }

        .btn-primary:hover {
            background-color: #1e40af;
        }

        .alert-success {
            background-color: #d1fae5;
            color: #065f46;
            border: 1px solid #10b981;
        }
    </style>
</head>
<body>

<!-- Contact Us Section -->
<div class="container">
    <div class="contact-container">
        <h2 class="text-center mb-4">📞 Contact </h2>

        <p class="text-center">Have questions or need a ride? Contact us anytime!</p>

        <%
            String success = request.getParameter("success");
            if ("true".equals(success)) {
        %>
        <div class="alert alert-success text-center">Your message has been sent successfully!</div>
        <% } %>

        <form action="ContactServlet" method="post">
            <div class="mb-3">
                <label class="form-label">Your Name</label>
                <input type="text" name="name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Your Email</label>
                <input type="email" name="email" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Phone Number</label>
                <input type="tel" name="phone" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Message</label>
                <textarea name="message" class="form-control" rows="4" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary w-100">Send Message</button>
        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
