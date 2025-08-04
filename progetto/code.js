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

  // Evidenzia zone
  window.gestoreEvidenzia = function (id) {
    var targetElement = $('#' + id);
    console.log('gestoreEvidenzia', id)
    if (targetElement.length) {
      targetElement.css('background-color', '#4682b4');
      targetElement.css('color', '#fff');
    }
  };

  window.gestoreDisEvidenzia = function (id) {
    var targetElement = $('#' + id);
    console.log('gestoreEvidenzia', id)
    if (targetElement.length) {
      targetElement.css('background-color', 'transparent');
      targetElement.css('color', '#e0e0e0');
    }
  };
});