<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="util.Conexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Statement st = null;
    ResultSet rs = null;

    String nomeUsuario = (String) session.getAttribute("nomeUsuario");
    String emailUsuario = (String) session.getAttribute("emailUsuario");
    String cpfUsuario = (String) session.getAttribute("cpfUsuario");
    String nivelUsuario = (String) session.getAttribute("nivelUsuario");
    String idUsuario = (String) session.getAttribute("idUsuario");
    String fotoUsuario = (String) session.getAttribute("fotoUsuario");

    if (nomeUsuario == null || !nivelUsuario.equals("admin")) {
        response.sendRedirect("../index.jsp");
    }
%>

<%
    //variaveis menu
    String pag = request.getParameter("pag");
    String menu1 = "cadprodutos";
    String menu2 = "listprodutos";
    String menu3 = "home";

%>

<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Painel Administrativo</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">

                    <div class="sidebar-brand-text mx-3">Painel Admin</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="#">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
                </li>


                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    GERAÇÃO
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
                        <i class="fas fa-fw fa-folder"></i>
                        <span> DUE 2.0 </span>
                    </a>
                    <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Opções de DUE</h6>
                            <a class="collapse-item" href="#">Elaborar Nova DUE</a>
                            <a class="collapse-item" href="#">Listar Geradas</a>
                            <div class="collapse-divider"></div>
                            <h6 class="collapse-header">Manutenção DUE:</h6>
                            <a class="collapse-item" href="#">Retificar DUE</a>
                            <a class="collapse-item" href="#">Cancelar DUE</a>
                        </div>
                    </div>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider">
                <!-- Heading -->
                <div class="sidebar-heading">
                    Tabelas básicas
                </div>

                <!-- Nav Item - Utilities Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                        <i class="fas fa-fw fa-wrench"></i>
                        <span>CLASSIFICAÇÃO</span>
                    </a>
                    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Opções de NCM:</h6>
                            <a class="collapse-item" href="#">Cadastrar NCM</a>
                            <a class="collapse-item" href="#">Listar NCM</a>
                            <a class="collapse-item" href="#">Validar NCM</a>
                            <a class="collapse-item" href="#">Importação Tabela NCM</a>

                            <h6 class="collapse-header">Opções de Atributos:</h6>
                            <a class="collapse-item" href="#">Cadastrar Atributo</a>
                            <a class="collapse-item" href="#">Listar Atributos</a>
                            <a class="collapse-item" href="#">Validar Atributo</a>
                            <a class="collapse-item" href="#">Importação Tabela Atributos</a>
                        </div>
                    </div>
                </li>
                
                  <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"aria-expanded="true" aria-controls="collapse3">
                        <i class="fas fa-fw fa-table"></i> <!-- fa-cog-->
                        <span>OUTRAS TABELAS</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Opções de Operadores</h6>
                            <a class="collapse-item" href="index.jsp?pag=<%=menu1%>">Cadastrar</a>
                            <a class="collapse-item" href="index.jsp?pag=<%=menu2%>">Listar</a>
                        </div>
                         <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Países</h6>
                            <a class="collapse-item" href="index.jsp?pag=<%=menu1%>">Cadastrar</a>
                            <a class="collapse-item" href="index.jsp?pag=<%=menu2%>">Listar</a>
                        </div>
                    </div>
                </li>
                

                 <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Gráficos e Relatórios</span></a>
                </li>

                <!-- Nav Item - Tables -->
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Cadastro de Operador</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <!-- Topbar Search -->
                        <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group">
                                <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="button">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>
                                </div>
                            </div>
                        </form>

                        <!-- Topbar Navbar
                        -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>

                            <!-- Nav Item - Alerts -->
                            <li class="nav-item dropdown no-arrow mx-1">
                                <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-bell fa-fw"></i>
                                    <!-- Counter - Alerts -->
                                    <span class="badge badge-danger badge-counter">3+</span>
                                </a>
                                <!-- Dropdown - Alerts -->
                                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                                    <h6 class="dropdown-header">
                                        Suas pendências
                                    </h6>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-primary">
                                                <i class="fas fa-file-alt text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">Outubro, 2021</div>
                                            <span class="font-weight-bold">Levantamento de necessidades de compra de matéria prima</span>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-success">
                                                <i class="fas fa-donate text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">Dezembro, 2021</div>
                                            Atualização da tabela de preços, clinte final.
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-warning">
                                                <i class="fas fa-exclamation-triangle text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">Janeiro, 2022</div>
                                            Implantação de novo método de obtenção de dados cadastrais, cliente final.
                                        </div>
                                    </a>
                                    <a class="dropdown-item text-center small text-gray-500" href="#">Ver todas as pendências</a>
                                </div>
                            </li>

                            <!-- Nav Item - Messages -->
                            <li class="nav-item dropdown no-arrow mx-1">
                                <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-envelope fa-fw"></i>
                                    <!-- Counter - Messages -->
                                    <span class="badge badge-danger badge-counter">7</span>
                                </a>
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                                    <h6 class="dropdown-header">
                                        Message Center
                                    </h6>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
                                            <div class="status-indicator bg-success"></div>
                                        </div>
                                        <div class="font-weight-bold">
                                            <div class="text-truncate">Olá, poderia realizar o cadastro do novo usuário do RH?</div>
                                            <div class="small text-gray-500">Emily Soares · 58m</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
                                            <div class="status-indicator"></div>
                                        </div>
                                        <div>
                                            <div class="text-truncate">Oi, preciso de liberação na tela de importação de NCM!</div>
                                            <div class="small text-gray-500">Julio Moraes · 1d</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
                                            <div class="status-indicator bg-warning"></div>
                                        </div>
                                        <div>
                                            <div class="text-truncate">Olá, estou com problemas na tela de cadastro de produto!</div>
                                            <div class="small text-gray-500">Priscila Oliveira · 2d</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
                                            <div class="status-indicator bg-success"></div>
                                        </div>
                                        <div>
                                            <div class="text-truncate">Me ligar assim que ver essa mensagem!</div>
                                            <div class="small text-gray-500">Edgar Schneider  · 1a</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item text-center small text-gray-500" href="#">Ver todas as mensagens</a>
                                </div>
                            </li>

                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=nomeUsuario%></span>
                                    <img class="img-profile rounded-circle" src="../profiles/<%=fotoUsuario%>.png">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="" data-toggle="modal" data-target="#ModalPerfil">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Editar Perfil
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Configurações
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Opções do Admin
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="logout.jsp">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>

                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->



                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <% if (pag == null) {%>
                        <jsp:include page="home.jsp"/>

                        <%} else if (pag.equals(menu1)) {%>                             
                        <jsp:include page='<%=menu1 + ".jsp"%>'/> 
                        <%} else if (pag.equals(menu2)) {%>                             
                        <jsp:include page='<%=menu2 + ".jsp"%>'/> 
                        <%} else {%>
                        <jsp:include page="home.jsp"/> 
                        <% }
                        %>
                    </div>

                    <!--  Modal Perfil-->
                    <div class="modal fade" id="ModalPerfil" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Editar Perfil</h5>
                                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <%
                                    //AQUI O SISTEMA REALIZARIA UM SELECT DOS ATRIBUTOS DO USUÁRIO, MÁS ESTOU BUSCANDO AS INFORMAÇÕES PELO SESSION,
