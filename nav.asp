<nav class="top-nav navbar">
  <div class="logo">
    <img src="dist/img/image.png" alt="Logo Poseidon">
    <a href="home.asp">Poseidon</a>
  </div>

  <ul class="menu">
    <li><a href="#rooms">QUARTOS</a></li>
    <li><a href="#footer_Direitoautoral">CONTATO</a></li>
    <li><a href="logout.asp">SAIR</a></li>
    <%if session("perfil") <> "1" then%>
      <li><a href="home-interno.asp">FUNCIONARIO</a></li>
    <%end if%>
  </ul>
</nav>
