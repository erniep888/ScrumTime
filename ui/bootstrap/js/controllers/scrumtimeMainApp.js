var scrumtimeMainApp = angular.module('scrumtimeMainApp', ['ngRoute']);

scrumtimeMainApp.config(function ($routeProvider) {
    $routeProvider
        .when('/identify',
        {
            controller: 'identifyController',
            templateUrl: 'partials/identify/index.html'
        })
        .when('/plan',
        {
            controller: 'planController',
            templateUrl: 'partials/plan/index.html'
        })
        .otherwise(
        {
            redirectTo: '/identify'
        })
});

var controllers = {};

controllers.identifyController = function ($scope) {
    $scope.items = [
        { projectId: '345', projectName: 'Test Project'},
        { projectId: '1234', projectName: 'Test #2 Project'}
    ];
};

controllers.planController = function ($scope) {
    $scope.backlog = [
        { itemId: '123', itemType: 'Epic', itemTitle: 'Create UI'},
        { itemId: '124', itemType: 'Story', itemTitle: 'Build html wireframe for login'}
    ];
};

scrumtimeMainApp.controller(controllers);