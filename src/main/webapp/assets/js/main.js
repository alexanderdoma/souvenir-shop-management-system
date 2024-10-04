const navbar = document.getElementById("header");
let lastScrollY = window.scrollY;

window.addEventListener('scroll', () => {
  const currentScrollY = window.scrollY;
  if (currentScrollY > lastScrollY) { // Si desplazamos hacia abajo
    navbar.classList.add('hide'); // Ocultamos la navbar
  } else { // Si desplazamos hacia arriba
    navbar.classList.remove('hide'); // Mostramos la navbar
  }
  lastScrollY = currentScrollY;
});