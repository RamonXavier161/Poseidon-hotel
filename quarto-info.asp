<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#INCLUDE file="db.asp" -->
<!--#INCLUDE file="alert.asp" -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>POSEIDON</title>
    <link rel="stylesheet" href="dist/css/style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer"
    />
  </head>
  <body>
    <%
    abre_conexao()
    codigo = request("pid")

    sqlstmt = "SELECT q.*, f.caminho, tq.descricao, tq.valor_diaria "
    sqlstmt = sqlstmt & " FROM quartos q "
    sqlstmt = sqlstmt & " LEFT JOIN tipo_quarto tq ON q.tipo = tq.codigo "
    sqlstmt = sqlstmt & " LEFT JOIN fotos f ON q.codigo = f.quarto "
    sqlstmt = sqlstmt & " WHERE q.codigo = '" & codigo & "' "
    set rsquery = conn.execute(sqlstmt)

    %>
    <div class="main-login">
        <div class="card-hotel">
            <div class="room-image2">
                <img src="http://localhost:3000/<%=rsquery("caminho")%>" alt="Foto da Pousada">
            </div>

            <div class="card-content">
                <h4 class="hotel-title"><%=rsquery("descricao")%></h4>
                <div class="rating-container">
                    <span class="stars">★★★★</span>
                    <div class="score-badge">
                        <span class="score-number">8,8</span>
                        <span class="score-text">Excelente</span>
                    </div>
                    <p class="reviews-link">Ver todas as 185 avaliações</p>
                </div>

                <div class="highlights">
                    <div class="highlight-item">
                        <span class="icon">☕</span>
                        <p><strong>Melhores avaliações pelo café da manhã</strong></p>
                    </div>
                    <div class="highlight-item">
                        <span class="icon">📍</span>
                        <p>A poucos passos de Praia dos Ossos</p>
                    </div>
                </div>

                <hr>

                <div class="amenities">
                    <span>🏊 3 piscinas</span>
                    <span>🍽️ Restaurante</span>
                    <span>💆 Spa</span>
                </div>

                <div class="price-section">
                    <p class="price-label">Diária a partir de:</p>
                    <p class="price-value">R$ <%=rsquery("valor_diaria")%></p>
                </div>
            </div>
        </div>
    </div>


    <%
    fecha_conexao()
    %>
  </body>
</html>