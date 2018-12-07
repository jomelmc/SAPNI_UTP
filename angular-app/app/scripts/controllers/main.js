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
    var method = 'POST';
    var url = 'https://sapniphp.scalingo.io/auth/';

    var actualDate = new Date();
    var date = actualDate.getFullYear() + "-" + (actualDate.getMonth() + 1) + "-" + actualDate.getDate();

    vm.date = moment(date).format('DD/MM/YYYY');
    vm.dataUser = JSON.parse(sessionStorage.getItem("dataUser"));
    vm.estudiante = {
      cedulas: [{
        cedula: vm.dataUser.identification,
        ultima_participacion: ""
      }]
    };

    /** FUNCIONES */

    /**
     * ************************************ LOGIN DEL SISTEMA ********************************************************
     */

    vm.loginOnSubmit = function() {

      // vm.status = null;
      // var wrapper = {
      //   url: url + 'validateuser',
      //   method: method,
      //   data: {
      //     user: vm.id,
      //     pass: vm.password
      //   }
      // };

      // $http(wrapper).

      // then(function(response) {

      //   vm.dataUser = response.data.body;

      if (vm.id == "8-888-8888") {

        vm.dataUser = {
          rol: "Estudiante",
          nombre: "Jhoel",
          apellido: "Ramos",
          correo: "jhoel.ramos@utp.ac.pa",
          identification: vm.id

        };

      } else if (vm.id == "mayka@utp.ac.pa") {

        vm.dataUser = {
          rol: "Secretaria",
          nombre: "Maika",
          apellido: "Ramos",
          identification: "mayka@utp.ac.pa"
        };

      }

      sessionStorage.setItem("dataUser", angular.toJson(vm.dataUser));
      //vm.status = response.data.status;

      if (vm.dataUser.rol == "Estudiante") {

        vm.setCatalogs();
        $state.go("solicitud_apoyo_economico");

      } else if (vm.dataUser.rol == "Secretaria") {

        $state.go("bandeja_trabajo");
        vm.getDataRequest();

      }

      // }, function(response) {
      //   vm.status = response.data.status;
      // });

    };

    vm.getDataRequest = function() {

      vm.solicitud = {};
      vm.dataUser = JSON.parse(sessionStorage.getItem("dataUser"));

      var wrapper = {
        url: url + "svform",
        method: method,
        data: {
          correo: vm.dataUser.identification
        }
      };

      $http(wrapper).

      then(function(response) {

        vm.solicitud = response.data.body.solicitudes;

      }, function(response) {

      });

    };

    vm.closeSessionStorage = function() {

      sessionStorage.clear();
      localStorage.clear();

    };

    /**
     * ************************************* FUNCIONES PARA ROL DE ESTUDIANTE *****************************************
     */

    vm.addStudent = function(student) {

      vm.estudiante.cedulas.push({
        cedula: "",
        ultima_participacion: ""
      });

      if (angular.isDefined(vm.estudiante.cedulas[student])) {

        vm.estudiante.cedulas[student].estudiante.cedula = null;
        vm.estudiante.cedulas[student].estudiante.ultima_participacion = null;

      }

    };

    vm.eraseStudent = function(student) {

      var index = vm.estudiante.cedulas.indexOf(student);

      if (index != 0) {
        vm.estudiante.cedulas.splice(index, 1);
      }

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
      vm.estudiante = angular.toJson(vm.estudiante);
      var wrapper = {

        url: url + 'solestform',
        method: method,
        headers: {
          "Content-Type": "application/json"
        },
        data: vm.estudiante

      };

      $http(wrapper).

      then(function(response) {

        console.log(response.status);
        $state.go("formulario_enviado");

      }, function(response) {
        console.log(response.status);
      });
    };

    vm.setCatalogs = function() {

      vm.catalogs = {};

      var wrapper = {
        url: url + 'estform',
        method: method
      };

      $http(wrapper).

      then(function(response) {
          // var response = {
          //   data: {
          //     body: {
          //       tipoEvento: [
          //         {
          //           id: "1",
          //           nombre: "Cultural"
          //       },
          //         {
          //           id: "2",
          //           nombre: "Deportivo"
          //       }
          //   ],
          //       alcanceEvento: [
          //         {
          //           id: "1",
          //           nombre: "Nacional"
          //       },
          //         {
          //           id: "2",
          //           nombre: "Internacional"
          //       }
          //   ],
          //       "proyeccionUtp": [
          //         {
          //           id: "1",
          //           nombre: "Excelente"
          //       },
          //         {
          //           id: "2",
          //           nombre: "Buena"
          //       },
          //         {
          //           id: "3",
          //           nombre: "No tiene"
          //       }
          //   ],
          //       "apoyoSolicitado": [
          //         {
          //           id: "1",
          //           nombre: "Inscripción"
          //       },
          //         {
          //           id: "2",
          //           nombre: "Gastos de viaje"
          //       },
          //         {
          //           id: "3",
          //           nombre: "Apoyo económico parcial"
          //       }
          //   ],
          //       "apoyoPatrocinador": [
          //         {
          //           id: "1",
          //           nombre: "Inscripción"
          //       },
          //         {
          //           id: "2",
          //           nombre: "Gastos de viaje"
          //       },
          //         {
          //           id: "3",
          //           nombre: "Manutención"
          //       },
          //         {
          //           id: "4",
          //           nombre: "Hospedaje"
          //       },
          //         {
          //           id: "5",
          //           nombre: "Apoyo económico parcial"
          //       }
          //   ]
          //     },
          //     status: {
          //       code: "U0000",
          //       codeDesc: "Se ha ejecutado con exito"
          //     }
          //   }
          // };

          vm.catalogs = response.data.body;
          vm.catalogs.unityAcademy = vm.unityAcademy;

          vm.catalogs.lateParticipateEvent = vm.lateParticipateEvent;
          vm.catalogs.status = response.data.status;

        },
        function(response) {

        });

    };


    vm.validateIdentification = function(userId, form) {

      var exist = null;
      var wrapper = {
        url: url + 'validateest',
        method: method,
        data: {
          cedula: userId
        }
      };

      $http(wrapper).

      then(function(response) {

        exist = response.data.status;

        if (exist.code != "U0000") {
          form.$setValidity('validIdentification', false);
        } else {
          form.$setValidity('validIdentification', true);
        }

      }, function(response) {

      });

    };

    /**
     * ************************************* FUNCIONES PARA ROLES ADMINISTRATIVOS ***************************************
     */

    vm.goToApproveRequest = function() {
      $state.go("notificacion_2");
    };

    vm.goToVerifyRequest = function() {
      $state.go("revision_solicitud_visto_bueno");
    };

    vm.approveRequest = function() {

      var dataRequest = JSON.parse(localStorage.getItem("dataRequest"));
      var wrapper = {
        url: url + 'passsvform',
        method: method,
        data: {
          otp: vm.dataUser.otp,
          correo: vm.dataUser.identification,
          id_solicitud: dataRequest.id_solicitud,
          fecha_solicitud: dataRequest.fecha_solicitud
        }
      };

      $http(wrapper).

      then(function(response) {

        $state.go(vm.dataUser.estate);

      }, function(response) {

      });
    };

    vm.backStage = function() {
      $state.go(vm.dataUser.estate);
    };

    vm.getInfoRequest = function() {
      vm.dataRequest = JSON.parse(localStorage.getItem("dataRequest"));
    };

    vm.listTeachers = function() {

      var dataUser = JSON.parse(sessionStorage.getItem("dataUser"));
      var wrapper = {
        url: url + 'rectorform',
        method: method,
        data: {
          otp: dataUser.otp,
          correo: dataUser.identification,
        }
      };

      $http(wrapper).

      then(function(response) {

        localStorage.setItem("listTeachers", angular.toJson(response.data.body.profesores));
        vm.allTeachers = JSON.parse(localStorage.getItem("listTeachers"));

      }, function(response) {

      });

    };

    vm.openRequest = function(request) {

      vm.dataRequest = request;
      var data = JSON.parse(sessionStorage.getItem("dataUser"));

      localStorage.setItem("dataRequest", angular.toJson(vm.dataRequest));

      if (data.rol == "Secretaria") {

        $state.go("revision_solicitud_visto_bueno");

      } else if (data.rol == "Rector") {

        $state.go("asignacion_comision_evaluadora");
        vm.listTeachers();

      } else {

        $state.go("solicitudes_asignadas");

      }

      vm.getInfoRequest();

    }

    /**
     * SETUP INITIAL STATE
     */

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

      if ($state.current.name == "bandeja_trabajo") {
        vm.getDataRequest();
        vm.getInfoRequest();
        vm.listTeachers();
      }


      if ($state.current.name == "solicitud_apoyo_economico") {
        vm.setCatalogs();
      }

    };

    vm.setup();
    console.log(vm.dataUser);

  });