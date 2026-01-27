<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#INCLUDE file="db.asp" -->
<!--#INCLUDE file="md5.asp" -->
<!--#INCLUDE file="alert.asp" -->

    <%
    ' Abrir conexão com o banco de dados
    abre_conexao()
    pega_data()

    ' Capturar valores do formulário
    nome = request.form("nome")
    email = request.form("email")
    senha = request.form("senha")
    cpf = request.form("cpf")
    cpf = Replace(Replace(cpf, ".", ""), "-", "")


    sqlstmt = "select idusuario from usuarios where email = '" & email & "'"
	'response.write sqlstmt
    set rsquery = conn.execute(sqlstmt)
	

    perfil = 1
    statu = "ATIVO"
	
	ususim = "não"
	if not rsquery.eof then
		ususim = "sim"
	end If

	
	if ususim = "não" then


        sqlstmt = "insert into usuarios (status, nome, email, senha, perfil, cpf, data_cadastro, hora_cadastro) values ('" & statu & "', '" & nome & "', '" & email & "', '" & md5(senha) & "'," & perfil & ", '" & cpf & "',  '" & wDataAtual & "', '" & wHoraAtual & "')"
        'response.write sqlstmt
        conn.Execute sqlstmt

        AndGoTo "log.asp"
	
	else
	
			response.write "<script>"
			response.write "window.alert('Usuário já cadastrado!');"
			response.write "window.history.go(-1);"
			response.write "</script>"
	
	end if

	' Fechar conexão com o banco de dados
    fecha_conexao()
%>
