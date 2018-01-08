(function(angular) {
    var LoginController = function($scope) {
        $scope.error = undefined;
        $scope.success = undefined;
        $scope.registerTab = false;

        $scope.clearSuccess = function () {
            $scope.success = undefined;
        };

        $scope.clearError = function () {
            $scope.error = undefined;
        };

        $scope.$on('successOccurred', function (event, arg) {
            $scope.success = arg;
            $scope.registerTab = false;
        });

        $scope.$on('errorOccurred', function (event, arg) {
            $scope.error = arg;
        });
    };

    angular.module("LoginApp.controllers").controller("LoginCtrl", LoginController);
}(angular));