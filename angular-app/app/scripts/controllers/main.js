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
    var actualDate = new Date();
    var date = actualDate.getFullYear() + "-" + (actualDate.getMonth() + 1) + "-" + actualDate.getDate();
    vm.date = moment(date).format('DD/MM/YYYY');
    vm.estudiante = {};

    /** FUNCIONES */

    vm.saveStudent = function () {

      vm.estudiante.cedulas = [
        {cedula: '8-888-8888', ultima_participacion: vm.estudiante.ultima_participacion}
      ];

      vm.estudiante.fechaSol = date;
      vm.estudiante.hora_fecha = date + " 12:35:29.123";

      vm.estudiante.inicio_evento = moment(vm.inicio_evento).format('YYYY/MM/DD') + " 12:35:29.123";
      vm.estudiante.fin_evento = moment(vm.fin_evento).format('YYYY/MM/DD') + " 12:35:29.123";

      vm.inicio_evento = new Date(vm.inicio_evento);
      vm.fin_evento = new Date(vm.fin_evento);

      vm.estudiante.inicio_evento = vm.estudiante.inicio_evento.split("/").join("-");
      vm.estudiante.fin_evento = vm.estudiante.fin_evento.split("/").join("-");

      vm.estudiante.anexo = "-";
      console.log(vm.estudiante);

      var wrapper = {
        url: 'https://sapniphp.scalingo.io/auth/solestform',
        method: 'POST',
        data: vm.estudiante
      };

      $http(wrapper).

      then(function (response) {
        console.log(response.data);
      }, function (response) {
        console.log(response.data);
      });
    };

    vm.setCatalogs = function () {

      vm.catalogs = {};

      var wrapper = {
        url: 'https://sapniphp.scalingo.io/auth/estform',
        method: 'POST'
      };

      $http(wrapper).

      then(function (response) {

        vm.catalogs = response.data.body;
        vm.catalogs.unityAcademy = vm.unityAcademy;

        vm.catalogs.lateParticipateEvent = vm.lateParticipateEvent;
        vm.catalogs.status = response.data.status;

        console.log(vm.catalogs);

      }, function (response) {

      });


    };

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

        if (angular.isUndefined(vm.data.body.rol)) {
          $state.go("solicitud_apoyo_economico");
        }

      }, function (response) {

      });

    };

    vm.setup = function () {

      vm.unityAcademy = [{
          id: '1',
          name: 'FACULTAD DE ING. EN SIS.'
        },
        {
          id: '2',
          name: 'FACULTAD DE INDUSTRIAL'
        },
        {
          id: '3',
          name: 'FACULTAD DE ING. ELECTRICA'
        },
        {
          id: '4',
          name: 'FACULTAD DE ING. MECÁNICA'
        },
        {
          id: '5',
          name: 'FACULTAD DE ING. CIVIL'
        },
        {
          id: '6',
          name: 'FACULTAD DE CIENCIAS Y TEC.'
        },
      ];

      vm.lateParticipateEvent = [{
          id: '1',
          name: 'En menos de 1 mes'
        },
        {
          id: '2',
          name: 'Hace 1 semestre'
        },
        {
          id: '3',
          name: 'Hace 1 año'
        },
        {
          id: '3',
          name: 'Hace más de 1 año'
        }
      ];

      vm.setCatalogs();
    };

    vm.setup();
  });
