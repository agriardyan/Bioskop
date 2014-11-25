<%-- 
    Document   : halaman-registrasi-member
    Created on : Nov 15, 2014, 10:24:38 PM
    Author     : Lorencius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%if (session.getAttribute("username") != null) {
            if (session.getAttribute("role").equals("Operator")) {
                out.print("<script>");
                out.print("alert(\"Your current session login as Operator, ");
                out.print("we will now redirecting you to Operator Home\");");
                out.print("window.location = 'halaman-utama-operator.jsp';");
                out.print("</script>");
            }
        } else {
            out.print("<script>");
            out.print("alert(\"You don't have permission to access this page\");");
            out.print("window.location = 'home.jsp'");
            out.print("</script>");
        }
        if (request.getParameter("logoutAd") != null) {
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
        <title>Registrasi Member</title>
        <link rel="shortcut icon" href="img/OM-Item_Logo.png" type="image/png">
        <link href="semantic-ui/packaged/css/semantic.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <!--Menu bar-->
        <div class="ui menu">
            <div class="ui container">
                <div class="ui pointing dropdown link item">
                    <i class="user icon"></i> MEMBER <i class="dropdown icon"></i>
                    <div class="menu">
                        <a class="active item" href="halaman-registrasi-member.jsp"><i class="add icon"></i>Tambah Member</a>
                        <a class="item" href="halaman-edit-data-member.jsp"><i class="edit icon"></i>Edit Member</a>
                        <a class="item" href="halaman-tambah-saldo.jsp"><i class="dollar icon"></i>Tambah Saldo</a>
                    </div>
                </div>
                <a class="item" href="halaman-jadwal-penayangan-film.jsp">
                    <i class="play icon"></i> BUAT JADWAL
                </a>
                <a class="item" href="halaman-tambah-film.jsp">
                    <i class="video icon"></i> TAMBAH FILM
                </a>
                <div class="ui pointing dropdown link item">
                    <i class="archive icon"></i> REPORT <i class="dropdown icon"></i>
                    <div class="menu">
                        <a class="item" href="halaman-report-penerimaan-uang.jsp"><i class="dollar icon"></i>Penerimaan Uang</a>
                        <a class="item" href="halaman-report-penjualan-tiket.jsp"><i class="ticket icon"></i>Penjualan Tiket</a>
                    </div>
                </div>
                <div class="right menu">
                    <form method="POST">
                        <div class="ui dropdown link item">
                            <i class="desktop icon"></i> ADMIN <i class="dropdown icon"></i>
                            <div class="menu">
                                <table class="ui basic table">
                                    <tr>
                                        <td>Nama</td>
                                        <td>${name}</td>
                                    </tr>
                                    <tr>
                                        <td>ID</td>
                                        <td>${username}</td>
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
                $('.ui.dropdown').dropdown();
            });
        </script>
    </body>
</html>
