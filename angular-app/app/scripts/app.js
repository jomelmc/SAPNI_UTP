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
      .state('/solicitud_visto_bueno',{
        templateUrl:  'views/solicitudVistoBueno.html',
        controller:   'MainCtrl',
        controllerAs: 'main'
      })
      .state('/asignacion_de_resultado_lista',{
        templateUrl:  'views/asignacionResultadoLista.html',
        controller:   'MainCtrl',
        controllerAs: 'main'
      })
      .state('/asignar_resultado',{
        templateUrl:  'views/asignarResultado.html',
        controller:   'MainCtrl',
        controllerAs: 'main'
      })
      .state('/solicitudes_asignadas',{
        templateUrl:  'views/solicitudesAsignadas.html',
        controller:   'MainCtrl',
        controllerAs: 'main'
      })
      .state('/historial_solicitud',{
        templateUrl:  'views/historialSolicitud.html',
        controller:   'MainCtrl',
        controllerAs: 'main'
      })
      .state('/generar_solicitud',{
        templateUrl:  'views/recomendacion.html',
        controller:   'MainCtrl',
        controllerAs: 'main'
      })
      .state('/prueba_notificaciones',{
        templateUrl:  'views/notificacion5.html',
        controller:   'MainCtrl',
        controllerAs: 'main'
      })
      
      
  })
  
  .directive('commonsItems', [function() {
    return {
      restrict: 'E',
      templateUrl:'views/directives/templates/commons_items.html',
      scope:{
        data: '=',
        state: '='
      },
      link: function(){
      }
    };
  }]);
