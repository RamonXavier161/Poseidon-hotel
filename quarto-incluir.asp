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

    function lancarQuarto() 
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
  %>
  <!--#INCLUDE file="nav-interno.asp" -->
  <!--#INCLUDE file="aside.asp" -->
    <div class="content-wrapper" style="background-color: transparent;">
        <section style="max-width: none; margin-top:3%;" class="content">
            <div class="container-fluid">
                <div class="card card-success">
                    <div class="card-header" style="background-color: #18929d;">
                        <h3 class="card-title">Incluir</h3>
                    </div>
                    <form name="form" method="post">
                        <div class="card-body">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label>Numero</label>
                                        <input type="number" class="rcbfocus form-control" name="numero" />
                                    </div>
                                    <div class="col-md-3">
                                        <label>Andar</label>
                                        <input type="number" class="rcbfocus form-control" name="andar" />
                                    </div>
                                    <div class="col-md-2">
                                        <label>tipo</label>
                                        <select required class="form-control" name="tipo">
                                            <option></option>
                                            <%
                                            sqlstmtL = "select codigo, descricao from tipo_quarto order by descricao"
                                            set rsqueryL = conn.execute(sqlstmtL)
                                            
                                            while not rsqueryL.eof
                                            %>
                                                <option value="<%response.write rsqueryL("codigo")%>"> <%response.write rsqueryL("descricao")%></option>
                                            <%
                                            rsqueryL.movenext
                                            wend
                                            %>
                                        </select>
                                    </div>
                                    <div class="col-md-2">
                                        <label>Status</label>
                                        <select class="rcbfocus form-control" required name="status" id="statusQuarto">
                                            <option value="">selecione</option>
                                        </select>
                                    </div>
                                    <div class="col-md-2" style="top: 30px;"  align="right">
                                        <button onclick="lancarQuarto();" class="btn btn-info">Alterar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
</div>
    <script src="dist/js/script.js"></script>

<%
fecha_conexao()
%>
</body>
</html>