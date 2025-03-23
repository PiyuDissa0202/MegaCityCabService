<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Make Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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

        .payment-card {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            padding: 2rem;
            max-width: 500px;
            width: 100%;
            transition: transform 0.3s ease-in-out;
        }

        .payment-card:hover {
            transform: scale(1.02);
        }

        .card-preview {
            background: linear-gradient(135deg, #531aff, #4dd0ff);
            border-radius: 12px;
            padding: 1.5rem;
            color: white;
            margin-bottom: 1.5rem;
            position: relative;
            overflow: hidden;
            box-shadow: 0 4px 15px rgb(64, 131, 156);
        }

        .card-preview .card-number {
            font-size: 1.6rem;
            letter-spacing: 3px;
            margin-bottom: 1rem;
        }

        .card-preview .card-details {
            display: flex;
            justify-content: space-between;
            font-size: 0.95rem;
            text-transform: uppercase;
            font-weight: bold;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            font-weight: 600;
            color: #fff;
            margin-bottom: 0.5rem;
            display: block;
        }

        .form-group input {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 8px;
            padding: 0.75rem;
            width: 100%;
            color: #fff;
            transition: all 0.3s ease-in-out;
        }

        .form-group input:focus {
            border-color: #531aff;
            box-shadow: 0 0 10px rgb(64, 131, 156);
            outline: none;
        }

        .form-group input::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }

        .form-group .input-icon {
            position: relative;
        }

        .form-group .input-icon i {
            position: absolute;
            top: 50%;
            right: 1rem;
            transform: translateY(-50%);
            color: #531aff;
        }

        .pay-button {
            background: linear-gradient(135deg, #531aff, #4dd0ff);
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            font-weight: 600;
            width: 100%;
            transition: background 0.3s ease;
            cursor: pointer;
            box-shadow: 0 4px 15px rgb(64, 131, 156);
        }

        .pay-button:hover {
            background: linear-gradient(135deg, #531aff, #4dd0ff);
        }
    </style>
</head>
<body>
<div class="payment-card">
    <h2 class="text-center mb-4">💳 Make Payment</h2>

    <!-- Card Preview -->
    <div class="card-preview">
        <div class="card-number" id="cardNumberPreview">**** **** **** ****</div>
        <div class="card-details">
            <div class="card-name" id="cardNamePreview">FULL NAME</div>
            <div class="card-expiry" id="cardExpiryPreview">MM/YY</div>
        </div>
    </div>

    <!-- Payment Form -->
    <form id="paymentForm" action="<%= request.getContextPath() %>/PaymentController" method="post" onsubmit="return validatePayment()">
        <div class="form-group">
            <label for="cardNumber">Card Number</label>
            <div class="input-icon">
                <input type="text" id="cardNumber" name="cardNumber" placeholder="1234 5678 9012 3456" maxlength="19" required>
                <i class="fas fa-credit-card"></i>
            </div>
        </div>

        <div class="form-group">
            <label for="expiryDate">Expiry Date</label>
            <div class="input-icon">
                <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" maxlength="5" required>
                <i class="fas fa-calendar-alt"></i>
            </div>
        </div>

        <div class="form-group">
            <label for="cvv">CVV</label>
            <div class="input-icon">
                <input type="text" id="cvv" name="cvv" placeholder="123" maxlength="3" required>
                <i class="fas fa-lock"></i>
            </div>
        </div>

        <div class="form-group">
            <label for="name">Cardholder Name</label>
            <input type="text" id="name" name="name" placeholder="John Doe" required>
        </div>

        <div class="form-group">
            <label for="contactNumber">Contact Number</label>
            <input type="text" id="contactNumber" name="contactNumber" placeholder="+94 123 456 789" required>
        </div>

        <button type="submit" class="pay-button">Pay Now</button>
    </form>
</div>

<script>
    document.getElementById('cardNumber').addEventListener('input', (e) => {
        let value = e.target.value.replace(/\s/g, '').replace(/\D/g, '');
        if (value.length > 16) value = value.slice(0, 16);
        value = value.replace(/(\d{4})/g, '$1 ').trim();
        e.target.value = value;
        document.getElementById('cardNumberPreview').textContent = value || '**** **** **** ****';
    });

    document.getElementById('expiryDate').addEventListener('input', (e) => {
        let value = e.target.value.replace(/\D/g, '');
        if (value.length > 4) value = value.slice(0, 4);
        if (value.length > 2) value = value.replace(/(\d{2})(\d{0,2})/, '$1/$2');
        e.target.value = value;
        document.getElementById('cardExpiryPreview').textContent = value || 'MM/YY';
    });

    document.getElementById('name').addEventListener('input', (e) => {
        document.getElementById('cardNamePreview').textContent = e.target.value.toUpperCase() || 'FULL NAME';
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
