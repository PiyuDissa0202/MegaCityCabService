<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab - Home</title>

    <!-- MUI & Swiper.js -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mui/material@5.0.0/dist/material.min.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <style>
        /* Fixed Background Image */
        .main-banner {
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.7)),
            url('<%= request.getContextPath() %>/assets/images/index.jpg')
            no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #f8f9fa;
            font-size: 2.5rem;
            font-weight: bold;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.5);
        }

        /* Services Section */
        .service-box {
            transition: all 0.4s ease-in-out;
            padding: 25px;
            border-radius: 15px;
            background: linear-gradient(135deg, #ffffff, #8050af);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            border: 2px solid #d1d1d1;
        }
        .service-box:hover {
            transform: translateY(-12px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }
        .service-box img {
            width: 280px;
            height: 380px;
            margin-bottom: 15px;
            border-radius: 10px;
            border: 3px solid #007bff;
        }

        /* Big Banner Section */
        .big-banner {
            background: linear-gradient(rgba(34, 34, 34, 0.6), rgba(0, 0, 0, 0.8)),
            url('<%= request.getContextPath() %>/assets/images/ind.jpg')
            no-repeat center center;
            background-size: cover;
            height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #ffffff;
        }
        .big-banner .content {
            background: rgba(255, 255, 255, 0.1);
            padding: 45px;
            border-radius: 12px;
            backdrop-filter: blur(8px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            animation: fadeIn 1.5s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }

        /* Car Swiper Section */
        .car-swiper-container {
            width: 90%;
            margin: auto;
            padding: 50px 0;
        }
        .swiper-slide {
            display: flex;
            justify-content: center;
            align-items: center;
            transition: transform 0.4s ease-in-out;
        }
        .swiper-slide:hover {
            transform: scale(1.08);
        }
        .car-box {
            background: linear-gradient(135deg, #f8f9fa, #e9ecef);
            padding: 25px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            border: 2px solid #6c757d;
        }
        .car-box img {
            width: 100%;
            border-radius: 12px;
            height: 260px;
            object-fit: cover;
            border: 3px solid #28a745;
        }

        
    </style>
</head>
<body>

<!-- Header -->
<jsp:include page="/includes/header.jsp" />

<!-- Main Banner Section -->
<div class="main-banner">
    <div class="banner-text">
        <h1>Welcome !</h1>
        <p> We’re here to get you where you need to go, anytime, anywhere!</p>
    </div>
</div>

<!-- Services Section -->
<section class="container py-5">
    <h2 class="text-center mb-4">Our Services</h2>
    <div class="row">
        <div class="col-md-4">
            <div class="service-box">
                <img src="<%= request.getContextPath() %>/assets/images/book.png" alt="24/7 Service">
                <h3>🚖 24-Hour Service </h3>
                <p>Our cab services are available anytime, day or night!</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="service-box">
                <img src="<%= request.getContextPath() %>/assets/images/payement.jpg" alt="Affordable Rates">
                <h3>💰 Budget-Friendly Prices</h3>
                <p>Enjoy the most competitive rates for your journeys.</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="service-box">
                <img src="<%= request.getContextPath() %>/assets/images/cab.jpg" alt="Clean & Safe">
                <h3>✅ Safety Service</h3>
                <p>Our vehicles are regularly serviced and thoroughly sanitized..</p>
            </div>
        </div>
    </div>
</section>

<!-- Big Banner Section -->
<section class="big-banner">
    <div class="content">
        <h2><p>Experience the best car rental services with Mega City Cab.</p></h2>
        <button class="btn btn-primary btn-lg">Book Now</button>
    </div>
</section>

<!-- Car Swiper Section -->
<section class="car-swiper-container">
    <h2 class="text-center mb-4">Our Featured Cars</h2>
    <div class="swiper mySwiper">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <div class="car-box">
                    <img src="<%= request.getContextPath() %>/assets/images/cars/c1.jpg" alt="Car 1">
                    <h4>Toyota Prius</h4>
                    <p>Hybrid | Automatic | 2023</p>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="car-box">
                    <img src="<%= request.getContextPath() %>/assets/images/cars/6761424758ead.jpeg" alt="Car 2">
                    <h4>Honda Civic</h4>
                    <p>Petrol | Manual | 2022</p>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="car-box">
                    <img src="<%= request.getContextPath() %>/assets/images/cars/vaganr.jpg" alt="Car 3">
                    <h4>Suzuki- Wagan R</h4>
                    <p>Luxury | Automatic | 2023</p>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="car-box">
                    <img src="<%= request.getContextPath() %>/assets/images/cars/chR.png" alt="Car 3">
                    <h4>TOYOTA- CHR </h4>
                    <p>Luxury | Automatic | 2023</p>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="car-box">
                    <img src="<%= request.getContextPath() %>/assets/images/cars/panda.jpg" alt="Car 3">
                    <h4>Micro-Panda</h4>
                    <p>Luxury | Automatic | 2023</p>
                </div>
            </div>
        </div>
        <!-- Add Pagination & Navigation -->
        <div class="swiper-pagination"></div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>
</section>



<!-- Footer -->
<jsp:include page="/includes/footer.jsp" />

<!-- Scripts -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap" async defer></script>
<script>
    // Initialize Swiper
    var swiper = new Swiper(".mySwiper", {
        slidesPerView: 3,
        spaceBetween: 20,
        loop: true,
        autoplay: {
            delay: 3000,
            disableOnInteraction: false,
        },
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        breakpoints: {
            768: { slidesPerView: 2 },
            480: { slidesPerView: 1 },
        }
    });
</script>

</body>
</html>
