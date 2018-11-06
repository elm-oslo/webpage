window.onhashchange = trackpage;
function trackpage() {
    ga('send', 'pageview', {
        page:
            window.location.pathname +
            window.location.search +
            window.location.hash,
    });
}

var app = Elm.Main.init({ node: document.querySelector('#app') });
