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
    /* Base Styling */
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

    .guide-section {
      transition: transform 0.3s, box-shadow 0.3s;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    .guide-section:hover {
      transform: translateY(-8px);
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    }

    .step-icon {
      width: 90px;
      height: 90px;
      background: linear-gradient(45deg, #531aff, #4dd0ff);
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0 auto 25px;
      box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
    }

    .step-number {
      position: absolute;
      top: -20px;
      right: -20px;
      background: #ff5733;
      color: white;
      width: 45px;
      height: 45px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: bold;
      font-size: 18px;
    }

    .feature-card {
      border: none;
      border-radius: 20px;
      box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
      background: #ffffff;
      transition: transform 0.4s, box-shadow 0.4s;
    }

    .feature-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 18px 36px rgba(0, 0, 0, 0.2);
    }

    .animated-line {
      border-left: 3px dashed #3498db;
      height: 80px;
      margin: 25px auto;
      animation: pulse 2s infinite;
    }

    @keyframes pulse {
      0% { opacity: 0.5; }
      50% { opacity: 1; }
      100% { opacity: 0.5; }
    }

    /* Hero Section */
    .hero-section {
      background: linear-gradient(135deg, #531aff, #4dd0ff);
      color: white;
      padding: 300px 0; /* Increased padding for more height */
      min-height: 100vh; /* Ensures it takes at least the full viewport height */
      display: flex;
      align-items: center; /* Centers content vertically */
      text-align: center;
    }


    .hero-section h1 {
      font-size: 3.5rem;
      font-weight: 700;
      letter-spacing: -1px;
    }

    .hero-section p {
      font-size: 1.2rem;
      font-weight: 500;
      opacity: 0.8;
    }

    .hero-section img {
      max-width: 320px;
      margin-top: 40px;
      border-radius: 15px;
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    }

    /* FAQ Accordion */
    .accordion-button {
      background: #3498db;
      color: white;
      font-weight: 600;
      transition: background-color 0.3s;
    }

    .accordion-button:hover {
      background-color: #2980b9;
    }

    .accordion-item {
      border: none;
      margin-bottom: 15px;
    }

    .accordion-body {
      background: #f7f7f7;
      color: #333;
      font-size: 1.1rem;
      padding: 20px;
      border-radius: 8px;
    }

    .accordion-header button::after {
      content: none;
    }

    /* Footer */
    footer {
      background-color: #2c3e50;
      color: white;
      padding: 30px 0;
      text-align: center;
      font-size: 1rem;
    }

  </style>
</head>
<body>

<!-- Hero Section -->
<section class="hero-section">
  <div class="container">
    <h1 class="animate__animated animate__fadeInDown">Welcome to MegaCity Cab</h1>
    <p class="lead animate__animated animate__fadeInUp">Your Ultimate Guide to Seamless Transportation</p>

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
