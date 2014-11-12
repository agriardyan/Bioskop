<%-- 
    Document   : halaman-utama-admin
    Created on : Nov 9, 2014, 2:53:11 PM
    Author     : Lorencius
--%>

<!DOCTYPE html>
<html>
    <%if (session.getAttribute("username") == null) {
            out.print("<script>alert(\"You don't have permission to access this page\");</script>");

            response.sendRedirect("home.jsp");
//            RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
//            rd.forward(request, response);
        }
        if (request.getParameter("logoutAd") != null) {
            session.removeAttribute("username");
            session.removeAttribute("password");
            session.removeAttribute("name");
            session.invalidate();
            response.sendRedirect("home.jsp");
            return ;
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OM-ITEM</title>
        <link rel="shortcut icon" href="img/Deep_User.png" type="image/png">
        <link href="semantic-ui/packaged/css/semantic.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="ui container">
            <!--Menu bar-->
            <div class="ui menu">
                <div class="ui pointing dropdown link item">
                    <i class="user icon"></i> MEMBER <i class="dropdown icon"></i>
                    <div class="menu">
                        <a class="item" href="home.jsp"><i class="add icon"></i>Tambah Member</a>
                        <a class="item"><i class="edit icon"></i>Edit Member</a>
                        <a class="item"><i class="dollar icon"></i>Tambah Saldo</a>
                    </div>
                </div>
                <a class="item" href="#">
                    <i class="play icon"></i> BUAT JADWAL
                </a>
                <a class="item" href="#">
                    <i class="video icon"></i> TAMBAH FILM
                </a>
                <div class="ui pointing dropdown link item">
                    <i class="archive icon"></i> REPORT <i class="dropdown icon"></i>
                    <div class="menu">
                        <a class="item"><i class="dollar icon"></i>Penerimaan Uang</a>
                        <a class="item"><i class="ticket icon"></i>Penjualan Tiket</a>
                    </div>
                </div>
                <div class="right menu">
                    <form method="POST">
                        <div class="ui selection dropdown link item">
                            <i class="desktop icon"></i> ADMIN <i class="dropdown icon"></i>
                            <div class="menu">
                                <table class="ui basic table">
                                    <tr>
                                        <td>Nama</td>
                                        <td><%out.print(session.getAttribute("name"));%></td>
                                    </tr>
                                    <tr>
                                        <td>ID</td>
                                        <td><%out.print(session.getAttribute("username"));%></td>
                                    </tr>
                                </table>
                                <!--<a class="item">-->
                                <!--<i class="sign out icon"></i>-->
                                <input class="ui tiny red submit button" type="submit" name="logoutAd" value="Logout">
                                <!--</a>-->
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
//        $('#logoutButton').click(function() {
//        });
            $(document).ready(function() {
                $('.ui.dropdown')
                        .dropdown({action: 'updateForm'});

            });
        </script>
    </body>
</html>

