<!--#INCLUDE file="db.asp" -->
<%
Abre_conexao()
session.Abandon()
Response.Redirect "index.asp"

%>
