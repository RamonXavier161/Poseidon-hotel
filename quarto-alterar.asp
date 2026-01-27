<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
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
    <!-- DataTables -->
  <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-fixedcolumns/css/fixedColumns.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <link rel="stylesheet" href="dist/css/hfb.css">
    <link rel="stylesheet" href="dist/css/style.css">


  <script language="JavaScript">

    function lancar() 
    {
      if(confirm('Deseja finalizar essa operação?'))
        document.form.action = "quarto-grava.asp";
      else
        return false;
    }
    </script>

</head>
<body class="<%response.Write(environment)%> hold-transition sidebar-mini layout-fixed sidebar-collapse">
<div class="wrapper">
  <%
  abre_conexao()
  
  sqlstmt = "select * from quartos where codigo=" & request("pid")
  set rsquery = conn.execute(sqlstmt)
  %>
  <!--#INCLUDE file="nav-interno.asp" -->
  <!--#INCLUDE file="aside.asp" -->

  
  <div class="content-wrapper" style="background-color: transparent;">


    <!-- Main content -->
    <section style="max-width: none; margin-top:3%;" class="content">
      <div class="container-fluid">
        <div class="card card-success">
          <div class="card-header" style="background-color: #18929d;">
            <h3 class="card-title">Alterar</h3>
          </div>
          <!-- /.card-header -->
          <form name="form" method="post">
            <input type="hidden" name="codigo" value="<%response.write request("pid")%>">
            <div class="card-body">
              <div class="col-md-12">
                <div class="row">      
                  <div class="col-md-3">
                      <label>Numero</label>
                      <input type="number" class="rcbfocus form-control" name="numero" value="<%response.write rsquery("numero")%>" />
                  </div>
                  <div class="col-md-3">
                      <label>Andar</label>
                      <input type="number" class="rcbfocus form-control" name="andar" value="<%response.write rsquery("andar")%>"/>
                  </div>
                  <div class="col-md-2">
                      <label>tipo</label>
                        <select class="form-control" name="tipo">
                            <option value="">-- Selecione o Perfil--</option>
                            <%
                            sqlstmt = "select codigo, descricao from tipo_quarto order by descricao"
                            set rsquery1 = conn.execute(sqlstmt)
                            
                            while not rsquery1.eof
                            %>
                              <option value="<%= rsquery1("codigo")%>"<% if rsquery("tipo") = rsquery1("codigo") then response.write "selected" end if %>><%= rsquery1("descricao")%></option>
                            <%
                            rsquery1.movenext
                            wend
                            %>
                        </select>  
                  </div>
                  <div class="col-md-2">
                    <label>Status</label>
                    <select class="form-control" name="status" id="statusQuarto" 
                        data-selecionado="<%= rsquery("status") %>">
                        <option value="">selecione</option>
                    </select>
                  </div>
                  <div class="col-md-1" style="top: 30px;"  align="right">
                      <button onclick="lancar();" class="btn btn-info">Alterar</button>
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
<script src="dist/js/script.js"></script>


<%
fecha_conexao()
%>
</body>
</html>