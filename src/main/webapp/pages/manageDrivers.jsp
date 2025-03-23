<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.example.megacitycab.dao.DriverDAO, com.example.megacitycab.models.Driver" %>

<%
    DriverDAO driverDAO = new DriverDAO();
    List<Driver> driverList = driverDAO.getAllDrivers();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Drivers</title>

    <!-- Bootstrap & DataTables -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>

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
        }

        .container {
            background: #fff;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 900px;
            text-align: center;
        }


        h2 {
            font-weight: 600;
            letter-spacing: 1px;
            text-align: center;
            margin-bottom: 20px;
        }

        .btn-primary {
            background-color: #4A90E2;
            border-color: #4A90E2;
        }

        .btn-primary:hover {
            background-color: #357ABD;
        }

        .btn-danger:hover {
            background-color: #d32f2f;
        }

        .btn-warning:hover {
            background-color: #f57c00;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>🚖 Manage Drivers</h2>

    <button class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addDriverModal">➕ Add Driver</button>

    <table id="driversTable" class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>License</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Availability</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% for (Driver driver : driverList) { %>
        <tr>
            <td><%= driver.getDriverID() %></td>
            <td><%= driver.getName() %></td>
            <td><%= driver.getLicenseNumber() %></td>
            <td><%= driver.getPhoneNumber() %></td>
            <td><%= driver.getEmail() %></td>
            <td><%= driver.isAvailable() ? "✅ Available" : "❌ Not Available" %></td>
            <td>
                <button class="btn btn-warning btn-sm editBtn"
                        data-bs-toggle="modal"
                        data-bs-target="#editDriverModal"
                        data-id="<%= driver.getDriverID() %>"
                        data-name="<%= driver.getName() %>"
                        data-license="<%= driver.getLicenseNumber() %>"
                        data-phone="<%= driver.getPhoneNumber() %>"
                        data-email="<%= driver.getEmail() %>">✏️ Edit</button>

                <a href="<%= request.getContextPath() %>/DriverController?action=delete&id=<%= driver.getDriverID() %>"
                   class="btn btn-danger btn-sm">🗑️ Delete</a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

<!-- Add Driver Modal -->
<div class="modal fade" id="addDriverModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title">Add New Driver</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form action="<%= request.getContextPath() %>/DriverController" method="post">
                    <input type="hidden" name="action" value="add">
                    <div class="mb-3">
                        <label class="form-label">Name</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">License Number</label>
                        <input type="text" name="license" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Phone</label>
                        <input type="text" name="phone" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-success">Add Driver</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Edit Driver Modal -->
<div class="modal fade" id="editDriverModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <h5 class="modal-title">Edit Driver</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="editDriverForm" action="<%= request.getContextPath() %>/DriverController" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="driverID" id="editDriverID">
                    <div class="mb-3">
                        <label class="form-label">Name</label>
                        <input type="text" name="name" id="editName" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">License Number</label>
                        <input type="text" name="license" id="editLicense" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Phone</label>
                        <input type="text" name="phone" id="editPhone" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" id="editEmail" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Update Driver</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#driversTable').DataTable();

        $('.editBtn').click(function () {
            $('#editDriverID').val($(this).data('id'));
            $('#editName').val($(this).data('name'));
            $('#editLicense').val($(this).data('license'));
            $('#editPhone').val($(this).data('phone'));
            $('#editEmail').val($(this).data('email'));
        });
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
