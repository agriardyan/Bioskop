<%-- 
    Document   : halaman-signin-member
    Created on : Nov 13, 2014, 9:26:57 PM
    Author     : Lorencius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OM-ITEM</title>
        <link rel="shortcut icon" href="img/OM-Item_Logo.png" type="image/png">
        <link href="semantic-ui/packaged/css/semantic.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <!--Menu bar-->
        <div class="ui menu">
            <a class="item" href="home.jsp">
                <i class="home icon"></i> HOME
            </a>
            <a class="item" href="halaman-daftar-penayangan-film.jsp">
                <i class="video icon"></i> NOW PLAYING
            </a>
            <a class="active item" href="halaman-signin-member.jsp">
                <i class="user icon"></i> M-TIX
            </a>
        </div>
        <!--End of Menu bar-->

        <!--Main body-->
        <p>You have to sign in. <br> Fill the form with your User ID and Password if you are already a member of our M-TIX program
            then do sign in by clicking the Sign in button. <br> For further information you can read our FAQ, and if you are facing a problem please contact 
            our Administrator.
        </p>
        <div class="ui grid">
            <div class="four wide column">
                <h4 class="ui top center aligned attached inverted red block header">
                    SIGN IN
                </h4>
                <div class="ui form segment attached" id="mtixSignin">
                    <div class="field">
                        <div class="ui blue ribbon label">Username</div>
                        <div class="ui left labeled icon input">
                            <input id="username" type="text">
                            <i class="user icon"></i>
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui blue ribbon label">Password</div>
                        <div class="ui left labeled icon input">
                            <input id="password" type="password">
                            <i class="lock icon"></i>
                        </div>
                    </div>
                    <div class="inline field">
                        <div class="ui checkbox">
                            <input id="remember" type="checkbox">
                            <label for="remember"> Remember me </label>
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui tiny red submit button"> Sign in </div>
<!--                        <div class="ui error message"></div>-->
                    </div>
                </div>
            </div>
        </div>
        <!--End of Main body-->

        <!--Script-->
        <script src="semantic-ui/packaged/javascript/jquery-2.1.1.js" type="text/javascript"></script>
        <script src="semantic-ui/packaged/javascript/semantic.js" type="text/javascript"></script>
        <script type="text/javascript">
            //Reset login sidebar value when reload
            var originalState = $('#mtixSignin').clone();
            $('#mtixSignin').replaceWith(originalState);

            $(document).ready(function() {
                $("#mtixSignin").form({
                    username: {
                        identifier: 'username',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Please enter a username'
                            }
                        ]
                    },
                    password: {
                        identifier: 'password',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Please enter a password'
                            }
                        ]
                    }
                }, {
                    on: 'blur',
                    inline: 'true'
                });
            });
        </script>
    </body>
</html>
