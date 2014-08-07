'use strict'
angular.module('app.services')
  .factory 'devtool', ['$q', '$rootScope',  ($q, $rootScope)->
    if !window.keypress?
      console.error "keypress package not installed, please run `bower install`"
      return false
    listener = new window.keypress.Listener();
    listener.sequence_combo("d e v t o o l", ->
      if require? then require('nw.gui').Window.get().showDevTools();
    , true);
    true
  ]
