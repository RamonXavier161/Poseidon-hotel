<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#INCLUDE file="db.asp" -->
<!--#INCLUDE file="alert.asp" -->
<%
	abre_conexao()
		
		codigo = request.form("codigo")
		if codigo = "" then
			codigo = request("pid")
		end if
		perfil = request.form("perfil")
		statu = request("status")
		
		if codigo = "" And perfil <> "" then  
		statu = "ATIVO"

		sqlstmt = "insert into perfil (perfil, status) values ( '" & perfil & "', '" & statu & "')"
        'response.write sqlstmt
        conn.Execute sqlstmt

		else
			
			if statu <> "" then
				sqlstmt = "UPDATE perfil SET status='" & statu & "' WHERE codigo=" & codigo
			else
				sqlstmt = "UPDATE perfil SET perfil ='" & perfil & "' WHERE codigo= " & codigo
			end if
			'response.write sqlstmt & "<br>"

			conn.execute sqlstmt


		end if


		showAlertAndGoTo "Alterado com sucesso!", "perfil.asp"		

	fecha_conexao()
%>
