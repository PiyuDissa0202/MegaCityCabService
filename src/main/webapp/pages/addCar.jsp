<%@ page import="com.example.megacitycab.models.Car" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Add Car - Mega City Cab</title>

    <!-- Bootstrap & MUI CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #1a2a6c, #b21f1f, #fdbb2d);
            background-size: 400% 400%;
            animation: gradientAnimation 15s ease infinite;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            backdrop-filter: blur(8px);
        }

        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .card {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 25px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
        }

        .card h2 {
            font-weight: 600;
            color: #4e5d77;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
        }

        .form-control {
            border-radius: 12px;
            padding: 12px 15px;
            font-size: 16px;
            transition: all 0.3s ease-in-out;
            border: 2px solid #ddd;
        }

        .form-control:focus {
            border-color: #ff6f61;
            box-shadow: 0 0 8px rgba(255, 111, 97, 0.5);
        }

        .btn-primary {
            background: linear-gradient(135deg, #ff6f61, #ff4b2b);
            border: none;
            padding: 15px;
            border-radius: 12px;
            font-size: 18px;
            font-weight: bold;
            transition: background 0.3s, transform 0.3s;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #ff4b2b, #ff6f61);
            transform: translateY(-5px);
        }

        .image-preview {
            width: 100%;
            max-height: 200px;
            object-fit: cover;
            border-radius: 12px;
            display: none;
        }

        .modal-content {
            border-radius: 20px;
        }

        .alert {
            border-radius: 12px;
            font-size: 16px;
            font-weight: bold;
        }

        .alert-success {
            background-color: #4caf50;
            color: white;
        }

        .alert-danger {
            background-color: #f44336;
            color: white;
        }

        .card p {
            font-size: 14px;
            color: #555;
        }

        .form-label {
            font-weight: 600;
            color: #4e5d77;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-4">
            <div class="card p-4">
                <h2 class="text-center mb-3">🚗 Add New Car</h2>

                <!-- Success/Error Messages -->
                <% String success = request.getParameter("success");
                    String error = request.getParameter("error");
                    if (success != null) { %>
                <div class="alert alert-success text-center"><%= success %></div>
                <% } if (error != null) { %>
                <div class="alert alert-danger text-center"><%= error %></div>
                <% } %>

                <form action="${pageContext.request.contextPath}/AddCarServlet" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label class="form-label">Model</label>
                        <input type="text" name="model" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Brand</label>
                        <input type="text" name="brand" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">License Plate</label>
                        <input type="text" name="licensePlate" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Price Per Day ($)</label>
                        <input type="number" step="0.01" name="pricePerDay" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Status</label>
                        <select name="status" class="form-control">
                            <option value="Available">Available</option>
                            <option value="Booked">Booked</option>
                            <option value="In Maintenance">In Maintenance</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Car Image</label>
                        <input type="file" name="image" class="form-control" accept="image/*" onchange="previewImage(event)">
                        <img id="imagePreview" class="image-preview mt-3">
                    </div>

                    <button type="submit" class="btn btn-primary w-100">Add Car</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function previewImage(event) {
        let imagePreview = document.getElementById("imagePreview");
        imagePreview.src = URL.createObjectURL(event.target.files[0]);
        imagePreview.style.display = "block";
    }
</script>
</body>
</html>
