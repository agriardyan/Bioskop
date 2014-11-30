<%-- 
    Document   : halaman-daftar-penayangan-film
    Created on : Nov 13, 2014, 10:23:25 PM
    Author     : Lorencius
--%>

<%@page import="com.rplo.bioskop.model.DataPegawai"%>
<%@page import="com.rplo.bioskop.model.Film"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
//        if (session.getAttribute("username") != null) {
//            if (session.getAttribute("role").equals("Admin")) {
//                response.sendRedirect("halaman-utama-admin.jsp");
//            } else if (session.getAttribute("role").equals("Operator")) {
//                response.sendRedirect("halaman-utama-operator.jsp");
//            }
//        }

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
        <title>Daftar Tayang</title>
        <link rel="shortcut icon" href="img/OM-Item_Logo.png" type="image/png">
        <link href="Semantic-UI-1.0.0/dist/semantic.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <!--Login Sidebar-->
        <div class="ui right vertical sidebar menu" id="loginSidebar">
            <div class="item">
                <form class="ui form basic segment" method="POST">
                    <div class="field">
                        <div class="ui left icon input">
                            <input name="username" id="user" type="text" placeholder="Username">
                            <i class="user icon"></i>
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <input name="password" id="pass" type="password" placeholder="Password">
                            <i class="lock icon"></i>
                        </div>
                    </div>
                    <div class="field">
                        <label>Connect as</label>
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

        <div class="pusher">
            <!--Menu bar-->
            <div class="ui fixed top red inverted menu">
                <div class="container">
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
            </div>
            <!--End of Menu bar-->

            <!--Main body-->
            <h3 class="ui top center aligned attached red header">Now Playing</h3>
            <div class="ui basic segment attached">
                <div class="ui six doubling cards">
                    <%
                        List<Film> film = Film.getDataList();
                        for (int i = 0; i < film.size(); i++) {
                            String judul = film.get(i).getmJudulFilm();
                    %>
                    <div class="card">
                        <div class="dimmable image">
                            <div class="ui dimmer">
                                <div class="content">
                                    <div class="center">
                                        <button class="ui inverted button <%=i%>">Show Info</button>
                                    </div>
                                </div>
                            </div>
                            <img src="img/11.jpg">
                        </div>
                        <div class="extra">
                            <%=judul%>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
            <%
                for (int i = 0; i < film.size(); i++) {
                    String judul = film.get(i).getmJudulFilm();
            %>
            <div class="ui modal <%=i%>">
                <i class="close icon"></i>
                <div class="header">
                    <%=judul%>
                </div>
                <div class="content">
                    <div class="ui small image">
                        <img src="img/11.jpg">
                    </div>
                    <div class="description">
                    </div>
                </div>
            </div>
            <%}%>
        </div>
        <!--Script-->
        <script src="Semantic-UI-1.0.0/dist/jquery-2.1.1.js" type="text/javascript"></script>
        <script src="Semantic-UI-1.0.0/dist/semantic.js" type="text/javascript"></script>
        <script type="text/javascript">
            <%
                for (int i = 0; i < film.size(); i++) {
            %>
            $('.ui.modal.<%=i%>')
                    .modal('attach events', '.ui.inverted.button.<%=i%>', 'show');
            <%}%>
            $(document).ready(function() {
                //Login button handler
                $("#loginButton").click(function() {
                    $("#loginSidebar")
                            .sidebar('setting', {
                                overlay: true
                            }).sidebar('toggle');
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
                    }
                }, {
                    on: 'submit',
                    inline: 'true'
                });

                $('.six.doubling.cards .image').dimmer({
                    on: 'hover'
                });
            });
        </script>
    </body>
</html>
