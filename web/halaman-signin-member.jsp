<%-- 
    Document   : halaman-signin-member
    Created on : Nov 13, 2014, 9:26:57 PM
    Author     : Lorencius
--%>

<%@page import="com.rplo.bioskop.model.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        if (session.getAttribute("mName") != null) {
            response.sendRedirect("halaman-pesan-tiket.jsp");
        }

        if (null != request.getParameter("commit")) {
            session = request.getSession(true);
            session.setMaxInactiveInterval(60 * 60 * 24);
            boolean login = Member.validateLoginCredential(request.getParameter("username"), request.getParameter("password"));
            if (login == true) {
                session.setAttribute("mName", request.getParameter("username"));
                session.setAttribute("mUsername", request.getParameter("username"));
                response.sendRedirect("halaman-pesan-tiket.jsp");
            } else {
                out.print("<script type=\"text/javascript\">");
                out.print("alert(\"Username or Password was incorrect\");");
                out.print("</script>");
            }
        }
    %>
    <head>
        <title>Sign in M-Tix</title>
        <link rel="shortcut icon" href="img/OM-Item_Logo.png" type="image/png">
        <link href="semantic-ui/packaged/css/semantic.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <!--Menu bar-->
        <div class="container">
            <div class="ui red inverted menu">
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
        </div>
        <!--End of Menu bar-->

        <!--Main body-->
        <div class="main container">
            <div class="ui error message">
                <div class="header">
                    You have to sign in
                </div>
                <p>Fill the form with your User ID and Password if you are already a member of our M-TIX program
                    then do sign in by clicking the Sign in button. <br> If you are facing a problem please contact 
                    our Administrator.
                </p>
            </div>
            <div class="ui grid">
                <div class="four wide column">
                    <h4 class="ui top center aligned attached inverted red block header">
                        SIGN IN
                    </h4>
                    <form class="ui form segment attached" id="mtixSignin">
                        <div class="field">
                            <div class="ui blue ribbon label">Username</div>
                            <div class="ui left labeled icon input">
                                <input name="username" type="text" placeholder="Username">
                                <i class="user icon"></i>
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui blue ribbon label">Password</div>
                            <div class="ui left labeled icon input">
                                <input name="password" type="password" placeholder="Password">
                                <i class="lock icon"></i>
                            </div>
                        </div>
                        <div class="field">
                            <input class="ui tiny red submit button" type="submit" name="commit" value="Sign in">
                        </div>
                    </form>
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
                                prompt: 'Masukkan username'
                            }
                        ]
                    },
                    password: {
                        identifier: 'password',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Masukkan password'
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
