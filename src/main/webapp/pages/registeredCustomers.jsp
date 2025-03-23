<%@ page import="com.example.megacitycab.dao.CustomerDAO, com.example.megacitycab.models.Customer, java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registered Customers - Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    :root {
      --primary-color: #6D28D9; /* Purple */
      --secondary-color: #3B82F6; /* Light Blue */
      --danger-color: #EF4444; /* Bright Red */
      --card-bg: rgba(255, 255, 255, 0.15); /* Glassmorphism */
      --border-color: rgba(255, 255, 255, 0.2);
      --text-light: #F3F4F6;
      --text-dark: #1F2937;
      --bg-gradient: linear-gradient(135deg, #1A1A40, #4C1D95); /* Dark purple to deep blue */
    }

    body {
      background: var(--bg-gradient);
      font-family: 'Poppins', sans-serif;
      color: var(--text-light);
      padding: 2rem 0;
    }

    .customer-card {
      background: var(--card-bg);
      backdrop-filter: blur(16px);
      border-radius: 16px;
      border: 1px solid var(--border-color);
      box-shadow: 0 10px 24px rgba(0, 0, 0, 0.15);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      overflow: hidden;
      margin-bottom: 1.5rem;
    }

    .customer-card:hover {
      transform: translateY(-8px);
      box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25);
    }

    .card-header {
      background: var(--primary-color);
      color: white;
      padding: 1.5rem;
      font-size: 1.1rem;
      border-bottom: 0;
      font-weight: bold;
      text-transform: uppercase;
      letter-spacing: 1px;
    }

    .detail-group {
      padding: 1.5rem;
      border-bottom: 1px solid var(--border-color);
    }

    .detail-group:last-child {
      border-bottom: 0;
    }

    .detail-label {
      color: var(--text-light);
      font-size: 0.9rem;
      font-weight: 500;
      margin-bottom: 0.3rem;
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .detail-value {
      color: var(--text-light);
      font-weight: 600;
      margin-bottom: 1rem;
      font-size: 1rem;
    }

    .delete-btn {
      background: var(--danger-color);
      color: white;
      border: none;
      padding: 0.7rem 1.4rem;
      border-radius: 12px;
      display: inline-flex;
      align-items: center;
      gap: 0.5rem;
      transition: background 0.3s ease, transform 0.2s ease;
      font-weight: 600;
    }

    .delete-btn:hover {
      background: #B91C1C;
      transform: scale(1.05);
    }

    .delete-btn i {
      font-size: 1.2rem;
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
      .card-header {
        font-size: 1rem;
      }

      .detail-label {
        font-size: 0.85rem;
      }

      .detail-value {
        font-size: 0.95rem;
      }
    }
  </style>
</head>
<body>
<div class="container">
  <div class="mb-4 text-center">
    <h2 class="fw-bold mb-3">👥 Registered Customers</h2>
    <p class="text-light">Manage all registered customers</p>
  </div>

  <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
    <%
      CustomerDAO customerDAO = null;
      try {
        customerDAO = new CustomerDAO();
      } catch (SQLException e) {
        throw new RuntimeException(e);
      }
      List<Customer> customers = customerDAO.getAllCustomers();

      for (Customer customer : customers) {
    %>
    <div class="col">
      <div class="customer-card">
        <div class="card-header">
          <h5 class="mb-0">Customer #<%= customer.getCustomerId() %></h5>
        </div>

        <div class="detail-group">
          <div class="detail-label"><i class="fas fa-user me-2"></i>Name</div>
          <div class="detail-value"><%= customer.getName() %></div>

          <div class="detail-label"><i class="fas fa-id-card me-2"></i>NIC</div>
          <div class="detail-value"><%= customer.getNic() %></div>

          <div class="detail-label"><i class="fas fa-envelope me-2"></i>Email</div>
          <div class="detail-value"><%= customer.getEmail() %></div>

          <div class="detail-label"><i class="fas fa-phone me-2"></i>Phone</div>
          <div class="detail-value"><%= customer.getPhoneNumber() %></div>
        </div>

        <div class="detail-group text-end p-3">
          <form method="post" action="DeleteCustomerController" onsubmit="return confirmDelete();">
            <input type="hidden" name="customer_id" value="<%= customer.getCustomerId() %>">
            <button type="submit" class="delete-btn">
              <i class="fas fa-trash me-1"></i>
              Delete Customer
            </button>
          </form>
        </div>
      </div>
    </div>
    <% } %>
  </div>
</div>

<script>
  function confirmDelete() {
    return confirm("Are you sure you want to delete this user?");
  }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
