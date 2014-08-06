'use strict'
angular.module('app.controllers')
  .controller('LoginCtrl', [
    '$scope'
    '$http'
    '$state'
    ($scope, $http, $state) ->
      $scope.login = ->
        $http.get('http://www.lianwuyun.cn/login').success((data) ->
          xsrf = /name="_xsrf" value="(\w+)"/.exec(data)[1]
          $http.post('http://www.lianwuyun.cn/login',
            $.param({email: $scope.email, password: $scope.password, _xsrf: xsrf}),
            headers:{'Content-Type':'application/x-www-form-urlencoded'})
              .success((data, status, headers, config)->
                if data.match(/dashboard/) then $state.go('home')
                else $scope.errorPrompt = '登录失败'
              )
        )
      $scope.register = ->
        gui = require('nw.gui')
        gui.Shell.openExternal('http://www.lianwuyun.cn/apply')
  ])

