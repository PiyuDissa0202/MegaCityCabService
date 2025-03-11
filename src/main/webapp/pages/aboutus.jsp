<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>User Guide - MegaCity Cab</title>
  <!-- Required Meta Tags -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Material Design Icons -->
  <link href="https://cdn.jsdelivr.net/npm/@mdi/font@6.5.95/css/materialdesignicons.min.css" rel="stylesheet">

  <!-- Animate.css -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">

  <!-- Custom CSS -->
  <style>
    .guide-section {
      transition: transform 0.3s;
    }
    .guide-section:hover {
      transform: translateY(-5px);
    }
    .step-icon {
      width: 80px;
      height: 80px;
      background: #1976d2;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0 auto 20px;
    }
    .step-number {
      position: absolute;
      top: -15px;
      right: -15px;
      background: #ff4081;
      color: white;
      width: 40px;
      height: 40px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: bold;
    }
    .feature-card {
      border: none;
      border-radius: 15px;
      box-shadow: 0 8px 24px rgba(0,0,0,0.1);
    }
    .animated-line {
      border-left: 3px dashed #1976d2;
      height: 80px;
      margin: 20px auto;
      animation: pulse 2s infinite;
    }
    @keyframes pulse {
      0% { opacity: 0.5; }
      50% { opacity: 1; }
      100% { opacity: 0.5; }
    }
  </style>
</head>
<body class="bg-light">

<!-- Hero Section -->
<section class="py-5 text-center bg-primary text-white">
  <div class="container">
    <h1 class="display-4 animate__animated animate__fadeInDown">Welcome to MegaCity Cab</h1>
    <p class="lead animate__animated animate__fadeInUp">Your Ultimate Guide to Seamless Transportation</p>
    <img src="https://cdn.dribbble.com/users/2400293/screenshots/16527147/media/085b6b14717db7c0b4e076fadd4f5aeb.png"
         alt="Taxi Illustration" class="img-fluid mt-4 animate__animated animate__zoomIn" style="max-height: 300px;">
  </div>
</section>

<!-- Main Guide Content -->
<div class="container py-5">
  <!-- Step-by-Step Guide -->
  <div class="row g-4">
    <!-- Step 1 -->
    <div class="col-md-6 col-lg-4">
      <div class="card feature-card guide-section h-100 animate__animated animate__slideInLeft">
        <div class="card-body text-center position-relative">
          <div class="step-number">1</div>
          <div class="step-icon text-white">
            <i class="mdi mdi-account-circle-outline mdi-36px"></i>
          </div>
          <h3 class="mb-3">Create Account</h3>
          <p>Register using your email or social media accounts to get started</p>
          <img src="https://cdn-icons-png.flaticon.com/512/2996/2996327.png"
               alt="Registration" class="img-fluid mt-3" style="max-height: 150px;">
        </div>
      </div>
    </div>

    <!-- Animated Line -->
    <div class="col-12 d-md-none text-center">
      <div class="animated-line"></div>
    </div>

    <!-- Step 2 -->
    <div class="col-md-6 col-lg-4">
      <div class="card feature-card guide-section h-100 animate__animated animate__slideInUp">
        <div class="card-body text-center position-relative">
          <div class="step-number">2</div>
          <div class="step-icon text-white">
            <i class="mdi mdi-map-marker-path mdi-36px"></i>
          </div>
          <h3 class="mb-3">Book Your Ride</h3>
          <p>Enter pickup/drop locations and choose your preferred vehicle type</p>
          <img src="https://cdn-icons-png.flaticon.com/512/854/854878.png"
               alt="Booking" class="img-fluid mt-3" style="max-height: 150px;">
        </div>
      </div>
    </div>

    <!-- Animated Line -->
    <div class="col-12 d-md-none text-center">
      <div class="animated-line"></div>
    </div>

    <!-- Step 3 -->
    <div class="col-md-6 col-lg-4">
      <div class="card feature-card guide-section h-100 animate__animated animate__slideInRight">
        <div class="card-body text-center position-relative">
          <div class="step-number">3</div>
          <div class="step-icon text-white">
            <i class="mdi mdi-credit-card-check-outline mdi-36px"></i>
          </div>
          <h3 class="mb-3">Payment & Ride</h3>
          <p>Secure payment options and real-time driver tracking</p>
          <img src="https://cdn-icons-png.flaticon.com/512/2331/2331966.png"
               alt="Payment" class="img-fluid mt-3" style="max-height: 150px;">
        </div>
      </div>
    </div>
  </div>

  <!-- FAQ Section -->
  <div class="row mt-5">
    <div class="col-lg-8 mx-auto">
      <div class="card feature-card animate__animated animate__fadeInUp">
        <div class="card-body">
          <h2 class="text-center mb-4"><i class="mdi mdi-help-circle-outline"></i> Frequently Asked Questions</h2>

          <div class="accordion" id="faqAccordion">
            <!-- FAQ Item 1 -->
            <div class="accordion-item">
              <h2 class="accordion-header">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#faq1">
                  How do I cancel a booking?
                </button>
              </h2>
              <div id="faq1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                  Visit your bookings page and click "Cancel Ride" next to the active booking.
                </div>
              </div>
            </div>

            <!-- FAQ Item 2 -->
            <div class="accordion-item">
              <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2">
                  What payment methods are accepted?
                </button>
              </h2>
              <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                  We accept all major credit cards, PayPal, and mobile payment options.
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Animation Initialization -->
<script>
  document.addEventListener('DOMContentLoaded', function() {
    // Add animation triggers
    const elements = document.querySelectorAll('.guide-section');
    elements.forEach(el => {
      el.style.opacity = '0';
      setTimeout(() => {
        el.style.transition = 'opacity 1s, transform 0.3s';
        el.style.opacity = '1';
      }, 300);
    });
  });
</script>

</body>
</html>