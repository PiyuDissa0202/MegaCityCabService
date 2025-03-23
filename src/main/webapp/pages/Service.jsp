<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Services - Mega City Cab</title>
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

        .service-container {
            max-width: 1100px;
            margin: auto;
            padding: 30px;
        }

        .service-card {
            background: #cfe8fc; /* Soft blue */
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }

        .service-card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.2);
        }

        .service-icon {
            font-size: 40px;
            color: #1e40af; /* Royal blue */
        }

        .btn-primary {
            background-color: #1e40af; /* Royal blue */
            border-color: #1e40af;
            font-weight: bold;
        }

        .btn-primary:hover {
            background-color: #1e3a8a; /* Darker blue */
            border-color: #1e3a8a;
        }
    </style>
</head>
<body>

<!-- Services Section -->
<div class="container my-5 service-container">
    <h2 class="text-center mb-4">🚖 Our Services</h2>

    <div class="row g-4">
        <div class="col-md-4">
            <div class="service-card text-center p-4">
                <div class="service-icon">📍</div>
                <h4 class="mt-3">City Rides</h4>
                <p>Book a cab for comfortable and safe city rides at affordable rates.</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="service-card text-center p-4">
                <div class="service-icon">🏢</div>
                <h4 class="mt-3">Corporate Travel</h4>
                <p>Reliable and punctual cab services for corporate clients and executives.</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="service-card text-center p-4">
                <div class="service-icon">✈️</div>
                <h4 class="mt-3">Airport Transfers</h4>
                <p>Hassle-free airport pickups and drop-offs with real-time tracking.</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="service-card text-center p-4">
                <div class="service-icon">🛣️</div>
                <h4 class="mt-3">Outstation Trips</h4>
                <p>Book long-distance cabs with experienced drivers for comfortable travel.</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="service-card text-center p-4">
                <div class="service-icon">🕒</div>
                <h4 class="mt-3">24/7 Service</h4>
                <p>Available any time, day or night, for your convenience and safety.</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="service-card text-center p-4">
                <div class="service-icon">💳</div>
                <h4 class="mt-3">Cashless Payments</h4>
                <p>Pay easily using online transactions or digital wallets.</p>
            </div>
        </div>
    </div>

    <div class="text-center mt-4">
        <a href="home.jsp" class="btn btn-primary">Book a Ride</a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
