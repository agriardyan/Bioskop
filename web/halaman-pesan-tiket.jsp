<%-- 
    Document   : halaman-pesan-tiket
    Created on : Nov 10, 2014, 11:16:14 PM
    Author     : Lorencius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        if (request.getParameter("logoutAd") != null) {
            session.removeAttribute("mName");
            session.removeAttribute("mUsername");
            session.invalidate();
            response.sendRedirect("home.jsp");
            return;
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OM-ITEM</title>
        <link rel="shortcut icon" href="img/OM-Item_Logo.png" type="image/png">
        <link href="semantic-ui/packaged/css/semantic.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="ui container">
            <!--Menu bar-->
            <div class="ui menu">
                <div class="right menu">
                    <form method="POST">
                        <div class="ui selection dropdown link item">
                            <i class="user icon"></i> MEMBER <i class="dropdown icon"></i>
                            <div class="menu">
                                <table class="ui basic table">
                                    <tr>
                                        <td>Nama</td>
                                        <td><%out.print(session.getAttribute("mName"));%></td>
                                    </tr>
                                    <tr>
                                        <td>ID</td>
                                        <td><%out.print(session.getAttribute("mUsername"));%></td>
                                    </tr>
                                </table>
                                <input class="ui fluid tiny submit button" type="submit" name="logoutAd" value="Logout">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--End of Menu bar-->

        <!--Main body-->

        <!--End of Main body-->

        <!--Script-->
        <script src="semantic-ui/packaged/javascript/jquery-2.1.1.js" type="text/javascript"></script>
        <script src="semantic-ui/packaged/javascript/semantic.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('.ui.dropdown')
                        .dropdown();
            });
        </script>
    </body>
</html>
