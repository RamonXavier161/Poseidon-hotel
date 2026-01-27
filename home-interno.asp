<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
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
  <!-- BS Stepper -->
  <link rel="stylesheet" href="plugins/bs-stepper/css/bs-stepper.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <link rel="stylesheet" href="dist/css/hfb.css">
    <link rel="stylesheet" href="dist/css/style.css">

<style>
.aviso-importante {
  position: absolute;
  top: 10%;
  left: 30%;
  width: 40%;
  background-color: white; /* Fundo branco semi-transparente */
  padding: 20px;
  border-radius: 8px;
  font-family: Arial, sans-serif;
  box-shadow: 0 0 10px rgba(0,0,0,0.2);
}
</style>
</head>
<body class=" <% response.Write(environment) %> hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
  <%
  abre_conexao()
  %>
  <!--#INCLUDE file="nav-interno.asp" -->
  <!--#INCLUDE file="aside.asp" -->

<div class="home-content-wrapper" style="position: relative;">
  <div class="background-farmacia-container">
    <img class="background-farmacia-img" src="dist/img/emergencia.jpg" >
  </div>


</div>

    <aside class="control-sidebar control-sidebar-dark"></aside>
</div>

<script src="plugins/jquery/jquery.min.js"></script>
<script src="plugins/sweetalert2/sweetalert2.all.min.js"></script>
<script src="dist/js/common.js"></script>
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="dist/js/adminlte.min.js"></script>

<%
fecha_conexao()
%>
</body>
</html>s