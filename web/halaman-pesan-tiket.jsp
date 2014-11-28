<%-- 
    Document   : halaman-pesan-tiket
    Created on : Nov 10, 2014, 11:16:14 PM
    Author     : Lorencius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%if (session.getAttribute("username") != null) {
            if (session.getAttribute("role").equals("Admin")) {
                out.print("<script>");
                out.print("alert(\"Your current session login as Administrator, ");
                out.print("we will now redirecting you to Administrator Home\");");
                out.print("window.location = 'halaman-utama-admin.jsp';");
                out.print("</script>");
            }
        } else {
            out.print("<script>");
            out.print("alert(\"You don't have permission to access this page\");");
            out.print("window.location = 'home.jsp'");
            out.print("</script>");
        }

        if (request.getParameter("logout") != null) {
            session.removeAttribute("username");
            session.removeAttribute("password");
            session.removeAttribute("name");
            session.removeAttribute("role");
            session.invalidate();
            response.sendRedirect("home.jsp");
            return;
        }
    %>
    <head>
        <title>Pesan Tiket</title>
        <link rel="shortcut icon" href="img/OM-Item_Logo.png" type="image/png">
        <link href="Semantic-UI-1.0.0/dist/semantic.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <!--Menu bar-->
        <div class="ui fixed top menu">
            <div class="ui container">
                <a class="active item" href="halaman-pesan-tiket.jsp">
                    <i class="ticket icon"></i> JUAL TIKET
                </a>
                <a class="item" href="halaman-cetak-tiket.jsp">
                    <i class="print icon"></i> CETAK TIKET
                </a>
                <div class="right menu">
                    <form method="POST">
                        <div class="ui dropdown link item">
                            <i class="user icon"></i> OPERATOR <i class="dropdown icon"></i>
                            <div class="menu">
                                <table class="ui very basic table">
                                    <tr>

                                        <td>Nama</td>
                                        <td>${name}</td>
                                    </tr>
                                    <tr>
                                        <td>ID</td>
                                        <td>${username}</td>
                                    </tr>
                                </table>
                                <a class="item" href="halaman-pesan-tiket.jsp?logout=yes"><i class="sign out icon"></i>Logout</a>
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
        <script src="Semantic-UI-1.0.0/dist/jquery-2.1.1.js" type="text/javascript"></script>
        <script src="Semantic-UI-1.0.0/dist/semantic.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('.ui.dropdown').dropdown({on: 'hover'});
            });
        </script>
    </body>
</html>