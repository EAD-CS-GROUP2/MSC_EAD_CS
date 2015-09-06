<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>FMS</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
    <%--<link rel="stylesheet" href="../resources/css/msc-stylesheet.css">--%>

    <!-- Optional theme -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css">



    <!-- Custom styles for this template -->
    <style>

        .fade {
            opacity: 0;
            -webkit-transition: opacity 0.15s linear;
            -moz-transition: opacity 0.15s linear;
            -o-transition: opacity 0.15s linear;
            transition: opacity 0.15s linear;
        }
        .fade.in {
            opacity: 1;
        }

        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #eee;
        }

        .form-signin {
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }
        .form-signin .form-signin-heading,
        .form-signin .checkbox {
            margin-bottom: 10px;
        }
        .form-signin .checkbox {
            font-weight: normal;
        }
        .form-signin .form-control {
            position: relative;
            font-size: 16px;
            height: auto;
            padding: 10px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        .form-signin .form-control:focus {
            z-index: 2;
        }
        .form-signin input[type="text"] {
            margin-bottom: -1px;
            border-bottom-left-radius: 0;
            border-bottom-right-radius: 0;
        }
        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>

</head>

<body>

<div class="container">


        <!-- Main component for a primary marketing message or call to action -->
        <div class="jumbotron">
            <h1>FMS - Back Office</h1>
            <p><span class="glyphicon glyphicon-thumbs-up"></span> Freight Tracking Simplified!</p>
            <p align="right"><a href="${pageContext.request.contextPath}/portal"><< FMS Customer Portal</a></p>
        </div>


    <%--<c:if test="${not empty errorLogin}">--%>
        <%--<div class="alert alert-danger">${errorLogin}</div>--%>
    <%--</c:if>--%>


    <form class="form-signin"  commandName="login" action="j_spring_security_check" method="POST">
    <%--<form class="form-signin" method="POST" commandName="login">--%>
        <h2 class="form-signin-heading">Please sign in</h2>

        <input required name="j_username" type="text" class="form-control" placeholder="Username" autofocus>
        <input required name="j_password" type="password" class="form-control" placeholder="Password">
        <label class="checkbox">
            <input type="checkbox" value="remember-me"> Remember me
        </label>

        <div id="myAlert" class="alert alert-danger fade" role="alert" data-alert="alert">Invalid username or password.</div>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    </form>

</div> <!-- /container -->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {

        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                    results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }

        var loginSuccess = getParameterByName('auth');
        console.log(loginSuccess);
        if (loginSuccess == "fail"){
            showAlert();
            console.log(loginSuccess);
        } else{
            $('#myAlert').hide();
        }

        function showAlert() {
            $("#myAlert").addClass("in");

        }

    });
</script>
</body>
</html>
