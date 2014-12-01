var khoiApp = angular.module("khoiApp", ["AngularSocketIO", "ngRoute", "ui.bootstrap"]);

// config routing
khoiApp.config(function($routeProvider){
  $routeProvider
  //route for home page
  .when('/', {
        templateUrl : 'pages/main.html',
        controller  : 'MainController'
    })
    .when('/about', {
        templateUrl : 'pages/about.html',
        controller  : 'aboutController'
    })
    .when('/contact', {
        templateUrl : 'pages/contact.html',
        controller  : 'contactController'
    })
    .when('/privateRoom', {
        templateUrl : '/index1.html',
        controller  : 'ChattController'
    })
});


// main controller
khoiApp.controller("MainController", function($scope){
  $scope.welcome = 'Everyone come and see how good I look!';
});

khoiApp.controller('aboutController', function($scope) {
        $scope.message = 'Look! I am an about page.';
});

khoiApp.controller('contactController', function($scope) {
    $scope.message = 'Contact us! JK. This is just a demo.';
});


khoiApp.controller("ProductController", ["$scope", "$http", function($scope, $http) {
	$scope.products = [];

	$http.get("http://localhost:3000/products.json").
	  success(function(data, status, headers, config) {
	    console.log(data);
			$scope.products = data;
	  }).
	  error(function(data, status, headers, config) {
	    console.error("Something is wrong");
	  });
}]);

//chat app
khoiApp.controller("ChatAllController", ["$scope", "socket", "$window", function($scope, socket, $window) {
   $scope.messages = [];

    //everything in here happens when I click the send button
    $scope.sendMessage = function() {
      var message = {
        user: "",
        text: $scope.chatmessage
      };
      //this chatmessage has been binded to chatbox via ng-model
      //we sets the field blank and add its content to messages[]
      $scope.chatmessage = '';
      // $scope.messages.push(message);

      //As a client, send a socket to server
      socket.emit("sendchat", message.text);
    };

    //check if current room is main room
    socket.emit('checkRoom', 'checking');
    socket.on('checkRoom', function(currentRoom){
      if (currentRoom != 'mainRoom'){
        console.log('server returns current room: ' + currentRoom);
        socket.emit('newRoom', 'mainRoom');
      }
    });

    $scope.newRoom = function(){
      socket.emit('newRoom', prompt("Choose a room number and give it to your friend [1..100]"));
    };

    socket.on('connect', function(){
      // call the server-side function 'adduser' and send one parameter (value of prompt)
      socket.emit('addUser', prompt("What's your name?"));
    });

    // listener, whenever the server emits 'updatechat', this updates the chat body
    socket.on('updatechat', function(username, data) {
      var message={user: username, text: data};
      $scope.messages.push(message);
    });

    socket.on("server respond", function(msg){
      $scope.messages.push(msg);
    });
}]);

//chat app
khoiApp.controller("ChatController", ["$scope", "socket", "$window", "$location", function($scope, socket, $window, $location) {
   $scope.messages = [];
   $scope.id=(/rides\/(\d+)/.exec($location.absUrl())[1]);

    //everything in here happens when I click the send button
    $scope.sendMessage = function() {
      var message = {
        user: "",
        text: $scope.chatmessage
      };
      //this chatmessage has been binded to chatbox via ng-model
      //we sets the field blank and add its content to messages[]
      $scope.chatmessage = '';
      // $scope.messages.push(message);

      //As a client, send a socket to server
      socket.emit("sendchat", message.text);
    };

    //default new room to 12
    socket.emit('newRoom', $scope.id);

    socket.on('connect', function(){
      // call the server-side function 'adduser' and send one parameter (value of prompt)
      socket.emit('addUser', prompt("What's your name?"));
    });

    // listener, whenever the server emits 'updatechat', this updates the chat body
    socket.on('updatechat', function(username, data) {
      var message={user: username, text: data};
      $scope.messages.push(message);
    });

    socket.on("server respond", function(msg){
      $scope.messages.push(msg);
    });
}]);

khoiApp.directive('ngEnter', function(){
    return function (scope, element, attrs){
      element.bind("keydown keypress", function(event){
        if(event.which === 13){
          scope.$apply(function (){
            scope.$eval(attrs.ngEnter);
          });

          event.preventDefault();
        }
      });
    };
});
