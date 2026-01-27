
<!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
<div class="logo" style="position: relative; left: 20px; display: flex; align-items: center; gap: 10px;">
    <img src="dist/img/image.png" alt="Logo Poseidon" style="width: 45px; height: auto;">
    <a href="home.asp">Poseidon</a>
</div>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="info">
          <a class="d-block" href="usuario-alterar-dados.asp?pid=<%response.write session("codigo")%>"><%response.write session("nome")%></a>
        </div>
      </div>

		<!-- Sidebar Menu -->
		<nav class="mt-2 sidebar-menu-scrollable ">
			<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
				<li class="nav-header"> MENU</li>
					<li class="nav-item">
						<a href="usuario.asp" class="nav-link">
							<i class="nav-icon fas fa-users"></i>
							<p>Usuarios</p>
						</a>
					</li>
          			<li class="nav-item">
						<a href="perfil.asp" class="nav-link">
							<i class="nav-icon fas fa-user-cog"></i>
							<p>Perfil</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="quarto.asp" class="nav-link">
							<i class="nav-icon fas fa-hotel"></i>
							<p>Quartos</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="quarto-tipo.asp" class="nav-link">
							<i class="nav-icon fas fa-hotel"></i>
							<p> Tipos de Quartos</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="foto.asp" class="nav-link">
							<i class="nav-icon fas fa-hotel"></i>
							<p> Fotos</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="logout.asp" class="nav-link">
							<i class="nav-icon fas fa-times"></i>
							<p>Sair</p>
						</a>
					</li>

				</li>
			</ul>
		</nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>