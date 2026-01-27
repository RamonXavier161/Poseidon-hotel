function pegarDataAtual() {
    const agora = new Date();
    const dia = String(agora.getDate()).padStart(2, '0');
    const mes = String(agora.getMonth() + 1).padStart(2, '0'); // Mês é 0-based
    const ano = agora.getFullYear();
    
    return `${dia}/${mes}/${ano}`;
}

function pegarHoraAtual() {
    const agora = new Date();
    const horas = String(agora.getHours()).padStart(2, '0');
    const minutos = String(agora.getMinutes()).padStart(2, '0');
    const segundos = String(agora.getSeconds()).padStart(2, '0');
    
    return `${horas}:${minutos}:${segundos}`;
}

function pegarHoraEMinutosAtual() {
    const agora = new Date();
    const horas = String(agora.getHours()).padStart(2, '0');
    const minutos = String(agora.getMinutes()).padStart(2, '0');
    
    return `${horas}:${minutos}`;
}

function compareStrings(str1, str2) {
    return str1
        .normalize("NFD") // Decompõe caracteres acentuados
        .replace(/[\u0300-\u036f]/g, "") // Remove os acentos
        .toLowerCase() === 
    str2
        .normalize("NFD")
        .replace(/[\u0300-\u036f]/g, "")
        .toLowerCase();
}

// Função para criar objeto Date a partir da string no formato "dd/mm/yyyy hh:mm:ss"
function criarDateObj(dataHoraString) {
    const [dataPartes, horaPartes] = dataHoraString.split(' ').map(part => part.split(/[/:]/));
    
    return new Date(
        parseInt(dataPartes[2]), // ano
        parseInt(dataPartes[1]) - 1, // mês (0-11)
        parseInt(dataPartes[0]), // dia
        parseInt(horaPartes[0]), // hora
        parseInt(horaPartes[1]), // minuto
        parseInt(horaPartes[2]) || 0 // segundo
    );
}