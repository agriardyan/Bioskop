<%-- 
    Document   : halaman-report-penjualan-tiket
    Created on : Nov 15, 2014, 10:46:01 PM
    Author     : Lorencius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
//        if (session.getAttribute("username") != null) {
//            if (session.getAttribute("role").equals("Operator")) {
//                out.print("<script>");
//                out.print("alert(\"Your current session login as Operator, ");
//                out.print("we will now redirecting you to Operator Home\");");
//                out.print("window.location = 'halaman-utama-operator.jsp';");
//                out.print("</script>");
//            }
//        } else {
//            out.print("<script>");
//            out.print("alert(\"You don't have permission to access this page\");");
//            out.print("window.location = 'home.jsp'");
//            out.print("</script>");
//        }
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
        <title>Report Penjualan Tiket</title>
        <link rel="shortcut icon" href="img/OM-Item_Logo.png" type="image/png">
        <link href="Semantic-UI-1.0.0/dist/semantic.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <!--Menu bar-->
        <div class="pusher">
            <div class="ui fixed top menu">
                <div class="container">
                    <div class="ui pointing dropdown link item">
                        <i class="user icon"></i> MEMBER <i class="dropdown icon"></i>
                        <div class="menu">
                            <a class="item" href="halaman-registrasi-member.jsp"><i class="add icon"></i>Tambah Member</a>
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
                            <a class="active item" href="halaman-report-penjualan-tiket.jsp"><i class="ticket icon"></i>Penjualan Tiket</a>
                        </div>
                    </div>
                    <div class="right menu">
                        <form method="POST">
                            <div class="ui dropdown link item">
                                <i class="desktop icon"></i> ADMIN <i class="dropdown icon"></i>
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
                                    <a class="item" href="halaman-report-penjualan-tiket.jsp?logout=yes"><i class="sign out icon"></i>Logout</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="ui grid" style="width: 100%; position: absolute;">
                <div class="row">
                    <div class="ten wide column">
                        <h4 class="ui top attached center aligned inverted blue block header">
                            REPORT PENJUALAN TIKET
                        </h4>
                        <div class="ui bottom segment attached">
                            <label class="ui red teal tag label" >Pilih Bulan</label>

                            <select class="ui selection dropdown" name="bulan" id="bulan" onchange="">
                                <option value="januari">Januari</option>
                                <option value="februari">Februari</option>
                                <option value="maret">Maret</option>
                                <option value="april">April</option>
                                <option value="mei">Mei</option>
                                <option value="juni">Juni</option>
                                <option value="juli">Juli</option>
                                <option value="agustus">Agustus</option>
                                <option value="september">September</option>
                                <option value="oktober">Oktober</option>
                                <option value="november">November</option>
                                <option value="desember">Desember</option>
                            </select>

                        </div>
                    </div>
                    <div class="six wide column">
                    </div>
                </div>
            </div>
            <!--End of Film List Table-->
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
