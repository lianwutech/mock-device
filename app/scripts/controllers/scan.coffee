'use strict'
angular.module('app.controllers')
  .controller('ScanCtrl', [
    '$scope'
    '$localStorage'
    'ssdp'
    ($scope, $localStorage, ssdp) ->
      getGatewayDetails = (address) ->

      $scope.search = ->
        ssdp.search().then(null, null, (address)->
          $scope.model = $localStorage
          unless address of ($scope.model.gateways || {})
            $scope.model.gateways ||= {}
            $scope.model.gateways[address] = {};
        )

      $scope.search()
  ])
