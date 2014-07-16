"use strict"
angular.module("app.states", ["ui.router"]).config [
  "$stateProvider"
  "$urlRouterProvider"
  ($stateProvider, $urlRouterProvider) ->
    $stateProvider.state "signup",
      url: "/signup"
      template: ''
      controller: "SignupCtrl"

    $stateProvider.state "home",
      url: "/home"
      template: ''
      controller: "HomeCtrl"

]
