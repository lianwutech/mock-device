"use strict"
angular.module("app.states", ["ui.router"]).config [
  "$stateProvider"
  "$urlRouterProvider"
  ($stateProvider, $urlRouterProvider) ->
    $stateProvider.state "home",
      url: "/"
      templateUrl: '/partials/home.html'
      controller: "HomeCtrl"

    $stateProvider.state "login",
      url: "/login"
      templateUrl: '/partials/login.html'
      controller: "LoginCtrl"

    $stateProvider.state "scan",
      url: "/scan"
      templateUrl: '/partials/scan.html'
      controller: "ScanCtrl"

    $urlRouterProvider.otherwise('/')
]
