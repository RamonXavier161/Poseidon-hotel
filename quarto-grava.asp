<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#INCLUDE file="db.asp" -->
<!--#INCLUDE file="md5.asp" -->
<!--#INCLUDE file="alert.asp" -->

<%
	abre_conexao()
	pega_data()
    
	numero = request.form("numero")
	andar = request.form("andar")
	tipo = request.form("tipo")
	statu = request.form("status")
	descricao = request.form("descricao")
	valor = request.form("valor")
	capacidade = request.form("capacidade")

	if capacidade <> "" then

		sqlstmt = "INSERT INTO tipo_quarto (descricao, valor_diaria, capacidade) VALUES ('" & descricao & "', '" & valor & "', '" & capacidade & "')"	
		response.write sqlstmt

	else

		sqlstmt = "INSERT INTO quartos (numero, andar, tipo, status) VALUES ('" & numero & "', '" & andar & "', '" & tipo & "', '" & statu & "')"	
		response.write sqlstmt

	end if



	set rsquery = conn.execute(sqlstmt)

	if capacidade <> "" then
		AndGoTo  "quarto-tipo.asp"
	else
		AndGoTo  "quarto.asp"
	end if

		
	fecha_conexao()
%>
