<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
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
  <!-- DataTables -->
  <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-fixedcolumns/css/fixedColumns.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <link rel="stylesheet" href="dist/css/hfb.css">
  <link rel="stylesheet" href="dist/css/style.css">

</head>

	<body class="<%response.Write(environment)%> hold-transition sidebar-mini layout-fixed sidebar-collapse">
    <div class="wrapper">
      <% abre_conexao() %>
        <!--#INCLUDE file="nav-interno.asp" -->
        <!--#INCLUDE file="aside.asp" -->

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper" style="background-color: transparent;">
			<!-- Content Header (Page header) -->
			<section class="content-header" style="max-width: none; margin-bottom: auto;">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-12" align="right">
						  <form action="perfil-incluir.asp" method="post">
							<button type="submit" class="btn btn-info">Incluir</button>
						  </form>
						</div>
					</div>
				</div>
			</section>

			<!-- Main content -->
			<section style="max-width: none;" class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<div class="card card-success">
								<div class="card-header" style="background-color: #18929d;">
									<h3 class="card-title">Usuário</h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                    <tr>
                      <th>Perfil</th>
                      <th>DETALHES</th>
                    </tr>
                  </thead>
                  <tbody>
                    <%
                    sqlstmt = "SELECT  codigo, perfil, status  FROM perfil ORDER BY perfil "
                    set rsquery = conn.execute(sqlstmt)
                    
                    while not rsquery.eof
                    
											if rsquery("status") = "ATIVO" then
											cor = "green"
											statu = "INATIVO"
											else
											cor = "red"
											statu = "ATIVO"
											end if
                    
                    %>
                    <tr>
                    <td><%response.write rsquery("perfil")%></td>
                    <td>
                      <a href="perfil-alterar.asp?pid=<%response.write rsquery("codigo")%>"><i class="fas fa-edit"></i></a>
                    	<a href="perfil-grava.asp?pid=<%response.write rsquery("codigo")%>&status=<%response.write statu%>" style="color:<%response.write cor%>;"><i class="fas fa-circle"></i></a>
                    </td>
                    </tr>
                    <%
                    rsquery.movenext
                    Response.Flush
                    Response.clear
                    wend
                    %>
                  </tbody>
                </table>
								</div>
								<!-- /.card-body -->
							</div>
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
        </div>
        <!-- /.content-wrapper -->


  <% fecha_conexao() %>

  <aside class="control-sidebar control-sidebar-dark"></aside>
        
</div>


  <!-- jQuery -->
  <script src="plugins/jquery/jquery.min.js"></script>
  <!-- Bootstrap 4 -->
  <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- DataTables  & Plugins -->
  <script src="plugins/datatables/jquery.dataTables.min.js"></script>
  <script src="plugins/datatables-fixedcolumns/js/dataTables.fixedColumns.min.js"></script>
  <script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
  <script src="plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
  <script src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
  <script src="plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
  <script src="plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
  <script src="plugins/jszip/jszip.min.js"></script>
  <script src="plugins/pdfmake/pdfmake.min.js"></script>
  <script src="plugins/pdfmake/vfs_fonts.js"></script>
  <script src="plugins/datatables-buttons/js/buttons.html5.min.js"></script>
  <script src="plugins/datatables-buttons/js/buttons.print.min.js"></script>
  <script src="plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
  <script src="dist/js/adminlte.min.js"></script>

</body>
</html>