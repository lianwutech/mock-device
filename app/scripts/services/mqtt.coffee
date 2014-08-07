'use strict'
angular.module('app.services')
  .factory 'mqtt', ['$q', '$rootScope',  ($q, $rootScope)->
    if require?
      @client = require('mqtt').createClient(1883, 'localhost')

    register = (id)=>
      if require?
        @client.publish(id, '');

    send = (id, type, addr, port, data)=>
      if require?
        @client.publish(id, data);

    wait = (id, fn)=>
      if require?
        @client.on('message', (topic, message) ->
          fn(topic, message)
        );

    return {
      register: register
      send: send
      wait: wait
    }
  ]
