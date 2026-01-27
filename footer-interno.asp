<footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 2.0 
      <b> | Enviroment</b> <% response.Write(environment)%>
      <a href="#" data-toggle="modal" data-target="#modal-equipe">
        <i class="fas fa-info-circle"></i> Sobre
      </a>
    </div>
    <strong>Copyright &copy; <% response.Write(Year(Date())) %> <a href="#">POSEIDON</a>.</strong> Todos os direitos reservados.
</footer>
