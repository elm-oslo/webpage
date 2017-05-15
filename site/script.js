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

window.onhashchange = trackpage;
function trackpage() {
  ga('send', 'pageview', {
   'page': window.location.pathname + window.location.search  + window.location.hash
  });
}

var app = Elm.Main.embed(document.querySelector("#app"));

app.ports.init.subscribe(function() {
  ticket_btn_f = {
    wrapper: document.getElementById('ticket_btn'),
    animType: 'svg',
    autoplay: false,
    loop: false,
    path: 'ticket.json'
  };
  ticket_btn_anim = bodymovin.loadAnimation(ticket_btn_f);

  setTimeout(function() {
    var nodes = document.querySelectorAll('.animate');
    for (var i = 0; i < nodes.length; i++){
      var node = nodes[i];
      if (node.addClass) node.addClass('animate-start');
      else node.className += 'animate-start';
    }
  }, 300);
});

app.ports.scrollToId.subscribe(function(id) {
  requestAnimationFrame(function() {
    document.getElementById(id).scrollIntoView();
  });
});

var anim;
app.ports.triggerAnim.subscribe(function() {
  if (anim) {
    anim.destroy();
  }
  requestAnimationFrame(function() {
    if (document.getElementById('shapes')) {
      anim = bodymovin.loadAnimation({
        wrapper: document.getElementById('shapes'),
        animType: 'svg',
        autoplay: true,
        loop: false,
        path: 'animation.json'
      });
    }
  });
});

app.ports.startBuyTicketAnim.subscribe(function() {
  ticket_btn_anim.play();
});
app.ports.stopBuyTicketAnim.subscribe(function() {
  ticket_btn_anim.goToAndStop(1, true);
});
