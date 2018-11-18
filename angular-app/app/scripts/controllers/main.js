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

        var userRole = vm.data.rol;
        if (userRole == "Estudiante") {
          $state.go("solicitud_apoyo_economico");
        }

      }, function (response) {

        // $scope.data = response.data || 'Request failed';
        // $scope.status = response.status;

      });

    };

    vm.setup = function () {

      // vm.user = {
      //   entityId: '3425',
      //   entityType: 'ESTUDIANTE',
      // };

      // vm.data = {
      //   completeName: 'Michelle Sosa Rodriguez',
      //   stateRequest: 'EN SOLICITUD',
      //   event: 'Olimpiadas interuniversitarias'
      // }
    };

    vm.setup();
  });
