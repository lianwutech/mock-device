"use strict"
angular.module("app.states", ["ui.router"]).config [
  "$stateProvider"
  "$urlRouterProvider"
  ($stateProvider, $urlRouterProvider) ->
    $stateProvider.state "home",
      url: "/"
      templateUrl: '/partials/home.html'
      controller: "HomeCtrl"
    $urlRouterProvider.otherwise('/')
]
