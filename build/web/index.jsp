<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="util.*"%> 


<%
    Statement st = null;
    ResultSet rs = null;
%>

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

<link rel="shortcut icon" href="../img/favicon1.ico" type="image/x-icon">
<link rel="icon" href="../img/favicon1.ico" type="image/x-icon">
<div class="main">


    <div class="container">
        <center>
            <div class="middle">
                <div id="login">

                    <form action="" method="post">

                        <fieldset class="clearfix">

                            <p ><span class="fa fa-user"></span><input type="email" name="email" Placeholder="Email" required></p> <!-- JS because of IE support; better: placeholder="Username" -->
                            <p><span class="fa fa-lock"></span><input type="password" name="senha" Placeholder="Senha" required></p> <!-- JS because of IE support; better: placeholder="Password" -->

                            <div>
                                <span style="width:48%; text-align:left;  display: inline-block;"><a class="small-text" href="#">Recuperar
                                        Senha?</a></span>
                                <span style="width:50%; text-align:right;  display: inline-block;"><input type="submit" value="Logar"></span>
                            </div>

                            <p align="center" class="texto-alerta mt-2">
                                <%
                                    String email = request.getParameter("email");
                                    String senha = request.getParameter("senha");
                                    String nomeUsuario = "";
                                    String cpfUsuario = "";
                                    String nivelUsuario = "";
                                    String fotoUsuario = "";
                                    String idUsuario = "";
                                    String emailUsuario = "";

                                    String user = "", pass = "";
                                    int i = 0;

                                    try {

                                        st = new Conexao().conectar().createStatement();
                                        rs = st.executeQuery("SELECT * FROM usuarios where email = '" + email + "' and senha = '" + senha + "'");
                                        while (rs.next()) {
                                            idUsuario = rs.getString(1);
                                            nomeUsuario = rs.getString(2);
                                            cpfUsuario = rs.getString(3);
                                            user = rs.getString(4);
                                            emailUsuario = rs.getString(4);
                                            pass = rs.getString(5);
                                            nivelUsuario = rs.getString(6);
                                            fotoUsuario = rs.getString(7);
                                            rs.last();
                                            i = rs.getRow();
                                        }
                                    } catch (Exception e) {
                                        out.print(e);
                                    }

                                    if (email == null || senha == null) {
                                        out.println("Preencha os Dados");

                                    } else {

                                        if (i > 0) {
                                            session.setAttribute("nomeUsuario", nomeUsuario);
                                            session.setAttribute("cpfUsuario", cpfUsuario);
                                            session.setAttribute("nivelUsuario", nivelUsuario);
                                            session.setAttribute("fotoUsuario", fotoUsuario);
                                            session.setAttribute("idUsuario", idUsuario);
                                            session.setAttribute("emailUsuario", emailUsuario);

                                            //verifica o n?vel do usu?rio e redireciona para a pagina correta
                                            if (nivelUsuario.equals("admin")) {
                                                response.sendRedirect("painel-admin");
                                            }

                                            if (nivelUsuario.equals("corretor")) {
                                                response.sendRedirect("painel-corretor");
                                            }

                                            
                                            if (nivelUsuario.equals("tesoureiro")) {
                                                response.sendRedirect("painel-tesouraria");
                                            }

                                        } else {
                                            out.println("Dados Incorretos");
                                        }
                                    }


                                %> 
                            </p>

                        </fieldset>
                        <div class="clearfix"></div>
                    </form>

                    <div class="clearfix"></div>

                </div> <!-- end login -->
                <div class="logo">

                    <span class="d-none d-md-block">VISONET</span>

                    <div class="clearfix"></div>
                </div>

            </div>
        </center>
    </div>

</div>

