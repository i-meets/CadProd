
<%@page import="util.Config"%>
<%@page import="java.sql.*" %>
<%@page import="com.mysql.jdbc.Driver" %>
<%@page import="util.Connection" %>

<% Config servidor = new Config().servidor; %>
<% System.out.println("#### "+servidor);%>



<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- Include the above in your HEAD tag -->

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/login.css" type="text/css">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<div class="main">


    <div class="container">
        <center>
            <div class="middle">
                <div id="login">

                    <form action="javascript:void(0);" method="get">

                        <fieldset class="clearfix">

                            <p ><span class="fa fa-user"></span><input type="email"  Placeholder="Email" required></p> <!-- JS because of IE support; better: placeholder="Username" -->
                            <p><span class="fa fa-lock"></span><input type="password"  Placeholder="Senha" required></p> <!-- JS because of IE support; better: placeholder="Password" -->

                            <div>
                                <span style="width:48%; text-align:left;  display: inline-block;"><a class="small-text" href="#">Recuperar senha
                                        password?</a></span>
                                <span style="width:50%; text-align:right;  display: inline-block;"><input type="submit" value="Login"></span>
                            </div>

                        </fieldset>
                        <div class="clearfix"></div>
                    </form>

                    <div class="clearfix"></div>

                </div> <!-- end login -->
                <div class="logo">VISONET

                    <div class="clearfix"></div>
                </div>

            </div>
        </center>
    </div>

</div>