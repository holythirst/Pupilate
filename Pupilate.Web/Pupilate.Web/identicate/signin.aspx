<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signin.aspx.cs" CodeFile="signin.aspx.cs" Inherits="Pupilate.Web.identicate.signin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <title>aui360 - Sign In</title>

    <link rel="shortcut icon" href="img/favicon.png" />

    <meta name="description" content="" />

    <!-- CSS -->
    <link href="css/preload.css" rel="stylesheet" />
    <link href="../assets/css/vendors.css" rel="stylesheet" />
    <link href="../assets/css/syntaxhighlighter/shCore.css" rel="stylesheet" />
    <link href="../assets/css/style-green5.css" rel="stylesheet" title="default" />
    <link href="../assets/css/width-full.css" rel="stylesheet" title="default" />
</head>


<body>
    <div class="paper-back-full">
        <div class="login-form-full">
            <div class="fix-box">
                <div class="text-center title-logo animated fadeInDown animation-delay-5">aui<span>360 <sup>&reg </sup></span>Pupilate</div>
                <div class="text-center animated fadeInDown animation-delay-5">Sign<span> In</span></div>

                <div class="transparent-div no-padding animated fadeInUp animation-delay-8">
                    <ul class="nav nav-tabs nav-tabs-transparent">
                        <li class="active"><a href="#home" data-toggle="tab">Login</a></li>
                        <li><a href="#profile" data-toggle="tab">Register</a></li>
                        <li><a href="#messages" data-toggle="tab">Recovery Pass</a></li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div class="tab-pane active" id="home">
                            <form id="frmLogin" runat="server" role="form">
                                <div class="form-group">
                                    <div class="input-group login-input">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <input type="text" class="form-control" placeholder="Enter Username" />
                                    </div>
                                    <br />
                                    <div class="input-group login-input">
                                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                        <input type="password" class="form-control" placeholder="Enter Password" />
                                    </div>
                                    <div class="checkbox">
                                        <input type="checkbox" id="chkLoginRemember" />
                                        <label for="checkbox_remember">Remember me</label>
                                    </div>
                                    <button type="submit" class="btn btn-ar btn-primary pull-right" id="btnLogin">Login</button>
                                    <div class="clearfix"></div>
                                </div>
                            </form>
                        </div>
                        <div class="tab-pane" id="profile">
                            <form role="form" id="frmRegister" method="post" action="#">
                                <div class="form-group">
                                    <label for="txtRegUserName">User Name<sup>*</sup></label>
                                    <input type="text" class="form-control" id="txtRegUserName" />
                                </div>
                                <div class="form-group">
                                    <label for="txtRegFirstName">First Name</label>
                                    <input type="text" class="form-control" id="txtRegFirstName" />
                                </div>
                                <div class="form-group">
                                    <label for="txtRegLastName">Last Name</label>
                                    <input type="text" class="form-control" id="txtRegLastName" />
                                </div>
                                <div class="form-group">
                                    <label for="txtRegEmail">Email<sup>*</sup></label>
                                    <input type="email" class="form-control" id="txtRegEmail" />
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtRegPassword">Password<sup>*</sup></label>
                                            <input type="password" class="form-control" id="txtRegPassword" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtRegConfirmPassword">Confirm Password<sup>*</sup></label>
                                            <input type="password" class="form-control" id="txtRegConfirmPassword" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" id="chkRegTerm" value="option1" />
                                            I read <a href="#">Terms and Conditions</a>.
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <button type="submit" class="btn btn-ar btn-primary pull-right" id="btnRegister">Register</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="tab-pane" id="messages">
                            <form role="form" id="frmResetPassword" method="post" action="#">
                                <div class="form-group">
                                    <label for="txtResetUserName">User Name<sup>*</sup></label>
                                    <input type="text" class="form-control" id="txtResetUserName" />
                                </div>
                                <div class="form-group">
                                    <label for="txtResetEmail">Email<sup>*</sup></label>
                                    <input type="email" class="form-control" id="txtResetEmail" />
                                </div>
                                <button type="submit" class="btn btn-ar btn-primary pull-right" id="btnSendPassword">Send Password</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="../assets/js/vendors.js"></script>

    <script src="../assets/js/styleswitcher.js"></script>

    <!-- Syntaxhighlighter -->
    <script src="../assets/js/syntaxhighlighter/shCore.js"></script>
    <script src="../assets/js/syntaxhighlighter/shBrushXml.js"></script>
    <script src="../assets/js/syntaxhighlighter/shBrushJScript.js"></script>

    <script src="../assets/js/app.js"></script>
    <script src="../assets/js/home_login_full.js"></script>

</body>
</html>
