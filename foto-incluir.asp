<%@LANGUAGE="VBSCRIPT"%>
<!--#INCLUDE file="db.asp" -->
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
  <!-- Select2 -->
  <link rel="stylesheet" href="plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
  <!-- BS Stepper -->
  <link rel="stylesheet" href="plugins/bs-stepper/css/bs-stepper.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <link rel="stylesheet" href="dist/css/hfb.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/dropzone@5/dist/min/dropzone.min.css">

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


    <!-- Main content -->
    <section style="max-width: none; margin-top:3%;" class="content">
      <div class="container-fluid">
        <div class="card card-success">
          <div class="card-header" style="background-color: #18929d;">
            <h3 class="card-title">Incluir</h3>
          </div>
          <!-- /.card-header -->
          <form action="http://localhost:3000/upload" method="POST" enctype="multipart/form-data">
            <div class="card-body">
              <div class="col-md-12">
                <div class="row">
                  <div class="col-md-3">
                     <label>NOME</label>
                    <input type="text" class="rcbfocus form-control" placeholder="Digite o nome" id="nome" name="nome_foto" />
                  </div>
                  <div class="col-md-2">
                    <label>QUARTO</label>
                    <select required class="form-control" id="quarto" name="quarto">
                        <option></option>
                        <%
                        sqlstmtL = "select codigo, numero from quartoS order by numero"
                        set rsqueryL = conn.execute(sqlstmtL)
                        
                        while not rsqueryL.eof
                        %>
                            <option value="<%response.write rsqueryL("codigo")%>"> <%response.write rsqueryL("numero")%></option>
                        <%
                        rsqueryL.movenext
                        wend
                        %>
                    </select>
                  </div>
                  <div class="col-md-4">
                    <label>FOTOS DO QUARTO</label>
                    <input type="file" name="fotos" class="form-control" multiple>

                  </div>
                  <div class="col-md-2">
                    <br>
                    <button type="submit" class="btn btn-success">Salvar Tudo</button>
                  </div>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </section>
  </div>

  <aside class="control-sidebar control-sidebar-dark"></aside>
  
</div>

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Select2 -->
<script src="plugins/select2/js/select2.full.min.js"></script>
<!-- InputMask -->
<script src="plugins/moment/moment.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- Custom HFB/GHC team specific script -->
<!-- Page specific script -->
<%
fecha_conexao()
%>
</body>
</html>