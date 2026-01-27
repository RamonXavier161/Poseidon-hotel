<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#INCLUDE file="db.asp" -->
<!--#INCLUDE file="md5.asp" -->

<%
pUsuario = request.form("usuario")
pSenha = request.form("senha")

'response.write "Usuario:" & pUsuario & " senha:" & pSenha 


	Abre_conexao()

	pUsuario = replace(pUsuario,"select","")
	pUsuario = replace(pUsuario,"insert","")
	pUsuario = replace(pUsuario,"update","")
	pUsuario = replace(pUsuario,"delete","")
	pSenha = replace(pSenha,"select","")
	pSenha = replace(pSenha,"insert","")
	pSenha = replace(pSenha,"update","")
	pSenha = replace(pSenha,"delete","")

	sqlstmt = "select * from usuarios as U "
	sqlstmt = sqlstmt & " where nome ='" & pUsuario & "' and senha='" & md5(pSenha) & "' and status='ATIVO'"
	'response.write sqlstmt
	'response.write "<BR>" & md5(pSenha)
	set rsquery = conn.execute(sqlstmt) 



		if rsquery.eof then
			erro = "sim"
		%> 
			<script language="javascript">      
				window.alert ("Usuário e/ou senha não encontrada!");
				window.history.go(-1);
			</script>
		<%
		else

			Session.Timeout = 1440
			Session("codigo") = rsquery("idusuario")
			Session("nome") = rsquery("nome")
			Session("email") = rsquery("email")
			Session("perfil") = rsquery("perfil")

			if erro <> "sim" then
				response.redirect("home.asp")
			end if
		end if


fecha_conexao()
%>
