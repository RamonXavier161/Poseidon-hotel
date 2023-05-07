
function abrirform() {
    window.location = 'cad.html';
}
function abrirlog() {
    window.location = 'log.html';
}


const slider = document.querySelector(".slider");
const slides = document.querySelector(".slides");
const slideWidth = slider.offsetWidth;
const prev = document.querySelector(".prev");
const next = document.querySelector(".next");

let counter = 0;

next.addEventListener("click", () => {
  counter++;
  if (counter >= slides.children.length) {
    counter = 0;
  }
  slides.style.transform = `translateX(-${counter * slideWidth}px)`;
});

prev.addEventListener("click", () => {
  counter--;
  if (counter < 0) {
    counter = slides.children.length - 1;
  }
  slides.style.transform = `translateX(-${counter * slideWidth}px)`;
});


