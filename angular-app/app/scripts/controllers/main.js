'use strict';

/**
 * @ngdoc function
 * @name angularAppApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the angularAppApp
 */
angular.module('angularAppApp')
  .controller('MainCtrl', function ($state) {

    /** SE DECLARA EL ÁMBITO GLOBAL */
    var vm = this;

    /** INICIALIZAR VALORES */
    // temporal dummy
    var id = '8-8-8';
    var password = '12345678';

    /** FUNCIONES */
    vm.loginOnSubmit = function () {
      if (angular.isDefined(vm.user.id) && angular.isDefined(vm.user.password) && vm.user.id == id && vm.user.password == password) {
        $state.go("solicitud_apoyo_economico");
      }
    };

    vm.setup = function () {

      vm.user = {
        entityId: '3425',
        entityType: 'ESTUDIANTE',
      };
    };

    vm.setup();
  });
