'use strict';

/**
 * @ngdoc overview
 * @name angularAppApp
 * @description
 * # angularAppApp
 *
 * Main module of the application.
 */
angular
  .module('angularAppApp', [
    'ngAnimate',
    'ngAria',
    'ngCookies',
    'ngMessages',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'ui.router'
  ])
  .config(function ($stateProvider, $urlRouterProvider) {

    $urlRouterProvider.otherwise('/');

    $stateProvider
      .state('login', {
        url: '/login',
        templateUrl: 'views/login.html',
        controller: 'MainCtrl',
        controllerAs: 'ctrl'
      })
      .state('solicitud_apoyo_economico', {
        url: '/solicitud_apoyo_economico',
        templateUrl: 'views/formSolicitudApoyoEconomico.html',
        controller: 'MainCtrl',
        controllerAs: 'ctrl'
      })
      .state('default', {
        url: '/',
        templateUrl: 'views/login.html',
        controller: 'MainCtrl',
        controllerAs: 'ctrl'
      })
      
  });
