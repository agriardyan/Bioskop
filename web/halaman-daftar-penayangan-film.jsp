<%-- 
    Document   : halaman-daftar-penayangan-film
    Created on : Nov 13, 2014, 10:23:25 PM
    Author     : Lorencius
--%>

<%@page import="com.rplo.bioskop.model.DataPegawai"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        if (session.getAttribute("username") != null) {
            if (session.getAttribute("role").equals("Admin")) {
                response.sendRedirect("halaman-utama-admin.jsp");
            } else if (session.getAttribute("role").equals("Operator")) {
                response.sendRedirect("halaman-utama-operator.jsp");
            }
        }

        if (null != request.getParameter("commit")) {
            session = request.getSession(true);
            session.setMaxInactiveInterval(60 * 60 * 24);
            int login = DataPegawai.validateLoginCredential(request.getParameter("username"), request.getParameter("password"), request.getParameter("commit"));
            switch (login) {
                case 0:
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert(\"Unregistered username\");");
                    out.print("</script>");
                    break;
                case 1:
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert(\"Username or Password or Role was incorrect\");");
                    out.print("</script>");
                    break;
                case 2:
                    session.setAttribute("role", "Operator");
                    session.setAttribute("name", request.getParameter("username"));
                    session.setAttribute("username", request.getParameter("username"));
                    response.sendRedirect("halaman-utama-operator.jsp");
                    break;
                case 3:
                    session.setAttribute("role", "Admin");
                    session.setAttribute("name", request.getParameter("username"));
                    session.setAttribute("username", request.getParameter("username"));
                    response.sendRedirect("halaman-utama-admin.jsp");
                    break;
                default:
                    System.err.println("ENTER DEFAULT");
                    break;
            }
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OM-ITEM</title>
        <link rel="shortcut icon" href="img/OM-Item_Logo.png" type="image/png">
        <link href="semantic-ui/packaged/css/semantic.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="ui container" style="min-width: 800px">
            <!--Menu bar-->
            <div class="ui menu">
                <a class="item" href="home.jsp">
                    <i class="home icon"></i> HOME
                </a>
                <a class="active item" href="halaman-daftar-penayangan-film.jsp">
                    <i class="video icon"></i> NOW PLAYING
                </a>
                <a class="item" href="halaman-signin-member.jsp">
                    <i class="user icon"></i> M-TIX
                </a>
                <div class="right menu">
                    <a class="item" id="loginButton">
                        <i class="sign in icon"></i> LOGIN
                    </a>
                </div>
            </div>
            <!--End of Menu bar-->

            <!--Login Sidebar-->
            <div class="ui black small floating vertical right sidebar menu" id="loginSidebar">
                <div class="item">
                    <form class="ui form segment" method="POST">
                        <div class="field">
                            <div class="ui blue ribbon label">Username</div>
                            <div class="ui left labeled icon input">
                                <input name="username" id="username" type="text" placeholder="Username">
                                <i class="user icon"></i>
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui blue ribbon label">Password</div>
                            <div class="ui left labeled icon input">
                                <input name="password" id="password" type="password" placeholder="Password">
                                <i class="lock icon"></i>
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui two fluid red tiny buttons">
                                <input class="ui button" type="submit" name="commit" value="ADMIN">
                                <div class="or"></div>
                                <input class="ui button" type="submit" name="commit" value="OPERATOR">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!--End of Login Sidebar-->

            <!--Main body-->

            <!--End of Main body-->

            <!--Script-->
            <script src="semantic-ui/packaged/javascript/jquery-2.1.1.js" type="text/javascript"></script>
            <script src="semantic-ui/packaged/javascript/semantic.js" type="text/javascript"></script>
            <script type="text/javascript">
                $(document).ready(function() {                    
                    //Login button handler
                    $("#loginButton").click(function() {
                        $("#loginSidebar")
                                .sidebar('toggle');
                    });

                    //Login sidebar error prompt
                    $("#sideLogin").form({
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
                        },
                        dropdownValue: {
                            identifier: 'role',
                            rules: [
                                {
                                    type: 'empty',
                prompt: 'Please choose a role'
                    }]
                    }
                    }, {
                        on: 'blur',
                        inline: 'true'
                    });             });
            </script>
    </body>
</html>
