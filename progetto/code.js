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
    // Aggiorna le slide delle immagini
    $('#image-carousel-content .carousel-slide').removeClass('active');
    $('#image-carousel-content .carousel-slide').eq(currentSlide).addClass('active');

    // Aggiorna le slide del testo
    var textSlides = $('#text-carousel-content .carousel-slide-text');
    textSlides.removeClass('active');
    textSlides.eq(currentSlide).addClass('active');

    // Recupera e visualizza il contenuto specifico per la slide corrente
    var currentPage = $('#image-carousel-content .carousel-slide.active img').attr('src').match(/pp(\d+)\.jpg/)[1];

    if (currentPage) {
      // Chiama una funzione XSLT per ottenere il contenuto
      // In realtà, questo è già stato generato dall'XSLT e il carosello lo gestisce
      // Il nostro compito è solo assicurarci che i contenitori siano corretti
      console.log("Visualizzazione del contenuto per la pagina " + currentPage);
    }
  }

  updateCarousel();
});