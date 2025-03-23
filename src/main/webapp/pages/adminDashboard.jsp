<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #712fd3;
            --secondary-color: #2575fc;
            --accent-color: #8e44ad;
            --success-color: #1abc9c;
            --bg-light: #40839c;
            --bg-dark: #1c1f2e;
            --text-light: #e0e0e0;
            --text-dark: #2c2f40;
        }

        body {
            background: url('<%= request.getContextPath() %>/assets/images/banner.jpg') no-repeat center center fixed;
            backdrop-filter: blur(3px);
            height: 100vh;
            margin: 0;
            background-size: cover;
            font-family: 'Inter', sans-serif;
        }

        .sidebar {
            width: 280px;
            height: 100vh;
            background: linear-gradient(180deg, var(--primary-color), var(--secondary-color));
            position: fixed;
            box-shadow: 3px 0 25px rgba(0, 0, 0, 0.2);
            color: var(--text-light);
            transition: all 0.3s ease-in-out;
        }

        .sidebar-header {
            padding: 1.5rem;
            font-weight: bold;
            text-transform: uppercase;
            text-align: center;
            border-bottom: 2px solid rgba(255, 255, 255, 0.1);
        }

        .nav-link {
            color: rgba(255, 255, 255, 0.85) !important;
            padding: 0.9rem 1.5rem !important;
            margin: 0.3rem 1rem;
            border-radius: 12px;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .nav-link:hover {
            background: rgba(255, 255, 255, 0.15);
            transform: translateX(7px);
        }

        .nav-link.active {
            background: rgba(255, 255, 255, 0.2);
            font-weight: 600;
            box-shadow: 0 4px 10px rgba(255, 255, 255, 0.3);
        }

        .main-content {
            margin-left: 280px;
            padding: 2rem;
        }

        .card {
            border: none;
            border-radius: 15px;
            background: white;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }

        .stat-card i {
            font-size: 2.5rem;
            background: linear-gradient(45deg, var(--primary-color), var(--accent-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .table {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
        }

        .table thead {
            background: var(--primary-color);
            color: white;
        }

        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: bold;
        }

        .badge-completed { background: rgba(26, 188, 156, 0.2); color: #1abc9c; }
        .badge-ongoing { background: rgba(241, 196, 15, 0.2); color: #f1c40f; }
        .badge-pending { background: rgba(231, 76, 60, 0.2); color: #e74c3c; }

        .btn-primary {
            background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
            border: none;
            color: white;
            font-weight: bold;
            padding: 10px 18px;
            border-radius: 10px;
            transition: all 0.3s ease-in-out;
        }

        .btn-primary:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(106, 17, 203, 0.3);
        }

        @media (max-width: 992px) {
            .sidebar {
                width: 80px;
                text-align: center;
            }
            .sidebar-header {
                display: none;
            }
            .nav-link {
                padding: 0.8rem;
                margin: 0.3rem;
                font-size: 0.9rem;
            }
            .main-content {
                margin-left: 80px;
            }
        }

    </style>
</head>
<body>
<div class="sidebar">
    <div class="sidebar-header">
        <h3 class="text-white mb-0">🚕 MegaCity Cab</h3>
        <p class="text-muted mb-0 small">Admin Dashboard</p>
    </div>
    <nav class="nav flex-column mt-4">
        <a class="nav-link active" href="adminDashboard.jsp">
            <i class="fas fa-tachometer-alt me-2"></i>Dashboard
        </a>
        <a class="nav-link" href="manageCar.jsp">
            <i class="fas fa-car me-2"></i>Manage Cars
        </a>
        <a class="nav-link" href="manageDrivers.jsp">
            <i class="fas fa-user-friends me-2"></i>Manage Drivers
        </a>
        <a class="nav-link" href="bookingDetails.jsp">
            <i class="fas fa-chart-bar me-2"></i>Reports
        </a>
        <a class="nav-link" href="../index.jsp">
            <i class="fas fa-sign-out-alt me-2"></i>Logout
        </a>
    </nav>
</div>

<div class="main-content">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="h3 mb-0">Dashboard Overview</h1>
        <div class="text-muted">Today: <%= new java.util.Date().toLocaleString() %></div>
    </div>

    <%
        Integer totalBookings = (Integer) request.getAttribute("totalBookings");
        Integer availableCars = (Integer) request.getAttribute("availableCars");
        Integer activeDrivers = (Integer) request.getAttribute("activeDrivers");
        Integer registeredUsers = (Integer) request.getAttribute("registeredUsers");
    %>

    <div class="row g-4 mb-4">
        <div class="col-12 col-sm-6 col-xl-3"><div class="card stat-card p-3"><div class="card-body"><i class="fas fa-calendar-check"></i><h2 class="mt-3"><%= totalBookings != null ? totalBookings : 5 %></h2><p>Total Bookings</p></div></div></div>
        <div class="col-12 col-sm-6 col-xl-3"><div class="card stat-card p-3"><div class="card-body"><i class="fas fa-car"></i><h2 class="mt-3"><%= availableCars != null ? availableCars : 10 %></h2><p>Available Cars</p></div></div></div>
    </div>
</div>
</body>
</html>
