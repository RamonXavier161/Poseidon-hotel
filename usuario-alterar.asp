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
  <!-- Select2 -->
  <link rel="stylesheet" href="plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
  <!-- BS Stepper -->
  <link rel="stylesheet" href="plugins/bs-stepper/css/bs-stepper.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <link rel="stylesheet" href="dist/css/hfb.css">
  <link rel="stylesheet" href="dist/css/style.css">


    <!-- DataTables -->
  <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-fixedcolumns/css/fixedColumns.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
 
  


<script language="JavaScript">

function alteraPaciente() 
{
	const form = document.forms['paciente'];
		if (!form.checkValidity()) {
			form.reportValidity(); 
			return; 
		}

	showConfirmation({ 
		confirmText: "OK", 
		cancelText: "Cancelar", 
		confirmColor: "#28a745",
		title: "CONFIRMAÇÃO", 
		width: '500',
		html: "Deseja Alterar esses dados? Essa operação é irreversível.", 
		onConfirm: () => { 
							form.action = "usuario-incluir-grava.asp"; 
							form.submit(); 
						},
		onCancel: () => {} 
	});
}


</script>

</head>
<body class="<%response.Write(environment)%> hold-transition sidebar-mini layout-fixed sidebar-collapse">
<div class="wrapper">
  <%
  abre_conexao()

  sqlstmt = "select * from usuarios where idusuario=" & request("pid")
  set rsquery = conn.execute(sqlstmt)
  %>
  <!--#INCLUDE file="nav-interno.asp" -->
  <!--#INCLUDE file="aside.asp" -->

  <div class="content-wrapper" style="background-color: transparent;">

    <!-- Main content -->
    <section  style="max-width: none; margin-top:3%;" class="content">
		<div class="container-fluid">
			<div class="card card-success">
				<div class="card-header" style="background-color: #18929d;">
					<h3 class="card-title">Dados do paciente</h3>
				</div>
			   <%
				' Função para formatar o telefone
				Function formata(telefone)
				  ' Se telefone for Null, transforma em string vazia para evitar erro
					If IsNull(telefone) Then telefone = ""

					' Remove espaços extras
					telefone = Replace(telefone, " ", "")

					' Verifica se o telefone tem o formato correto (contando os números)
				    If Len(telefone) = 11 Then
						' Formata o telefone como (DDD) XXXXX-XXXX
						formata = "(" & Mid(telefone, 1, 2) & ") " & Mid(telefone, 3, 5) & "-" & Mid(telefone, 8, 4)
				    ElseIf Len(telefone) = 10 Then
						' Formata o telefone como (DDD) XXXX-XXXX
						formata = "(" & Mid(telefone, 1, 2) & ") " & Mid(telefone, 3, 4) & "-" & Mid(telefone, 7, 4)
					Else
						' Caso o número de telefone não tenha o formato esperado, retorna o telefone sem formatação
						formata = telefone
					End If
				End Function

				' Função para formatar o CPF
				Function FormatCPF(cpf)
					cpf = Replace(cpf, ".", "")
					cpf = Replace(cpf, "-", "")
					If Len(cpf) = 11 Then
						FormatCPF = Mid(cpf, 1, 3) & "." & Mid(cpf, 4, 3) & "." & Mid(cpf, 7, 3) & "-" & Mid(cpf, 10, 2)
					Else
						FormatCPF = cpf
					End If
				End Function
				  
				%>
				
				<!-- /.card-header -->
				<div class="card-body">
					<form name="paciente" method="post">
						<input type="hidden" name="codigo" value="<%response.write request("pid")%>">
						<div class="col-md-12 colum">
							<div class="row">
								<div class="col-md-5">
									<label>Usuario</label><br>
									<input type="text" class="rcbfocus form-control" placeholder="Digite o nome" required name="nome"  value="<%response.write rsquery("nome")%>">
								</div>
								<div class="col-md-2">
									<label for="cpf">CPF:</label>
									<input type="text" class="rcbfocus form-control"  id="cpf" required name="cpf" placeholder="XXX.XXX.XXX-XX"  oninput="formatarCPF(this)" value="<%response.write FormatCPF(rsquery("cpf"))%>">
								</div>
								<div class="col-md-2">
									<label>Sexo</label>
									<select type="text" class="rcbfocus form-control" id="sexo"  name="sexo" required > 
										<option value="">-- Selecione --</option>
										<option <% if rsquery("sexo") = "Feminino" then response.write "selected" end if %>>Feminino</option>
										<option <% if rsquery("sexo") = "Masculino" then response.write "selected" end if %>>Masculino</option>
									</select>
								</div>
								<div class="col-md-2">
									<label>Etnia</label>
									<select type="text" class="rcbfocus form-control" id="etnia"  name="etnia" required > 
										<option value="">-- Selecione --</option>
										<option <% if rsquery("etnia") = "PRETA" then response.write "selected" end if %>>PRETA</option>
										<option <% if rsquery("etnia") = "PARDA" then response.write "selected" end if %>>PARDA</option>
										<option <% if rsquery("etnia") = "BRANCA" then response.write "selected" end if %>>BRANCA</option>
										<option <% if rsquery("etnia") = "INDIGENA" then response.write "selected" end if %>>INDIGENA</option>
										<option value="AMARELA" <% if rsquery("etnia") = "AMARELA" then response.write "selected" end if %>>ASIÁTICA</option>
									</select>        
								</div>
							</div>
							<div class="row">
								<div class="col-md-2">
									<label>Nascimento</label><br>
									<div class="input-group">
										<div class="input-group-prepend">
										  <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
										</div>
										<input  id="data" class="form-control" name="data_nasc" oninput="formataDATA(this); atualizarIdade();" required value="<%response.write rsquery("data_nasc")%>">
									</div>
								</div>
								<div class="col-md-2">
									<label>Telefone de contato</label><br>
									<input  type="text" class="rcbfocus form-control" placeholder="Digite o Numero De Contato" required name="telefone" oninput="formatarTelefone(this)" value="<%response.write Formata(rsquery("telefone"))%>" >							
								</div>
								<div class="col-12 col-md-3 form-group">
									<label>E-MAIL</label>
									<input type="email" class="rcbfocus form-control" required name="email" id="email" readonly value="<%response.write rsquery("email")%>" placeholder="e-mail" />
								</div>
								<div class="col-md-2">
									<label>Perfil</label>
									<select class="form-control" name="perfil">
										<option value="">-- Selecione o Perfil--</option>
										<%
										sqlstmt = "select codigo, perfil from perfil order by perfil"
										set rsquery1 = conn.execute(sqlstmt)
										
										while not rsquery1.eof
										%>
										<option value="<%= rsquery1("codigo")%>"<% if rsquery("perfil") = rsquery1("codigo") then response.write "selected" end if %>><%= rsquery1("perfil")%></option>
										<%
										rsquery1.movenext
										wend
										%>
									</select>  
								</div>
							</div>               
						</div>
						<div class="col-md-12 colum" style="margin-top:35px;">
							<div class="row">
								<div class="col-md-3">
									<label>Endereço</label><br>
									<input type="text" class="rcbfocus form-control" placeholder="Digite a rua" name="rua" required oninput="permitirLetrasESpeciais(this)" value="<%response.write rsquery("endereco")%>">
								</div>
								<div class="col-md-2">
									<label>Número</label><br>
									<input type="number" class="rcbfocus form-control" placeholder="Digite o Numero Do endereço" required name="nm"  value="<%response.write rsquery("numero")%>">
								</div>
								<div class="col-md-3">
									<label>Complemento</label><br>
									<input type="text" class="rcbfocus form-control" placeholder="Digite o complemento" name="cp" oninput="permitirLetrasESpeciais(this)"  value="<%response.write rsquery("complemento")%>">
								</div>
								<div class="col-md-3">
									<label>Bairro</label><br>
									<input type="text" class="rcbfocus form-control" placeholder="Digite o bairro" name="br"  oninput="permitirLetrasESpeciais(this)" required value="<%response.write rsquery("bairro")%>">
								</div>
								<div class="col-md-3">
									<label>Cidade</label><br>
									<input type="text" class="rcbfocus form-control" placeholder="Digite a cidade" name="cd"  oninput="permitirLetrasESpeciais(this)" required value="<%response.write rsquery("cidade")%>">
								</div>
								<div class="col-md-2">
									<label>CEP</label><br>
									<input type="text" class="rcbfocus form-control" id="cep" name="cep" required placeholder="12345-678" oninput="formatarCEP(this)" value="<%response.write rsquery("cep")%>" >
								</div>
								<div class="col-md-3">
									<label>UF</label><br>
									<select class="form-control select2" name="uf" style="width: 30%;">
										<option <% if rsquery("uf") = "AC" then response.write "selected" end if %>>AC</option>
										<option <% if rsquery("uf") = "AL" then response.write "selected" end if %>>AL</option>
										<option <% if rsquery("uf") = "AP" then response.write "selected" end if %>>AP</option>
										<option <% if rsquery("uf") = "AM" then response.write "selected" end if %>>AM</option>
										<option <% if rsquery("uf") = "BA" then response.write "selected" end if %>>BA</option>
										<option <% if rsquery("uf") = "CE" then response.write "selected" end if %>>CE</option>
										<option <% if rsquery("uf") = "DF" then response.write "selected" end if %>>DF</option>
										<option <% if rsquery("uf") = "ES" then response.write "selected" end if %>>ES</option>
										<option <% if rsquery("uf") = "GO" then response.write "selected" end if %>>GO</option>
										<option <% if rsquery("uf") = "MA" then response.write "selected" end if %>>MA</option>
										<option <% if rsquery("uf") = "MT" then response.write "selected" end if %>>MT</option>
										<option <% if rsquery("uf") = "MS" then response.write "selected" end if %>>MS</option>
										<option <% if rsquery("uf") = "MG" then response.write "selected" end if %>>MG</option>
										<option <% if rsquery("uf") = "PA" then response.write "selected" end if %>>PA</option>
										<option <% if rsquery("uf") = "PB" then response.write "selected" end if %>>PB</option>
										<option <% if rsquery("uf") = "PR" then response.write "selected" end if %>>PR</option>
										<option <% if rsquery("uf") = "PE" then response.write "selected" end if %>>PE</option>
										<option <% if rsquery("uf") = "PI" then response.write "selected" end if %>>PI</option>
										<option <% if rsquery("uf") = "RJ" then response.write "selected" end if %>>RJ</option>
										<option <% if rsquery("uf") = "RN" then response.write "selected" end if %>>RN</option>
										<option <% if rsquery("uf") = "RS" then response.write "selected" end if %>>RS</option>
										<option <% if rsquery("uf") = "RO" then response.write "selected" end if %>>RO</option>
										<option <% if rsquery("uf") = "RR" then response.write "selected" end if %>>RR</option>
										<option <% if rsquery("uf") = "SC" then response.write "selected" end if %>>SC</option>
										<option <% if rsquery("uf") = "SP" then response.write "selected" end if %>>SP</option>
										<option <% if rsquery("uf") = "SE" then response.write "selected" end if %>>SE</option>
										<option <% if rsquery("uf") = "TO" then response.write "selected" end if %>>TO</option>
									</select>
								</div>
								<div class="col-md-3">
									<label>Placa do carro</label><br>
									<input type="text" class="rcbfocus form-control" name="car"  oninput="permitirLetrasESpeciais(this)" value="<%response.write rsquery("placacar")%>">
								</div>
							</div>
							<div class="row">
								<div class="col-md-12" style="margin-top:35px;">
									<div class="modal-footer">
										<button type="button" onclick="alteraPaciente();" class="btn btn-info">Alterar</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
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
<script src="dist/js/usuario/usuario-incluir-formulario.js"></script>
<script src="dist/js/common.js"></script>
<script src="plugins/sweetalert2/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script>

<%
fecha_conexao()
%>
</body>
</html>