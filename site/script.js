console.log('loaded script..');
document.addEventListener('DOMContentLoaded', function() {
  console.log('starting elm..');
  var host = document.getElementById('elm-host');
  var elmApp = Elm.Main.embed(host);
});