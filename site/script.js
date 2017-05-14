// Polyfills, tools, etc

HTMLElement.prototype.addClass = function(add) {
  if (/open/.test(this.className)) return;

  this.className = this.className + " " + add;
}

HTMLElement.prototype.removeClass = function(remove) {
    var newClassName = "";
    var i;
    var classes = this.className.split(" ");
    for(i = 0; i < classes.length; i++) {
        if(classes[i] !== remove) {
            newClassName += classes[i] + " ";
        }
    }
    this.className = newClassName;
}

document.addEventListener("DOMContentLoaded", function(e) {
  setTimeout(function() {
    var nodes = document.querySelectorAll('.animate');
    for (var i = 0; i < nodes.length; i++){
      var node = nodes[i];
      if (node.addClass) node.addClass('animate-start');
      else node.className += 'animate-start';
    }
  }, 300);
});


// Navigation

var $ = document.querySelector.bind(document);

function trackPage() {
  ga('send', 'pageview', {
   'page': window.location.pathname + window.location.search  + window.location.hash
  });
}

// function render(e) {
//   var newPage = window.location.hash.substr(1);
//   if (!newPage) return closeContent();
//
//   trackPage();
//   openContent(newPage);
// };

// (function(window) {
//     var newPage = window.location.hash.substr(1);
//     if (!newPage) return;
//     trackPage();
//
//     openContent(newPage);
// })(window);
//
// var menuItems = document.querySelectorAll('.content__menu-item');
// Array.prototype.forEach.call(menuItems, function(n) {
//   n.addEventListener('click', function(e) {
//     var page = n.href.substr(n.href.lastIndexOf('#') + 1);
//     $('.' + page).addClass('no-transform');
//   });
// });
//
// function openContent(page) {
//   window.scrollTo(0, 0);
//   var current = $('.content__page.open')
//   if (current) current.removeClass('open');
//   $('.' + page).addClass('open');
//   $('.overlay').addClass('open');
//   $('main').addClass('content-open');
//   $('footer').addClass('hidden');
//   window.location.hash = page;
// }
//
// function closeContent() {
//   var current = $('.content__page.open')
//   if (current) {
//     current.removeClass('open');
//     current.removeClass('no-transform');
//   }
//   $('.overlay').removeClass('open');
//   $('main').removeClass('content-open');
//   $('footer').removeClass('hidden');
//   window.location.hash = '';
// }
//
// function showSpeaker(speakerNo) {
//   setTimeout(function () {
//     document.querySelectorAll('.speaker')[speakerNo].scrollIntoView();
//   }, 5);
// }

// window.onhashchange = render;
// render();

// document.addEventListener('DOMContentLoaded', function() {
//   var host = document.getElementById('elm-host');
//   var elmApp = Elm.Main.embed(host);
// });