//                                    REALIZANDO ASSIM, SOMENTE UM SELECT NO BANCO
//                                    try {
//                                        st = new Conexao().conectar().createStatement();
//                                        rs = st.executeQuery("SELEC * FROM usuarios WHERE id =" + idUsuario + ";");
//                                    } catch (Exception e) {
//                                        
//                                    }
//

                                %>


                                <form id="form-perfil" method="POST" enctype="multipart/form-data">
                                    <div class="modal-body">

                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label >Nome</label>
                                                    <input value="<%=nomeUsuario%>" type="text" class="form-control" id="nome" name="nome" placeholder="Nome">
                                                </div>

                                                <div class="form-group">
                                                    <label >CPF</label>
                                                    <input value="<%=cpfUsuario%>" type="text" class="form-control" id="cpf" name="cpf" placeholder="CPF">
                                                </div>

                                                <div class="form-group">
                                                    <label >Email</label>
                                                    <input value="<%=emailUsuario%>" type="email" class="form-control" id="email" name="email" placeholder="Email" disabled="">
                                                </div>

                                                <div class="form-group">
                                                    <label >Senha</label>
                                                    <input value="" type="password" class="form-control" id="text" name="senha" placeholder="Senha">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="col-md-6 form-group">
                                                    <label>Foto</label>
                                                    <input value="<%=fotoUsuario%>" type="file" class="form-control-file" id="imagem" name="imagem[]" onchange="carregarImg();">

                                                </div>
                                                <div class="col-md-6 mb-2">
                                                    <img src="../profiles/<%=fotoUsuario%>.png" alt="Carregue sua Imagem" id="target" width="250" height="250">
                                                </div>
                                            </div>
                                        </div> 

                                        <small>
                                            <div id="mensagem" class="mr-4">

                                            </div>
                                        </small>

                                    </div>
                                    <div class="modal-footer">

                                        <input value="<%=idUsuario%>" type="hidden" name="txtid" id="txtid">
                                        <input value="<%=cpfUsuario%>" type="hidden" name="antigo" id="antigo">

                                        <button type="button" id="btn-fechar" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                        <button type="submit" name="btn-salvar" id="btn-salvar-perfil" class="btn btn-primary">Salvar</button>
                                    </div>
                                </form>


                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>



        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/chart-area-demo.js"></script>
        <script src="js/demo/chart-pie-demo.js"></script>

    </body>
