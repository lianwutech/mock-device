$(()->
  if !window.keypress?
    console.error "keypress package not installed, please run `bower install`"
  listener = new window.keypress.Listener();
  listener.sequence_combo("d e v t o o l", ->
    if require? then require('nw.gui').Window.get().showDevTools();
  , true);
)
