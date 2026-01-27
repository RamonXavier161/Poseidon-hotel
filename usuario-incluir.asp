<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#INCLUDE file="db.asp" -->
<!--#INCLUDE file="anti-cache.asp" -->
<!DOCTYPE HTML>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>POSEIDON</title>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="plugins/fonts-googleapis/fonts.googleapis.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- Select2 -->
<link rel="stylesheet" href="plugins/select2/css/select2.min.css">
<link rel="stylesheet" href="plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
<!-- BS Stepper -->
<link rel="stylesheet" href="plugins/bs-stepper/css/bs-stepper.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<link rel="stylesheet" href="dist/css/hfb.css">

<link rel="stylesheet" href="dist/css/hfb.css">
<link rel="stylesheet" href="dist/css/style.css">

</head>
<body class="<%response.Write(environment)%> hold-transition sidebar-mini layout-fixed sidebar-collapse">
<div class="wrapper">
    <%
    abre_conexao()
    %>

    <!--#INCLUDE file="nav-interno.asp" -->
    <!--#INCLUDE file="aside.asp" -->

    <div class="content-wrapper" style="background-color: transparent;">
        <section class="content" style="margin-top:3%; max-width: none; margin-bottom: auto;">
            <div class="container-fluid">
                <div id="formPaciente" class="card card-success">
                    <div class="card-header" style=" background-color: #18929d;">
                        <h3 class="card-title">Inclusão</h3>
                        <div class="card-tools">
                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                <i class="fas fa-minus"></i>
                            </button>
                        </div>
                    </div>
                    <div class="card-body">
                        <!--#INCLUDE file="usuario-incluir-formulario.asp" -->
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>



<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>



<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Select2 -->
<script src="plugins/select2/js/select2.full.min.js"></script>
<!-- InputMask -->
<script src="plugins/moment/moment.min.js"></script>
<script src="dist/js/debug/form-debug.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- script com o ajax-->
<script src="plugins/sweetalert2/sweetalert2.all.min.js"></script>
<script src="dist/js/common.js"></script>
<script src="dist/js/usuario/usuario-incluir-formulario.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<% fecha_conexao() %>
</body>
</html>