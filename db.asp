<!--#INCLUDE file="environment.asp" -->
<%
Dim conn
Dim wDataAtual, wHoraAtual, wHoraAtualCompleta, wDataAtualInvertida, wIPAtual, wDataAtualTraco, wHoraAtualTraco, wDataAtualInvertidaTraco

function abre_conexao()


pagina = Request.ServerVariables("SCRIPT_NAME")
pagina = Mid(pagina, InStrRev(pagina, "/") + 1)


if session("nome") = "" AND pagina <> "login.asp" then 'VERIFICA SE USUÁRIO ESTÁ ATIVO
		response.redirect "index.asp"
end if


set conn = server.createobject("adodb.connection") '- abre a conexao com a DLL de acesso aos dados
	conn.Open "Driver={MySQL ODBC 8.4 ANSI Driver};" & _
	"DATABASE=" + configData("DATABASE") & _
	";SERVER=" + configData("server") & _
	";UID=" + configData("UID") & _
	";PASSWORD=" + configData("password")
Conn.CommandTimeout = 2000

end function


function fecha_conexao()
Conn.close
set Conn = nothing
end function


sub pega_data()
	Data = Now()
	Hora = Hour(Data)
	Hora = Right("0" & Hora, 2)
	Min = Minute(Data)
	Min = Right("0" & Min, 2)
	wHoraAtual = Hora & ":" & Min
	Segundo = Second(Data)
	wHoraAtualCompleta = Hora & ":" & Min & ":" & Segundo

	sData = Date()
	sData = Split(sData, "/", -1, 1)
	sData(0) = Right("0" & sData(0), 2)
	sData(1) = Right("0" & sData(1), 2)
	wDataAtual = sData(0) & "/" & sData(1) & "/" & sData(2)
	wDataAtualInvertida = sData(2) & "/" & sData(1)& "/" & sData(0)
	
	wIPAtual=Request.ServerVariables("REMOTE_ADDR")
end sub	

sub pega_data_com_traco()
	Data = Now()
	Hora = Hour(Data)
	Hora = Right("0" & Hora, 2)
	Min = Minute(Data)
	Min = Right("0" & Min, 2)
	Segundo = Second(Data)
	wHoraAtualTraco = Hora & ":" & Min & ":" & Segundo 

	sData = Date()
	sData = Split(sData, "/", -1, 1)
	sData(0) = Right("0" & sData(0), 2)
	sData(1) = Right("0" & sData(1), 2)
	wDataAtualTraco = sData(0) & "-" & sData(1) & "-" & sData(2)
	wDataAtualInvertidaTraco = sData(2) & "-" & sData(1)& "-" & sData(0)
	
	wIPAtualTraco=Request.ServerVariables("REMOTE_ADDR")
end sub	

%>