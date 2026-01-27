<form name="form" method="post" class="form-responsive">
    <div class="row">
        <div class="col-12 col-md-4 form-group">
            <label>Usuario</label>
            <input type="text" class="rcbfocus form-control" required oninput="this.value = this.value.toUpperCase()" placeholder="Digite o nome" name="nome">
        </div>
        <div class="col-12 col-md-3 form-group">
            <label for="cpf">CPF</label>
            <input type="text" required  class="rcbfocus form-control" id="cpf" name="cpf" placeholder="XXX.XXX.XXX-XX"  oninput="formatarCPF(this)">
        </div>
        <div class="col-12 col-md-2 form-group">
            <label>Sexo</label>
            <select type="text" class="rcbfocus form-control" id="sexo"  name="sexo" required > 
                <option value="">-- Selecione --</option>
                <option>Feminino</option>
                <option>Masculino</option>
			</select>
		</div>
        <div class="col-12 col-md-2 form-group">
            <label>RAÇA/COR</label>
            <select type="text" class="rcbfocus form-control" id="etnia"  name="etnia" required > 
                <option value="">-- Selecione --</option>
                <option>PRETA</option>
                <option>PARDA</option>
                <option>INDIGENA</option>
                <option value="AMARELA">ASIÁTICA</option>
                <option>BRANCA</option>
            </select>        
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-md-2 form-group">
            <label>Nascimento</label>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                </div>
                <input id="data" class="form-control" required name="data_nasc" oninput="formataDATA(this); atualizarIdade();"/>
            </div>
        </div>
        <div class="col-12 col-md-3 form-group">
            <label>Idade</label>
            <input type="text" id="idade" class="form-control" readonly>
        </div>
        <div class="col-12 col-md-2 form-group">
            <label>Telefone de contato</label>
            <input type="text" class="rcbfocus form-control" required placeholder="Digite o Numero De Contato" name="telefone" oninput="formatarTelefone(this)">
        </div>
        <div class="col-12 col-md-3 form-group">
              <label for="email">E-MAIL</label>
              <input type="email" class="rcbfocus form-control" required name="email" id="email" onblur="verificarEMAILPACI()" placeholder="e-mail" />
        </div>
        <div class="col-12 col-md-2 form-group">
            <label>PERFIL</label>
            <select required class="form-control" name="perfil">
                <option></option>
                <%
                sqlstmtL = "select codigo, perfil from perfil order by perfil"
                set rsqueryL = conn.execute(sqlstmtL)
                
                while not rsqueryL.eof
                %>
                    <option value="<%response.write rsqueryL("codigo")%>"> <%response.write rsqueryL("perfil")%></option>
                <%
                rsqueryL.movenext
                wend
                %>
            </select>
        </div>
    </div>

    <div class="row" style="margin-top: 35px;">
        <div class="col-12 col-md-3 form-group">
            <label>Endereço</label>
            <input type="text" class="rcbfocus form-control" required placeholder="Digite a rua" name="rua">
        </div>
        <div class="col-12 col-md-2 form-group">
            <label>Número</label>
            <input type="number" class="rcbfocus form-control" required placeholder="Nº do Endereço" name="nm">
        </div>
        <div class="col-12 col-md-4 form-group">
            <label>Complemento</label>
            <input type="text" class="rcbfocus form-control" placeholder="Digite o complemento" name="cp">
        </div>
        <div class="col-12 col-md-3 form-group">
            <label>Bairro</label>
            <input type="text" class="rcbfocus form-control" placeholder="Digite o bairro" name="br" required>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-md-2 form-group">
            <label>Cidade</label>
            <input type="text" class="rcbfocus form-control" placeholder="Digite a cidade" name="cd" required>
        </div>
        <div class="col-12 col-md-2 form-group">
            <label>CEP</label>
            <input type="text" id="cep" class="rcbfocus form-control" required name="cep" placeholder="12345-678" oninput="formatarCEP(this)">
        </div>
        <div class="col-12 col-md-2 form-group">
            <label>UF</label>
            <select class="rcbfocus form-control" required name="uf">
                <option value="">Estado</option>
                <option value="AC">AC</option>
                <option value="AL">AL</option>
                <option value="AP">AP</option>
                <option value="AM">AM</option>
                <option value="BA">BA</option>
                <option value="CE">CE</option>
                <option value="DF">DF</option>
                <option value="ES">ES</option>
                <option value="GO">GO</option>
                <option value="MA">MA</option>
                <option value="MT">MT</option>
                <option value="MS">MS</option>
                <option value="MG">MG</option>
                <option value="PA">PA</option>
                <option value="PB">PB</option>
                <option value="PR">PR</option>
                <option value="PE">PE</option>
                <option value="PI">PI</option>
                <option value="RJ">RJ</option>
                <option value="RN">RN</option>
                <option value="RS">RS</option>
                <option value="RO">RO</option>
                <option value="RR">RR</option>
                <option value="SC">SC</option>
                <option value="SP">SP</option>
                <option value="SE">SE</option>
                <option value="TO">TO</option>
                <option value="EX">EX</option>
            </select>
        </div>
        <div class="col-12 col-md-2 form-group">
            <label>Placa do carro</label>
            <input type="text" class="rcbfocus form-control" name="car">
        </div>
        <div class="col-12 col-md-6" align="right">
            <button type="button" id="btnIncluir" onclick="lancarusuario();" class="btn btn-info"><i class="fa fa-plus"></i> Incluir</button>
        </div>
    </div>
</form>
