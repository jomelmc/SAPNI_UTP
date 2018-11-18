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
      .state('bandeja_trabajo', {
        url: '/bandeja_trabajo',
        templateUrl: 'views/bandejaTrabajo.html',
        controller: 'MainCtrl',
        controllerAs: 'ctrl'
      })
      .state('seguimiento', {
        url: '/seguimiento',
        templateUrl: 'views/seguimiento.html',
        controller: 'MainCtrl',
        controllerAs: 'ctrl'
      })
      .state('dar_visto_bueno', {
        url: '/dar_visto_bueno',
        templateUrl: 'views/darVistoBueno.html',
        controller: 'MainCtrl',
        controllerAs: 'ctrl'
      })
      .state('revision_solicitud_visto_bueno', {
        url: '/revision_solicitud_visto_bueno',
        templateUrl: 'views/revisionSolicitudVistoBueno.html',
        controller: 'MainCtrl',
        controllerAs: 'ctrl'
      })
      .state('default', {
        url: '/',
        templateUrl: 'views/login.html',
        controller: 'MainCtrl',
        controllerAs: 'ctrl'
      })
      .when('/solicitud-visto-bueno',{
        templateUrl:  'views/solicitudVistoBueno.html',
        controller:   'MainCtrl',
        controllerAs: 'main'
      })
      .when('/asignacion-de-resultado-lista',{
        templateUrl:  'views/asignacionResultadoLista.html',
        controller:   'MainCtrl',
        controllerAs: 'main'
      })
      .when('/asignar-resultado',{
        templateUrl:  'views/asignarResultado.html',
        controller:   'MainCtrl',
        controllerAs: 'main'
      })
      .when('/solicitudes-asignadas',{
        templateUrl:  'views/solicitudesAsignadas.html',
        controller:   'MainCtrl',
        controllerAs: 'main'
      })
      .when('/historial-solicitud',{
        templateUrl:  'views/historialSolicitud.html',
        controller:   'MainCtrl',
        controllerAs: 'main'
      })
      .when('/generar-solicitud',{
        templateUrl:  'views/recomendacion.html',
        controller:   'MainCtrl',
        controllerAs: 'main'
      })
      .when('/prueba-notificaciones',{
        templateUrl:  'views/notificacion5.html',
        controller:   'MainCtrl',
        controllerAs: 'main'
      })
      
      
  })
  
  .directive('commonsItems', [function() {
    return {
      restrict: 'E',
      templateUrl:'views/directives/templates/commons-items.html',
      scope:{
        data: '=',
        state: '='
      },
      link: function(){
      }
    };
  }]);
