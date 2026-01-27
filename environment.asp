<%
    ' Função para carregar o XML principal (environment.xml) e retornar o ambiente atual
    Function LoadCurrentEnvironment()
        Dim xmlDoc, environment, node

        ' Criar objeto MSXML para ler e carregar o XML
        Set xmlDoc = Server.CreateObject("MSXML2.DOMDocument")

        ' Carregar o arquivo XML environment.xml
        xmlDoc.Load(Server.MapPath("./environment/environment.xml"))

        ' Verifica se o XML foi carregado corretamente
        If xmlDoc.ParseError.ErrorCode <> 0 Then
            Response.Write "Erro ao carregar environment.xml: " & xmlDoc.ParseError.Reason
            LoadCurrentEnvironment = ""  ' Retorna uma string vazia em caso de erro
        Else
            ' Tenta acessar o nó <current> que contém o nome do ambiente (dev ou prod)
            Set node = xmlDoc.selectSingleNode("/settings/current")
            
            ' Verifica se o nó foi encontrado
            If Not node Is Nothing Then
                environment = node.Text ' Extrai o valor do nó (dev ou prod)
                LoadCurrentEnvironment = environment
            Else
                Response.Write "O nó <current> não foi encontrado."
                LoadCurrentEnvironment = ""  ' Retorna uma string vazia se o nó não for encontrado
            End If
        End If

        ' Libera o objeto XML
        Set xmlDoc = Nothing
    End Function

    ' Função para carregar as configurações do ambiente específico (dev ou prod)
    Function LoadEnvironmentConfig(environment, ByRef configData)
        Dim xmlDoc, node

        ' Definir o arquivo XML a ser carregado com base no ambiente
        Dim configFile
        If environment = "development" Then
            configFile = "environment_development.xml"
        ElseIf environment = "homologation" Then
            configFile = "environment_homologation.xml"
        ElseIf environment = "production" Then
            configFile = "environment_production.xml"
        ElseIf environment = "local" Then
            configFile = "environment_local.xml"
        Else
            LoadEnvironmentConfig = ""  ' Retorna uma string vazia caso o ambiente não seja válido
            Exit Function
        End If

        ' Criar objeto MSXML para ler o XML de configuração
        Set xmlDoc = Server.CreateObject("MSXML2.DOMDocument")

        ' Carregar o arquivo XML do ambiente específico
        xmlDoc.Load(Server.MapPath("./environment/" & configFile))

        ' Verifica se o XML foi carregado corretamente
        If xmlDoc.ParseError.ErrorCode <> 0 Then
            Response.Write "Erro ae carregar " & configFile & ": " & xmlDoc.ParseError.Reason
            LoadEnvironmentConfig = ""  ' Retorna uma string vazia em caso de erro
        Else
            ' Extrair as variáveis do ambiente
            Set node = xmlDoc.selectSingleNode("/environment/DATABASE")
            If Not node Is Nothing Then configData("DATABASE") = node.Text

            Set node = xmlDoc.selectSingleNode("/environment/UID")
            If Not node Is Nothing Then configData("UID") = node.Text

            Set node = xmlDoc.selectSingleNode("/environment/password")
            If Not node Is Nothing Then configData("password") = node.Text

            Set node = xmlDoc.selectSingleNode("/environment/server")
            If Not node Is Nothing Then configData("server") = node.Text

            LoadEnvironmentConfig = "Success"  ' Retorna um valor indicando sucesso
        End If

        ' Libera o objeto XML
        Set xmlDoc = Nothing
    End Function

    Function LoadNodeJSPath(environment, ByRef configData)
        Dim xmlDoc, node

        ' Definir o arquivo XML a ser carregado com base no ambiente
        Dim configFile
        If environment = "development" Then
            configFile = "environment_development.xml"
        ElseIf environment = "homologation" Then
            configFile = "environment_homologation.xml"
        ElseIf environment = "production" Then
            configFile = "environment_production.xml"
        ElseIf environment = "local" Then
            configFile = "environment_local.xml"
        Else
            ' Caso o ambiente não seja válido, retornamos erro
            LoadNodeJSPath = ""  ' Retorna uma string vazia
            Exit Function
        End If

        ' Criar objeto MSXML para ler o XML de configuração
        Set xmlDoc = Server.CreateObject("MSXML2.DOMDocument")

        ' Carregar o arquivo XML do ambiente específico
        xmlDoc.Load(Server.MapPath("./environment/" & configFile))

        ' Verifica se o XML foi carregado corretamente
        If xmlDoc.ParseError.ErrorCode <> 0 Then
            Response.Write "Erro au carregar " & configFile & ": " & xmlDoc.ParseError.Reason
            LoadNodeJSPath = ""  ' Retorna uma string vazia em caso de erro
        Else
            ' Extrair a variável WebSocketUri
            Set node = xmlDoc.selectSingleNode("/environment/NodeJS/WebSocketUri")
            If Not node Is Nothing Then configData("WebSocketUri") = node.Text

            ' Extrair a variável WebSocketUri
            Set node = xmlDoc.selectSingleNode("/environment/NodeJS/HttpEndpoint")
            If Not node Is Nothing Then configData("HttpEndpoint") = node.Text
            
            ' Extrair a variável LogsEndpoint
            Set node = xmlDoc.selectSingleNode("/environment/NodeJS/LogsEndpoint")
            If Not node Is Nothing Then configData("LogsEndpoint") = node.Text

            Set node = xmlDoc.selectSingleNode("/environment/Python/PyClientAgent")
            If Not node Is Nothing Then configData("PyClientAgent") = node.Text

            Set node = xmlDoc.selectSingleNode("/environment/Python/ChamadaPorVoz")
            If Not node Is Nothing Then configData("ChamadaPorVoz") = node.Text

            LoadNodeJSPath = "Success"  ' Retorna um valor indicando sucesso
        End If

        ' Libera o objeto XML
        Set xmlDoc = Nothing
    End Function

    ' Carregar o ambiente atual (dev ou prod)
    Dim environment, configData
    environment = LoadCurrentEnvironment()

    ' Inicializar o dicionário para armazenar as configurações
    Set configData = CreateObject("Scripting.Dictionary")

    ' Carregar as configurações do ambiente
    If environment <> "" Then
        ' Passa o dicionário configData por referência
        result = LoadEnvironmentConfig(environment, configData)
        result = LoadNodeJSPath(environment, configData)

        ' Exibir as variáveis de configuração
        ' If result = "Success" Then
        '     Response.Write "Ambiente: " & environment & "<br>"
        '     Response.Write "DATABASE: " & configData("DATABASE") & "<br>"
        '     Response.Write "UID: " & configData("UID") & "<br>"
        '     Response.Write "password: " & configData("password") & "<br>"
        '     Response.Write "server: " & configData("server") & "<br>"
        '     Response.Write "NodeJSWebsocketUri: " & configData("NodeJSWebsocketUri") & "<br>"
        ' Else
        '     Response.Write "Não foi possível carregar as configurações do ambiente."
        ' End If
    Else
        Response.Write "Ambiente não definido."
    End If
%>
