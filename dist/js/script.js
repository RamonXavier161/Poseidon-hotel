
function abrirform() {
    window.location = 'cad.asp';
}
function abrirlog() {
    window.location = 'log.asp';
}


document.addEventListener("DOMContentLoaded", function() {
    const opcoesStatus = ["LIVRE", "OCUPADO", "LIMPEZA", "MANUTENÇÃO"];
    const select = document.getElementById('statusQuarto');

    if (select) { // Verifica se o elemento existe para evitar novos erros
        const statusDoBanco = select.getAttribute('data-selecionado');

        opcoesStatus.forEach(status => {
            const option = document.createElement('option');
            option.value = status;
            option.textContent = status;

            if (status === statusDoBanco) {
                option.selected = true;
            }
            select.appendChild(option);
        });
    }
});


function formatarCPF(campo) {
    let cpf = campo.value.replace(/\D/g, "");

    if (cpf.length > 11) {
        cpf = cpf.substring(0, 11);
    }

    if (cpf.length > 9) {
        cpf = `${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9)}`;
    } else if (cpf.length > 6) {
        cpf = `${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6)}`;
    } else if (cpf.length > 3) {
        cpf = `${cpf.substring(0, 3)}.${cpf.substring(3)}`;
    }

    campo.value = cpf;

    if (elements.erroCPF) {
        elements.erroCPF.textContent = cpf.length === 14 ? "" : "CPF inválido. Digite 11 dígitos.";
    }
}




const slidesContainer = document.querySelector(".slides");
const slideImages = document.querySelectorAll(".slides img");
const prev = document.querySelector(".prev");
const next = document.querySelector(".next");

let counter = 0;
const intervalTime = 7000; // Tempo em milisegundos (4 segundos)
let slideInterval;

function updateSlide() {
  const size = slideImages[0].clientWidth;
  slidesContainer.style.transform = `translateX(${-size * counter}px)`;
}

function nextSlide() {
  if (counter >= slideImages.length - 1) {
    counter = 0;
  } else {
    counter++;
  }
  updateSlide();
}

function prevSlide() {
  if (counter <= 0) {
    counter = slideImages.length - 1;
  } else {
    counter--;
  }
  updateSlide();
}

// Inicia o movimento automático
function startSlide() {
  slideInterval = setInterval(nextSlide, intervalTime);
}

// Para o movimento (útil quando o usuário clica manualmente)
function stopSlide() {
  clearInterval(slideInterval);
}

// Eventos de clique
next.addEventListener("click", () => {
  nextSlide();
  stopSlide(); // Para de passar sozinho após interação
  startSlide(); // Reinicia o timer
});

prev.addEventListener("click", () => {
  prevSlide();
  stopSlide();
  startSlide();
});

// Pausa ao passar o mouse e retoma ao tirar
const slider = document.querySelector(".slider");
slider.addEventListener("mouseenter", stopSlide);
slider.addEventListener("mouseleave", startSlide);

// Inicialização
startSlide();
window.addEventListener('resize', updateSlide);



