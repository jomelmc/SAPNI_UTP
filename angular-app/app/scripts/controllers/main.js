'use strict';

/**
 * @ngdoc function
 * @name angularAppApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the angularAppApp
 */
angular.module('angularAppApp')
  .controller('MainCtrl', function($state, $http) {

    /** SE DECLARA EL ÁMBITO GLOBAL */
    var vm = this;

    /** INICIALIZAR VALORES */
    vm.state = $state.current.name;
    vm.method = 'POST';
    var actualDate = new Date();
    var date = actualDate.getFullYear() + "-" + (actualDate.getMonth() + 1) + "-" + actualDate.getDate();
    vm.date = moment(date).format('DD/MM/YYYY');
    vm.estudiante = {
      cedulas: [{
        cedula: "",
        ultima_participacion: ""
      }]
    };

    /** FUNCIONES */

    vm.addStudent = function(student) {

      vm.estudiante.cedulas.push({
        cedula: "",
        ultima_participacion: ""
      });

      if (angular.isDefined(vm.estudiante.cedulas[student])) {
        vm.estudiante.cedulas[student].estudiante.cedula = null;
        vm.estudiante.cedulas[student].estudiante.ultima_participacion = null;
      }

      console.log(vm.estudiante);
    };

    vm.eraseStudent = function(student) {

      var i = vm.estudiante.cedulas.indexOf(student);

      if (i != 0) {
        vm.estudiante.cedulas.splice(i, 1);
      }

      console.log(vm.estudiante);
    };

    vm.saveStudent = function() {

      vm.estudiante.fechaSol = date;
      vm.estudiante.hora_fecha = date + " 00:00:00.000";

      vm.estudiante.inicio_evento = moment(vm.inicio_evento).format('YYYY/MM/DD') +
        " 00:00:00.000";
      vm.estudiante.fin_evento = moment(vm.fin_evento).format('YYYY/MM/DD') + " 00:00:00.000";

      vm.inicio_evento = new Date(vm.inicio_evento);
      vm.fin_evento = new Date(vm.fin_evento);

      vm.estudiante.inicio_evento = vm.estudiante.inicio_evento.split("/").join("-");
      vm.estudiante.fin_evento = vm.estudiante.fin_evento.split("/").join("-");

      vm.estudiante.anexo = "-";
      var estudiante = angular.toJson(vm.estudiante);

      console.log(vm.estudiante);

      var wrapper = {

        url: 'https://sapniphp.scalingo.io/auth/solestform',
        method: 'POST',
        headers: {
          "Content-Type": "application/json"
        },
        data: estudiante

      };

      $http(wrapper).

      then(function(response) {
        console.log(response.data.status);
      }, function(response) {
        console.log(response.status);
      });
    };

    vm.setCatalogs = function() {

      vm.catalogs = {};

      var wrapper = {
        url: 'https://sapniphp.scalingo.io/auth/estform',
        method: 'POST'
      };

      $http(wrapper).

      then(function(response) {

        vm.catalogs = response.data.body;
        vm.catalogs.unityAcademy = vm.unityAcademy;

        vm.catalogs.lateParticipateEvent = vm.lateParticipateEvent;
        vm.catalogs.status = response.data.status;

      }, function(response) {

      });


    };

    vm.loginOnSubmit = function() {

      var wrapper = {
        url: 'https://sapniphp.scalingo.io/auth/validateuser',
        method: vm.method,
        data: {
          user: vm.user.id,
          pass: vm.user.password
        }
      };

      $http(wrapper).

      then(function(response) {

        vm.userInformation = {};

        vm.data = response.data.body;
        var status =  response.data.status;

        console.log(vm.data);

        if(status.code == 'U0002'){
          
          vm.showError = true;
          return;

        } else if(angular.isUndefined(vm.data.rol) && status.code != 'U0002'){

          vm.showError = false;
          $state.go("solicitud_apoyo_economico");
          return;
        }

      }, function(response) {

      });

    };

    vm.validateIdentification = function(userId, form) {

      var exist = null;
      var wrapper = {
        url: 'https://sapniphp.scalingo.io/auth/validateest',
        method: vm.method,
        data: {
          cedula: userId
        }
      };

      $http(wrapper).

      then(function(response) {

        exist = response.data.status;

        if(exist.code != "U0000"){
          form.$setValidity('validIdentification', false);
        } else{
          form.$setValidity('validIdentification', true);
        }

      }, function(response) {

      });

    };

    vm.setup = function() {

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