</html>

<!--SCRIPT PARA SUBIR IMAGEM PARA O SERVIDOR -->
<script type="text/javascript">

                                                        function carregarImg() {

                                                            var target = document.getElementById('target');
                                                            var file = document.querySelector("input[type=file]").files[0];
                                                            var reader = new FileReader();

                                                            reader.onloadend = function () {
                                                                target.src = reader.result;
                                                            };

                                                            if (file) {
                                                                reader.readAsDataURL(file);


                                                            } else {
                                                                target.src = "";
                                                            }
                                                        }

</script>

<!--AJAX PARA INSERÇÃO E EDIÇÃO DOS DADOS COM IMAGEM -->
<script type="text/javascript">
    $("#form-perfil").submit(function () {

        event.preventDefault();
        var formData = new FormData(this);

        $.ajax({
            url: "editar-perfil.jsp",
            type: 'POST',
            data: formData,

            success: function (mensagem) {

                $('#mensagem').removeClass()

                if (mensagem.trim() == "Salvo com Sucesso!!") {
                    $('#mensagem').addClass('text-success');
                    //$('#nome').val('');
                    //$('#cpf').val('');
                    $('#btn-fechar').click();
                    window.location = "index.jsp";

                } else {

                    $('#mensagem').addClass('text-danger')
                }

                $('#mensagem').text(mensagem)

            },

            cache: false,
            contentType: false,
            processData: false,
            xhr: function () {  // Custom XMLHttpRequest
                var myXhr = $.ajaxSettings.xhr();
                if (myXhr.upload) { // Avalia se tem suporte a propriedade upload
                    myXhr.upload.addEventListener('progress', function () {
                        /* faz alguma coisa durante o progresso do upload */
                    }, false);
                }
                return myXhr;
            }
        });
    });
</script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
<!-- MASCARA QUE REALIZA A FORMATAÇÃO DOS CAMPOS. EX. CPF: 033.155.699-35 -->
<script src="../js/mascara.js"></script>
