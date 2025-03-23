<%@ page import="com.example.megacitycab.dao.BookingDAO, com.example.megacitycab.models.Booking, java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bookings - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4F46E5; /* Purple Blue */
            --secondary-color: #9333EA; /* Dark Purple */
            --accent-color: #14B8A6; /* Teal */
            --danger-color: #DC2626; /* Red */
            --card-bg: #ffffff;
            --text-dark: #1E293B;
            --text-light: #64748B;
            --bg-light: #82c5df;
            --shadow-color: rgba(0, 0, 0, 0.12);
        }

        body {
            background: var(--bg-light);
            font-family: 'Inter', sans-serif;
            padding: 2rem 0;
            color: var(--text-dark);
        }

        .booking-card {
            background: var(--card-bg);
            border-radius: 14px;
            box-shadow: 0 6px 12px var(--shadow-color);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            overflow: hidden;
            margin-bottom: 1.5rem;
            border: 1px solid #E2E8F0;
        }

        .booking-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 10px 20px var(--shadow-color);
        }

        .card-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 1.5rem;
            font-size: 1.2rem;
            font-weight: bold;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .detail-group {
            padding: 1.2rem 1.5rem;
            border-bottom: 1px solid var(--bg-light);
            transition: background 0.3s ease;
        }

        .detail-group:hover {
            background: #F3F4F6;
        }

        .detail-label {
            color: var(--text-light);
            font-size: 0.9rem;
            margin-bottom: 0.2rem;
        }

        .detail-value {
            color: var(--text-dark);
            font-weight: 600;
            margin-bottom: 0.8rem;
        }

        .delete-btn {
            background: var(--danger-color);
            color: white;
            border: none;
            padding: 0.7rem 1.4rem;
            border-radius: 8px;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.9rem;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .delete-btn:hover {
            background: #B91C1C;
            transform: scale(1.05);
        }

        .icon {
            color: var(--accent-color);
            font-size: 1.2rem;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="mb-4 text-center">
        <h2 class="fw-bold mb-3 text-gradient">📋 Active Bookings</h2>
        <p class="text-muted">Manage customer reservations efficiently</p>
    </div>

    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
        <%
            BookingDAO bookingDAO = null;
            try {
                bookingDAO = new BookingDAO();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            List<Booking> bookings = bookingDAO.getAllBookings();

            for (Booking booking : bookings) {
        %>
        <div class="col">
            <div class="booking-card">
                <div class="card-header">
                    <span>Booking #<%= booking.getOrderId() %></span>
                    <small><i class="fas fa-calendar-alt me-2"></i><%= booking.getOrderDatetime() %></small>
                </div>

                <div class="detail-group">
                    <div class="detail-label"><i class="fas fa-user me-2 icon"></i>Customer</div>
                    <div class="detail-value"><%= booking.getCustomerName() %></div>

                    <div class="detail-label"><i class="fas fa-phone me-2 icon"></i>Contact</div>
                    <div class="detail-value"><%= booking.getTelephoneNumber() %></div>

                    <div class="detail-label"><i class="fas fa-map-marker-alt me-2 icon"></i>Address</div>
                    <div class="detail-value"><%= booking.getAddress() %></div>
                </div>

                <div class="detail-group">
                    <div class="detail-label"><i class="fas fa-route me-2 icon"></i>Trip Details</div>
                    <div class="row">
                        <div class="col-6">
                            <div class="detail-label">Pickup</div>
                            <div class="detail-value"><%= booking.getPickupLocation() %></div>
                        </div>
                        <div class="col-6">
                            <div class="detail-label">Duration</div>
                            <div class="detail-value"><%= booking.getDuration() %> Km</div>
                        </div>
                    </div>
                </div>

                <div class="detail-group">
                    <div class="detail-label"><i class="fas fa-car me-2 icon"></i>Vehicle Details</div>
                    <div class="row">
                        <div class="col-6">
                            <div class="detail-label">Driver</div>
                            <div class="detail-value"><%= booking.getDriverName() %></div>
                        </div>
                        <div class="col-6">
                            <div class="detail-label">Car Model</div>
                            <div class="detail-value"><%= booking.getCarModel() %></div>
                        </div>
                    </div>
                </div>

                <div class="detail-group text-end p-3">
                    <form method="post" action="DeleteBookingController">
                        <input type="hidden" name="order_id" value="<%= booking.getOrderId() %>">
                        <button type="submit" class="delete-btn">
                            <i class="fas fa-trash me-1"></i>
                            Delete Booking
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
