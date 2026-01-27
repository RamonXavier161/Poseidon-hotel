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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
  </head>
  <body>

    <div class="main-login">
      <div class="rigth-login">
        <div class="card-login">
          <h1>Logar</h1>
          <form action="login.asp" method="post">
            <div class="text-field">
              <label for="Usuario">Usuário</label>
              <input type="texto" name="Usuario" placeholder="usuário" />
            </div>
            <div class="text-field">
              <label for="senha">senha</label>
              <input type="password" name="senha" placeholder="senha" />
            </div>
            <div class="text">
              <div class="botoes">
                <button type="submit" class="ss">logar</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>

    <!-- inicio do rodape -->


  </body>
</html>
