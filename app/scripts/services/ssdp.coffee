'use strict'
angular.module('app.services')
  .factory 'ssdp', ['$q',  ($q)->
    if require?
      Client = require('node-ssdp').Client
      @client = new Client({logLevel: 'debug'})

    search = =>
      defered = $q.defer()
      if require?
        result = @client.search('urn:schemas-lianwuyun-cn:device:gateway:1')
        result = @client.on('response', (headers, statusCode, rinfo) ->
          console.log "got ssdp response: " + JSON.stringify(rinfo)
          if statusCode == 200
            defered.notify rinfo.address
          else
            defered.reject rinfo.address
        )
      else
        defered.reject ''

      defered.promise

    return {
      search: search
    }
  ]
