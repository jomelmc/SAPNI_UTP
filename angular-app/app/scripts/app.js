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
    'ngCookies',
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
      .state('solicitud_visto_bueno',{
        url: '/solicitud_visto_bueno',
        templateUrl:  'views/solicitudVistoBueno.html',
        controller:   'MainCtrl',
        controllerAs: 'ctrl'
      })
      .state('asignacion_de_resultado_lista',{
        url: '/solicitud_visto_bueno',
        templateUrl:  'views/asignacionResultadoLista.html',
        controller:   'MainCtrl',
        controllerAs: 'ctrl'
      })
      .state('asignar_resultado',{
        url: '/asignar_resultado',
        templateUrl:  'views/asignarResultado.html',
        controller:   'MainCtrl',
        controllerAs: 'ctrl'
      })
      .state('solicitudes_asignadas',{
        url: '/solicitudes_asignadas',
        templateUrl:  'views/solicitudesAsignadas.html',
        controller:   'MainCtrl',
        controllerAs: 'ctrl'
      })
      .state('historial_solicitud',{
        url: '/historial_solicitud',
        templateUrl:  'views/historialSolicitud.html',
        controller:   'MainCtrl',
        controllerAs: 'ctrl'
      })
      .state('generar_solicitud',{
        url: '/generar_solicitud',
        templateUrl:  'views/recomendacion.html',
        controller:   'MainCtrl',
        controllerAs: 'ctrl'
      })
      .state('formulario_enviado',{
        url: '/formulario_enviado',
        templateUrl:  'views/notificacion1.html',
        controller:   'MainCtrl',
        controllerAs: 'ctrl'
      })
      .state('notificacion_2',{
        url: '/notificacion_2',
        templateUrl:  'views/notificacion2.html',
        controller:   'MainCtrl',
        controllerAs: 'ctrl'
      })
      
      
  })
  
  .directive('commonsItems', [function() {
    return {
      restrict: 'E',
      templateUrl:'views/directives/templates/commons-items.html',
      scope:{
        data: '='
      },
      link: function(scope, element, attrs){
      }
    };
  }]);

