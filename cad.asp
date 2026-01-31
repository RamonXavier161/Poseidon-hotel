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
          <h1>Cadastrar</h1>
          <form action="cad-grava.asp" method="post">
            <div class="text-field">
              <input type="texto" name="nome" placeholder="NOME" />
            </div>
            <div class="text-field">
              <input id="cpf" type="text" class="rcbfocus form-control" placeholder="XXX.XXX.XXX-XX" oninput="formatarCPF(this)" name="cpf" required/>
            </div>
            <div class="text-field">
              <input type="email" name="email" placeholder="e-mail" />
            </div>
            <div class="text-field">
              <input type="password" name="senha" placeholder="senha" />
            </div>
            <div class="text">
              <div class="botoes">
                <button type="submit" class="ss">Cadastrar</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
     <script src="dist/js/script.js"></script>
  </body>
</html>
















