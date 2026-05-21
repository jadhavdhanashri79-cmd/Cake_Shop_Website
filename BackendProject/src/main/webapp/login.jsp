<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login | Hanna Bakes</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

<style>

body{
    margin:0;
    padding:0;
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#ffe0ec,#f3d9ff);
    font-family:'Poppins',sans-serif;
    overflow:hidden;
    position:relative;
}

/* FLOATING CAKE EMOJIS */

.cake{
    position:absolute;
    top:-100px;
    font-size:35px;
    animation:fall linear infinite;
    opacity:0.8;
}

@keyframes fall{

    0%{
        transform:translateY(-100px) rotate(0deg);
    }

    100%{
        transform:translateY(120vh) rotate(360deg);
    }
}

/* LOGIN BOX */

.hb-login-container{
    width:850px;
    background:rgba(255,255,255,0.95);
    border-radius:25px;
    overflow:hidden;
    box-shadow:0 15px 40px rgba(0,0,0,0.15);
    display:flex;
    position:relative;
    z-index:10;
    backdrop-filter:blur(10px);
}

/* LEFT SIDE */

.hb-left{
    width:45%;
    position:relative;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:30px;
    overflow:hidden;

    background:
    linear-gradient(rgba(0,0,0,0.45),
    rgba(0,0,0,0.45)),

    url('Image/Background/Cake1.avif')
    center/cover no-repeat;
}

.hb-overlay{
    color:white;
    text-align:center;
}

.hb-overlay h1{
    font-size:42px;
    font-weight:700;
    margin-bottom:10px;
}

.hb-overlay p{
    font-size:18px;
}

/* RIGHT SIDE */

.hb-right{
    width:55%;
    padding:45px;
    background:white;
}

.hb-title{
    text-align:center;
    margin-bottom:30px;
    color:#d63384;
    font-weight:700;
}

.hb-role-box{
    display:flex;
    justify-content:center;
    gap:15px;
    margin-bottom:25px;
}

.hb-role-btn{
    border:none;
    padding:10px 25px;
    border-radius:30px;
    background:#f3e5f5;
    transition:0.3s;
    font-weight:600;
}

.hb-role-btn.active{
    background:linear-gradient(to right,#ff4d6d,#c77dff);
    color:white;
}

.hb-input-box{
    margin-bottom:20px;
}

.hb-input-box label{
    font-weight:600;
    margin-bottom:6px;
}

.hb-input{
    border-radius:15px;
    height:50px;
}

.hb-login-btn{
    width:100%;
    border:none;
    height:50px;
    border-radius:30px;
    background:linear-gradient(to right,#ff4d6d,#c77dff);
    color:white;
    font-size:18px;
    font-weight:600;
    transition:0.3s;
}

.hb-login-btn:hover{
    transform:scale(1.03);
}

.hb-register-link{
    text-align:center;
    margin-top:20px;
}

.hb-register-link a{
    text-decoration:none;
    color:#d63384;
    font-weight:600;
}

/* MOBILE */

@media(max-width:768px){

    .hb-login-container{
        flex-direction:column;
        width:95%;
    }

    .hb-left,
    .hb-right{
        width:100%;
    }

    .hb-left{
        height:220px;
    }
}

</style>

</head>
<body>

<!-- FLOATING CAKE EMOJIS -->

<div class="cake" style="left:5%; animation-duration:8s;">🎂</div>
<div class="cake" style="left:15%; animation-duration:12s;">🧁</div>
<div class="cake" style="left:25%; animation-duration:10s;">🍰</div>
<div class="cake" style="left:35%; animation-duration:14s;">🎂</div>
<div class="cake" style="left:45%; animation-duration:9s;">🧁</div>
<div class="cake" style="left:55%; animation-duration:13s;">🍰</div>
<div class="cake" style="left:65%; animation-duration:11s;">🎂</div>
<div class="cake" style="left:75%; animation-duration:15s;">🧁</div>
<div class="cake" style="left:85%; animation-duration:10s;">🍰</div>
<div class="cake" style="left:95%; animation-duration:12s;">🎂</div>

<div class="hb-login-container">

    <!-- LEFT -->
    <div class="hb-left">

        <div class="hb-overlay">

            <div>
                <h1>Hanna Bakes</h1>
                <p>Fresh Cakes • Sweet Moments • Pure Happiness</p>
            </div>

        </div>

    </div>

    <!-- RIGHT -->
    <div class="hb-right">

        <h2 class="hb-title">
            <i class="fa-solid fa-cake-candles"></i>
            Login
        </h2>

        <!-- USER / ADMIN OPTION -->
        <div class="hb-role-box">

            <button type="button"
            class="hb-role-btn active"
            id="userBtn"
            onclick="selectRole('user')">

                <i class="fa-solid fa-user"></i>
                User

            </button>

            <button type="button"
            class="hb-role-btn"
            id="adminBtn"
            onclick="selectRole('admin')">

                <i class="fa-solid fa-user-shield"></i>
                Admin

            </button>

        </div>

        <!-- LOGIN FORM -->
        <form action="LoginServlet" method="post">

            <input type="hidden"
            name="role"
            id="role"
            value="user">

            <div class="hb-input-box">

                <label>Email</label>

                <input type="email"
                name="email"
                class="form-control hb-input"
                placeholder="Enter Email"
                required>

            </div>

            <div class="hb-input-box">

                <label>Password</label>

                <input type="password"
                name="password"
                class="form-control hb-input"
                placeholder="Enter Password"
                required>

            </div>

            <button type="submit"
            class="hb-login-btn">

                Login

            </button>

        </form>

        <div class="hb-register-link">

            Don't have an account ?
            <a href="Register.jsp">Register</a>

        </div>

    </div>

</div>

<script>

function selectRole(role){

    document.getElementById("role").value = role;

    let userBtn =
    document.getElementById("userBtn");

    let adminBtn =
    document.getElementById("adminBtn");

    if(role === "user"){

        userBtn.classList.add("active");

        adminBtn.classList.remove("active");
    }
    else{

        adminBtn.classList.add("active");

        userBtn.classList.remove("active");
    }
}

</script>

</body>
</html>