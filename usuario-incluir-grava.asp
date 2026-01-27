<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#INCLUDE file="db.asp" -->
<!--#INCLUDE file="md5.asp" -->
<!--#INCLUDE file="alert.asp" -->
    
<%
	abre_conexao()
	pega_data()
    
	nome = trim(request.form("nome"))
	codigo = request.form("codigo")
	sexo = request.form("sexo")
	email = request.form("email")
	etnia = request.form("etnia")
	cpf = request.form("cpf")
	telefone = request.form("telefone")
	data_nasc = request.form("data_nasc")
	endereco = request.form("rua")
	numero = request.form("nm")
	complemento = request.form("cp")
	bairro = request.form("br")
	cidade = request.form("cd")
	uf = request.form("uf")
	cep = request.form("cep")
	car = request.form("car")
	perfil = request.form("perfil")
	if perfil = "" then
		perfil = 1
	End if
	statu = "ATIVO"

	if cpf = "" Then
	   cpf = 0
	End if
	
		' Limpeza de dados
		cpf = Replace(cpf, ".", "")
		cns = Replace(cns, ".", "")
		cpf = Replace(cpf, "-", "")
		telefone = Replace(telefone, "(", "")
		telefone = Replace(telefone, ")", "")
		telefone = Replace(telefone, "-", "")
		telefone = Replace(telefone, " ", "")

	if codigo = "" Then

		sqlstmt = "SELECT idusuario FROM usuarios WHERE email = '" & email & "'"
		set rsquery = conn.execute(sqlstmt)

		if rsquery.eof then

			sqlstmt = "INSERT INTO usuarios (" & _
			  "status, sexo, nome, cpf, email, placacar, telefone, etnia, data_nasc, perfil, endereco, " & _
			  "numero, complemento, bairro, cidade, uf, cep, data_cadastro, hora_cadastro " & _
			  
			  ") VALUES (" & _
			  "'" & statu & "', '" & sexo & "','" & nome & "', " & _
			  "'" & cpf & "', '" & email & "', '" & car & "', " & _
			  "'" & telefone & "', '" & etnia & "', " & _
			  "'" & data_nasc & "', " & perfil & "," & _
			  "'" & endereco & "', '" & numero & "', " & _
			  "'" & complemento & "', '" & bairro & "', " & _
			  "'" & cidade & "', '" & uf & "', '" & cep & "', " & _
			  "'" & wDataAtual & "','" & wHoraAtual & "')"

			set rsquery = conn.execute(sqlstmt)



			showAlertAndGoTo "Paciente cadastrado!", "usuario.asp"
		else

			showAlertAndGoTo "Paciente ja existe cadastrado!", "usuario.asp"


		End if
	else



	sqlstmt = "UPDATE usuarios SET " & _
			"nome='" & nome & "', sexo='" & sexo & "', " & _
			"etnia='" & etnia & "', cpf='" & cpf & "', perfil= " & perfil & ", " & _
			"data_nasc='" & data_nasc & "', telefone='" & telefone & "', " & _
			"endereco='" & endereco & "', numero=" & numero & ", " & _
			"complemento='" & complemento & "', bairro='" & bairro & "', " & _
			"cidade='" & cidade & "', uf='" & uf & "', " & _
			"cep='" & cep & "', placacar='" & car & "' WHERE idusuario=" & codigo


    	set rsquery = conn.execute(sqlstmt)

		showAlertAndGoTo "Dados alterados!", "usuario.asp"

	end if
		
	fecha_conexao()
%>
