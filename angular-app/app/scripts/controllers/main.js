'use strict';

/**
 * @ngdoc function
 * @name angularAppApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the angularAppApp
 */
angular.module('angularAppApp')
  .controller('MainCtrl', function ($state, $http) {

    /** SE DECLARA EL ÁMBITO GLOBAL */
    var vm = this;

    /** INICIALIZAR VALORES */
    vm.state = $state.current.name;
    vm.method = 'POST';

    /** FUNCIONES */
    vm.loginOnSubmit = function () {

      var wrapper = {
        url: 'https://sapniphp.scalingo.io/auth/validateuser',
        method: vm.method,
        data: {
          user: vm.user.id,
          pass: vm.user.password
        }
      };

      $http(wrapper).

      then(function (response) {

        vm.userInformation = {};

        vm.data = response.data;
        console.log(vm.data);

        vm.data.rol;
        if (angular.isUndefined(vm.data.body.rol)) {
          $state.go("solicitud_apoyo_economico");
        }

      }, function (response) {

      });

    };

    vm.setup = function () {

    };

    vm.setup();
  });
