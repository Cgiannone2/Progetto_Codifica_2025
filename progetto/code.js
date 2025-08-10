// progetto/code.js

$(document).ready(function () {
  function setActiveNavLink(hash) {
    $('.navMenu a').removeClass('active');
    $('.navMenu a[href="' + hash + '"]').addClass('active');
  }

  $('.navMenu a').on('click', function (e) {
    var targetHash = $(this).attr('href');
    setActiveNavLink(targetHash);
  });

  if (window.location.hash) {
    setActiveNavLink(window.location.hash);
  } else {
    $('.navMenu a[href="#intro"]').addClass('active');
  }

  $(window).on('popstate', function () {
    if (window.location.hash) {
      setActiveNavLink(window.location.hash);
    } else {
      $('.navMenu a').removeClass('active');
      $('.navMenu a[href="#intro"]').addClass('active');
    }
  });

  // Funzione per l'evidenziazione dei fenomeni notevoli
  window.togglePhenomenon = function (className) {
    var elements = $('.' + className);
    var button = $('.btn' + className.split('-').map(part => part.charAt(0).toUpperCase() + part.slice(1)).join('')); // This creates a camel-case button class name

    if (button.hasClass('active-phenomenon')) {
      elements.removeClass('highlighted');
    } else {
      elements.addClass('highlighted');
    }
    button.toggleClass('active-phenomenon');
  };

  window.gestoreEvidenziaSVG = function (id) {
    var textElementId = id.replace('zone-', '');
    var textElement = $('#' + textElementId);
    var svgElement = $('#' + id);
    console.log("Looking for element with id:", textElementId, "Found:", textElement.length > 0 ? "Yes" : "No");

    if (textElement.length) {
      // Applica stili inline per il colore celeste
      textElement.css('background-color', '#4682b4');
      textElement.css('color', '#fff');
    }
    if (svgElement.length) {
      // Lasciamo che l'SVG venga gestito dal CSS :hover per lo stesso colore
      // o potresti applicare uno stile inline anche qui
    }
  };

  window.gestoreDisEvidenziaSVG = function (id) {
    var textElementId = id.replace('zone-', '');
    var textElement = $('#' + textElementId);
    var svgElement = $('#' + id);

    if (textElement.length) {
      // Rimuovi gli stili inline
      textElement.css('background-color', 'transparent');
      textElement.css('color', '#e0e0e0');
    }
    if (svgElement.length) {
      // L'SVG tornerà al suo stato originale grazie al CSS
    }
  };

  // --- Gestione Carosello 1 (Articolo "I Carusi in Sicilia") ---
  var currentSlide1 = 0;
  var totalSlides1 = $('#text-carousel-content .carousel-slide-text').length;

  window.changeSlide1 = function (direction) {
    currentSlide1 += direction;
    if (currentSlide1 < 0) {
      currentSlide1 = totalSlides1 - 1;
    } else if (currentSlide1 >= totalSlides1) {
      currentSlide1 = 0;
    }
    updateCarousel1();
  };

  function updateCarousel1() {
    $('#image-carousel-content .carousel-slide').removeClass('active');
    if (currentSlide1 < $('#image-carousel-content .carousel-slide').length) {
      $('#image-carousel-content .carousel-slide').eq(currentSlide1).addClass('active');
    }
    var textSlides = $('#text-carousel-content .carousel-slide-text');
    textSlides.removeClass('active');
    textSlides.eq(currentSlide1).addClass('active');
  }

  // --- Gestione Carosello 2 (Articolo "Il commercio nel primo trimestre 1881") ---
  var currentSlide2 = 0;
  var totalSlides2 = $('#text-carousel-content-2 .carousel-slide-text').length;

  window.changeSlide2 = function (direction) {
    debugger
    currentSlide2 += direction;
    if (currentSlide2 < 0) {
      currentSlide2 = totalSlides2 - 1;
    } else if (currentSlide2 >= totalSlides2) {
      currentSlide2 = 0;
    }
    updateCarousel2();
  };

  function updateCarousel2() {
    $('#image-carousel-content-2 .carousel-slide').removeClass('active');
    if (currentSlide2 < $('#image-carousel-content-2 .carousel-slide').length) {
      $('#image-carousel-content-2 .carousel-slide').eq(currentSlide2).addClass('active');
    }
    var textSlides = $('#text-carousel-content-2 .carousel-slide-text');
    textSlides.removeClass('active');
    textSlides.eq(currentSlide2).addClass('active');
  }

  // Initialization for both carousels
  updateCarousel1();
  updateCarousel2();
});