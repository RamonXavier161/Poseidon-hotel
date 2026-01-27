<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#INCLUDE file="db.asp"-->
<%
Response.ContentType = "text/plain"
abre_conexao()

Dim email, sqlstmt, rsquery
email = Request.Form("email")
email = replace(email,".","")
email = replace(email,"","")

sqlstmt = "SELECT idusuario FROM usuarios WHERE email = '" & email & "'"
Set rsquery = conn.Execute(sqlstmt)

If Not rsquery.EOF Then
    Response.Write rsquery("idusuario")
Else
    Response.Write "NAO_ENCONTRADO"
End If

fecha_conexao()
%>
