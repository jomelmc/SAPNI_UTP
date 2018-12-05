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
    vm.estudiante = {
      cedulas: [{
        cedula: "",
        ultima_participacion: ""
      }]
    };

    /** FUNCIONES */

    /**
     * ************************************ LOGIN DEL SISTEMA ********************************************************
     */

    vm.loginOnSubmit = function () {

      vm.status = null;
      var wrapper = {
        url: 'https://sapniphp.scalingo.io/auth/validateuser',
        method: vm.method,
        data: {
          user: vm.id,
          pass: vm.password
        }
      };

      $http(wrapper).

      then(function (response) {

        vm.dataUser = response.data.body;
        vm.status = response.data.status;

        if (angular.isUndefined(vm.dataUser.rol) && vm.status.code == 'U0000') {

          vm.setCatalogs();
          $state.go(vm.dataUser.estado);

        } else if (vm.status.code == 'U0000') {

          $state.go(vm.dataUser.estate);

        }

      }, function (response) {
        vm.status = response.data.status;
      });

    };

    vm.getDataRequest = function () {

      var wrapper = {
        url: 'https://sapniphp.scalingo.io/auth/svform',
        method: vm.method,
        data: {
          otp: vm.dataUser.otp,
          correo: vm.id
        }
      };

      $http(wrapper).

      then(function (response) {

        vm.solicitud = response.data.body.solicitudes;

      }, function (response) {

      });

      return vm.dataUser.solicitudes;
    };

    /**
     * ************************************* FUNCIONES PARA ROL DE ESTUDIANTE *****************************************
     */

    vm.addStudent = function (student) {

      vm.estudiante.cedulas.push({
        cedula: "",
        ultima_participacion: ""
      });

      if (angular.isDefined(vm.estudiante.cedulas[student])) {

        vm.estudiante.cedulas[student].estudiante.cedula = null;
        vm.estudiante.cedulas[student].estudiante.ultima_participacion = null;

      }

    };

    vm.eraseStudent = function (student) {

      var index = vm.estudiante.cedulas.indexOf(student);

      if (index != 0) {
        vm.estudiante.cedulas.splice(index, 1);
      }

    };

    vm.saveStudent = function () {

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
      vm.estudiante = angular.toJson(vm.estudiante);
      var wrapper = {

        url: 'https://sapniphp.scalingo.io/auth/solestform',
        method: vm.method,
        headers: {
          "Content-Type": "application/json"
        },
        data: vm.estudiante

      };

      $http(wrapper).

      then(function (response) {

        console.log(response.status);
        $state.go("formulario_enviado");

      }, function (response) {
        console.log(response.status);
      });
    };

    vm.setCatalogs = function () {

      vm.catalogs = {};

      var wrapper = {
        url: 'https://sapniphp.scalingo.io/auth/estform',
        method: vm.method
      };

      $http(wrapper).

      then(function (response) {

        vm.catalogs = response.data.body;
        vm.catalogs.unityAcademy = vm.unityAcademy;

        vm.catalogs.lateParticipateEvent = vm.lateParticipateEvent;
        vm.catalogs.status = response.data.status;

      }, function (response) {

      });

    };


    vm.validateIdentification = function (userId, form) {

      var exist = null;
      var wrapper = {
        url: 'https://sapniphp.scalingo.io/auth/validateest',
        method: vm.method,
        data: {
          cedula: userId
        }
      };

      $http(wrapper).

      then(function (response) {

        exist = response.data.status;

        if (exist.code != "U0000") {
          form.$setValidity('validIdentification', false);
        } else {
          form.$setValidity('validIdentification', true);
        }

      }, function (response) {

      });

    };

    /**
     * ************************************* FUNCIONES PARA ROL DE PROFESOR ***************************************
     */

    vm.openRequest = function (request) {

      vm.dataRequest = request;
      $state.go("historial_solicitud");
    }

    /**
     * SETUP INITIAL STATE
     */

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

      vm.solicitudes = [{

          id_solicitud: "26",
          fecha_solicitud: "2018-11-24",
          id_estudiante: "99",
          evento: "Olimpiadas de Minecraft",
          lugar: "En mi casa",
          justificacion: "Yo quiero ese dinero porque sí.",
          anexo: "-",
          visto_bueno: "F",
          etapa: "EN SOLICITUD",
          hora_fecha: "2007-05-08 12:35:29",
          id_comision: null,
          inicio_evento: "2007-05-08 12:35:29",
          fin_evento: "2007-05-08 12:35:29",
          id_tipo_evento: {
            nombre: "Deportivo"
          },
          id_alcance_evento: {
            nombre: "Internacional"
          },
          id_apoyo_ofrecido: {
            nombre: "Gastos de viaje"
          },
          id_apoyo_posible: null,
          id_apoyo_solicitado: {
            nombre: "Inscripción"
          },
          id_proyeccion_utp: {
            nombre: "Excelente"
          },
          estudiantes: [{
              nombre: "Jhoel",
              apellido: "Ramos",
              cedula: "8-888-8888"
            },
            {
              nombre: "Jomel",
              apellido: "McDonald",
              cedula: "7-777-7777"
            }
          ]
        },
        {

          id_solicitud: "26",
          fecha_solicitud: "2018-11-24",
          id_estudiante: "99",
          evento: "Olimpiadas de Minecraft",
          lugar: "En mi casa",
          justificacion: "Yo quiero ese dinero porque sí.",
          anexo: "-",
          visto_bueno: "F",
          etapa: "EN SOLICITUD",
          hora_fecha: "2007-05-08 12:35:29",
          id_comision: null,
          inicio_evento: "2007-05-08 12:35:29",
          fin_evento: "2007-05-08 12:35:29",
          id_tipo_evento: {
            nombre: "Deportivo"
          },
          id_alcance_evento: {
            nombre: "Internacional"
          },
          id_apoyo_ofrecido: {
            nombre: "Gastos de viaje"
          },
          id_apoyo_posible: null,
          id_apoyo_solicitado: {
            nombre: "Inscripción"
          },
          id_proyeccion_utp: {
            nombre: "Excelente"
          },
          estudiantes: [{
              nombre: "Jhoel",
              apellido: "Ramos",
              cedula: "8-888-8888"
            },
            {
              nombre: "Jomel",
              apellido: "McDonald",
              cedula: "7-777-7777"
            }
          ]
        }
      ];

      if (angular.isDefined(vm.dataUser)) {
        vm.getDataRequest();
      }

      if ($state.current.name == "solicitud_apoyo_economico") {
        vm.setCatalogs();
      }

    };

    vm.setup();
    console.log(vm.dataUser);

  });
