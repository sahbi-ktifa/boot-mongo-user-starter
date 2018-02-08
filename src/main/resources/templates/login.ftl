<#import "/spring.ftl" as spring/>
<!doctype html>
<html>
<head>
    <title>Boot User Starter</title>
    <link rel="stylesheet" type="text/css" href="/webjars/bootstrap/3.3.7-1/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/webjars/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<body>
<div class="container">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3" ng-app="LoginApp" ng-controller="LoginCtrl">
                 <#if error??>
                    <div class="notif alert alert-danger" ng-if="!success">Unknown user or incorrect password.</div>
                 </#if>
                <div class="notif alert alert-danger" ng-if="error" ng-click="clearError()">{{error}}</div>
                <div class="notif alert alert-success" ng-if="success" ng-click="clearSuccess()">{{success}}</div>
                <div class="panel panel-login">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-6" ng-click="registerTab = false">
                                <a href="#" ng-class="{'active': !registerTab  || registerTab === false}">Connection</a>
                            </div>
                            <div class="col-xs-6" ng-click="registerTab = true">
                                <a href="#" ng-class="{'active': registerTab === true}">Register</a>
                            </div>
                        </div>
                        <hr>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form name="loginForm" role="form" action="/login" method="post" ng-if="!registerTab">
                                    <div class="form-group">
                                        <input type="text" name="username" tabindex="1" class="form-control" placeholder="{{'Username'}}" required="required">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password" tabindex="2" class="form-control" placeholder="{{'Password'}}" required="required">
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-sm-6 col-sm-offset-3">
                                                <input type="submit" name="login-submit" ng-disabled="loginForm.$invalid" id="login-submit" tabindex="4"
                                                       class="form-control btn btn-success" value="{{'Log In'}}">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <form name="registerForm" role="form" action="/register" method="post" ng-if="registerTab">
                                    <div class="form-group">
                                        <input type="text" name="username" tabindex="1" class="form-control" ng-minlength="4"
                                               placeholder="{{'Username'}}" required="required">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password" tabindex="2"
                                               class="form-control" placeholder="{{'Password'}}" ng-minlength="6" required="required">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="confirm" id="confirm-password"
                                               tabindex="3" class="form-control" placeholder="{{'Confirm Password'}}" required="required">
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-sm-6 col-sm-offset-3">
                                                <input type="submit" ng-disabled="registerForm.$invalid || form.password !== form.confirm"
                                                       name="register-submit" id="register-submit" tabindex="5" class="form-control btn btn-primary" value="{{'Register'}}">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="webjars/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="webjars/angularjs/1.6.6/angular.min.js"></script>
<script type="text/javascript" src="webjars/angularjs/1.6.6/angular-resource.min.js"></script>
<script type="text/javascript" src="/js/login/app.js"></script>
<script type="text/javascript" src="/js/login/controllers.js"></script>
</body>
</html>