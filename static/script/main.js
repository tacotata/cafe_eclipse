


// navbar toggle
const navBar = document.querySelector(".nav-bar__box");
const navbarToggle = document.querySelector(".nav-bar__toggle");
navbarToggle.addEventListener("click", () => {
  navBar.classList.toggle("open");
});





let slides = document.querySelectorAll("#slide__imgs >a> img");
let prev = document.getElementById("prev");
let next = document.getElementById("next");

let current = 0;

showSlides();
// prev.onClick = prevSlide;
// next.onClick = nextSlide;

function showSlides() {
  for (let i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  current++;
  if (current > slides.length) current = 1;
  slides[current - 1].style.display = "block";
  setTimeout(showSlides, 3000);
}
