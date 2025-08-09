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

  window.togglePhenomenon = function (className) {
    $('.' + className).toggleClass('highlighted');

    var button = $('.btn' + className.charAt(0).toUpperCase() + className.slice(1));

    if (button.length) {
      button.toggleClass('active-phenomenon');
    }
  };


  // Funzione per l'evidenziazione dei fenomeni notevoli
  window.togglePhenomenon = function (className) {
    var elements = $('.' + className);
    var button = $('.btn' + className.charAt(0).toUpperCase() + className.slice(1));
    if (button.hasClass('active-phenomenon')) {
      elements.removeClass('highlighted');
    } else {
      elements.addClass('highlighted');
    }
    button.toggleClass('active-phenomenon');
  };

  window.gestoreEvidenziaSVG = function (id) {
    console.warn('gestoreEvidenziaSVG', id)
    var textElementId = id.replace('zone-', '');
    var textElement = $('#' + textElementId);
    var svgElement = $('#' + id);

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
    console.warn('gestoreDisEvidenziaSVG', id)
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

  // --- Gestione Carosello ---
  var currentSlide = 0;
  var totalSlides = $('#image-carousel-content .carousel-slide').length;

  window.changeSlide = function (direction) {
    currentSlide += direction;
    if (currentSlide < 0) {
      currentSlide = totalSlides - 1;
    } else if (currentSlide >= totalSlides) {
      currentSlide = 0;
    }
    updateCarousel();
  };

  function updateCarousel() {
    $('#image-carousel-content .carousel-slide').removeClass('active');
    $('#text-carousel-content .carousel-slide-text').removeClass('active');

    $('#image-carousel-content .carousel-slide').eq(currentSlide).addClass('active');
    $('#text-carousel-content .carousel-slide-text').eq(currentSlide).addClass('active');
  }

  updateCarousel();
});