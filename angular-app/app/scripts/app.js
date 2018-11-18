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
    'ngTouch'
  ])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl:  'views/login.html',
        controller:   'MainCtrl',
        controllerAs: 'main'
      })
      .when('/solicitud-apoyo-economico', {
        templateUrl:  'views/formSolicitudApoyoEconomico.html',
        controller:   'MainCtrl',
        controllerAs: 'main'
      })
      .when('/bandeja-trabajo',{
        templateUrl:  'views/bandejaTrabajo.html',
        controller:   'MainCtrl',
        controllerAs: 'main'
      })
      .when('/seguimiento',{
        templateUrl:  'views/seguimiento.html',
        controller:   'MainCtrl',
        controllerAs: 'main'
      })
      .when('/dar-visto-bueno',{
        templateUrl:  'views/darVistoBueno.html',
        controller:   'MainCtrl',
        controllerAs: 'main'
      })
      .when('/revision-solicitud-visto-bueno',{
        templateUrl:  'views/revisionSolicitudVistobueno.html',
        controller:   'MainCtrl',
        controllerAs: 'main'
      })
      .when('/asignacion-comision-evaluadora',{
        templateUrl:  'views/asignacionComision.html',
        controller:   'MainCtrl',
        controllerAs: 'main'
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
      
      
      .otherwise({
        redirectTo: '/'
      });
  });
