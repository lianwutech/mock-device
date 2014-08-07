'use strict'
angular.module('app.controllers')
  .controller('HomeCtrl', [
    '$scope'
    '$timeout'
    '$state'
    '$localStorage'
    'mqtt'

    ($scope, $timeout, $state, $localStorage, mqtt) ->
      log = (str) ->
        tm = new Date()
        str = "#{tm.toTimeString()}\t#{str}"
        len = $scope.logs.unshift(str)
        if len > 10 then $scope.logs.pop()
        console.log str

      $scope.logs = []
      $scope.model = $localStorage
      $scope.model.thermometer ||=
        id: '1'
        type: 1501
        value: 33
      $scope.model.alarm ||=
        id: '2'
        type: 1501
        value: 'open'
      mqtt.wait($scope.model.alarm.id, (topic, message)->
        log "收到消息#{topic}, 内容#{message}"
      )
      $scope.model.unvarnished ||=
        id: '3'
        type: 1501
        value: '1FAA'

      $scope.devices = [
        $scope.model.thermometer
        $scope.model.alarm
        $scope.model.unvarnished
      ]

      $scope.start = (obj) ->
        run = ->
          log "发送设备#{obj.id}的数据: #{obj.value}"
          mqtt.send(obj.id, obj.type, obj.value)
          if obj.enabled then $timeout(run, 2000)

        $timeout(run, 1)
        obj.enabled = true

      $scope.stop = (obj) ->
        obj.enabled = false

      $scope.$on 'log',  (event, str) ->
        len = $scope.logs.unshift(str)
        if len > 10 then $scope.logs.pop()
        console.log str

      for device in $scope.devices
        device.enabled = false

      log "注册所有设备"
      for device in $scope.devices
        mqtt.register device.id
  ])
