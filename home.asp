<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#INCLUDE file="db.asp" -->
<!DOCTYPE html>
<html lang="pt-BR">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>POSEIDON</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="dist/css/style.css" />
  </head>
  <body class="hold-transition sidebar-mini sidebar-collapse">
  <%
  abre_conexao()
  %>
    <!-- começo -->
    <!--#INCLUDE file="nav.asp" -->

    <!-- começo do carrossel -->


    <div class="slider">
      <div class="slides">
        <img src="dist/img/02-hot-beach-1030x528.jpg" alt="Praia">
        <img src="dist/img/ClubHotel-Riu-Tequila-Wedding-Pool-5-1030x528.jpg" alt="Piscina">
        <img src="dist/img/luxury-apartment-on-eden-island-0-1030x528.jpg" alt="Apartamento">
      </div>
      
          <div class="prev">&#10094;</div>
          <div class="next">&#10095;</div>
    </div>
    
 
    <!-- pacotes -->

    <section  id="rooms" style="max-width: none;" >
      <h2>QUARTOS</h2>

      <ul class="rooms-list">
        <% 
          sqlstmt = "SELECT q.*, f.caminho, tq.descricao, tq.valor_diaria "
          sqlstmt = sqlstmt & " FROM quartos q "
          sqlstmt = sqlstmt & " LEFT JOIN tipo_quarto tq ON q.tipo = tq.codigo "
          sqlstmt = sqlstmt & " LEFT JOIN fotos f ON q.codigo = f.quarto "
          sqlstmt = sqlstmt & " WHERE q.status = 'LIVRE' "
          set rsquery = conn.execute(sqlstmt)

          while not rsquery.eof 
        %>
          <li class="room-item">
            <div class="room-card">
              
              <div class="room-image">
                <img src="http://localhost:3000/<%=rsquery("caminho")%>" alt="Foto do quarto">
              </div>

              <div class="room-info">
                <h3><%=rsquery("descricao")%></h3>
                <p class="price">R$ <%=rsquery("valor_diaria")%></p>
                <p class="tax">Inclui taxas e impostos</p>
                  <a href="quarto-info.asp?pid=<%response.write rsquery("codigo")%>" class="ss">Agende</a>              
              </div>

            </div>
          </li>

        <%
            rsquery.movenext
          wend 
        %>
      </ul>
    </section>


    <!-- footer -->
    <!--#INCLUDE file="footer.asp" -->

    <script src="dist/js/script.js"></script>

<%
fecha_conexao()
%>

  </body>
</html>
