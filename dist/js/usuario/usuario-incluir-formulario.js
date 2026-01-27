$(document).ready(function() {
    setupDatepicker();
    setupSelect2();
});

function setupDatepicker() {
    $.datepicker.regional['pt-BR'] = {
        closeText: 'Fechar', prevText: 'Anterior', nextText: 'Próximo', currentText: 'Hoje',
        monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
        monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
        dayNames: ['Domingo', 'Segunda-feira', 'Terça-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'Sábado'],
        dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab'],
        dayNamesMin: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab'],
        dateFormat: 'dd/mm/yy', firstDay: 0
    };
    $.datepicker.setDefaults($.datepicker.regional['pt-BR']);

    $("#data").datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: "1900:+0",
        onSelect: function() {
            atualizarIdade(); // Calcula quando seleciona no calendário
        }
    });
}

function atualizarIdade() {
    const campoData = document.getElementById('data');
    const campoIdade = document.getElementById('idade');

    if (campoData && campoData.value.length === 10) {
        const resultado = calcularIdade(campoData.value);
        if (resultado) {
            campoIdade.value = `${resultado.anos} anos, ${resultado.meses} meses, ${resultado.dias} dias`;
        }
    } else {
        campoIdade.value = "";
    }
}

function calcularIdade(dataNasc) {
    if (!dataNasc || dataNasc === "00/00/0000") return null;
    const partes = dataNasc.split('/');
    if (partes.length !== 3) return null;

    const dia = parseInt(partes[0], 10);
    const mes = parseInt(partes[1], 10) - 1;
    const ano = parseInt(partes[2], 10);

    const dataNascObj = new Date(ano, mes, dia);
    const dataAtual = new Date();

    let anos = dataAtual.getFullYear() - dataNascObj.getFullYear();
    let meses = dataAtual.getMonth() - dataNascObj.getMonth();
    let dias = dataAtual.getDate() - dataNascObj.getDate();

    if (meses < 0 || (meses === 0 && dias < 0)) {
        anos--;
        meses += 12;
    }
    if (dias < 0) {
        const ultimoDiaMes = new Date(dataAtual.getFullYear(), dataAtual.getMonth(), 0).getDate();
        dias += ultimoDiaMes;
        meses--;
    }
    return { anos, meses, dias };
}

function formataDATA(campo) {
    let v = campo.value.replace(/\D/g, "").substring(0, 8);
    if (v.length > 4) v = v.replace(/(\d{2})(\d{2})(\d{4})/, "$1/$2/$3");
    else if (v.length > 2) v = v.replace(/(\d{2})(\d{2})/, "$1/$2");
    campo.value = v;
}

// CORREÇÃO: Removi 'elements' das funções abaixo para não travarem o script
function formatarCEP(campo) {
    let cep = campo.value.replace(/\D/g, "").substring(0, 8);
    if (cep.length > 5) cep = cep.substring(0, 5) + "-" + cep.substring(5);
    campo.value = cep;
}

function formatarCPF(campo) {
    let cpf = campo.value.replace(/\D/g, "").substring(0, 11);
    if (cpf.length > 9) cpf = cpf.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/, "$1.$2.$3-$4");
    else if (cpf.length > 6) cpf = cpf.replace(/(\d{3})(\d{3})(\d{3})/, "$1.$2.$3");
    else if (cpf.length > 3) cpf = cpf.replace(/(\d{3})(\d{3})/, "$1.$2");
    campo.value = cpf;
}

function setupSelect2() {
    if ($.fn.select2) {
        $('.select2').select2();
        $('.select2bs4').select2({ theme: 'bootstrap4' });
    }
}

  function lancarusuario() 
  {
    const form = document.forms['form'];
			if (!form.checkValidity()) {
				form.reportValidity(); 
				return; 
			}

		showConfirmation({ 
			confirmText: "OK", 
			cancelText: "Cancelar", 
			confirmColor: "#28a745",
			title: "CONFIRMAÇÃO", 
			width: '800',
			html: "Deseja enviar este usuario ?", 
			onConfirm: () => {

								form.action = "usuario-incluir-grava.asp"; 
								form.submit(); 
							},
			onCancel: () => {},
		});
  }



    function formatarTelefone(campo) {
    let val = campo.value.replace(/\D/g, "");
    
    if (val.length > 11) {
      val = val.substring(0, 11);
    }
    
    if (val.length <= 10) {
      val = val.replace(/(\d{0,2})(\d{0,4})(\d{0,4})/, (_, ddd, prefixo, sufixo) => 
        `${ddd ? `(${ddd}` : ""}${prefixo ? `) ${prefixo}` : ""}${sufixo ? `-${sufixo}` : ""}`);
    } else {
      val = val.replace(/(\d{0,2})(\d{0,5})(\d{0,4})/, (_, ddd, prefixo, sufixo) => 
        `${ddd ? `(${ddd}` : ""}${prefixo ? `) ${prefixo}` : ""}${sufixo ? `-${sufixo}` : ""}`);
    }
    
    campo.value = val;
  }