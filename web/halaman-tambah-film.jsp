<%-- 
    Document   : halaman-tambah-film
    Created on : Nov 14, 2014, 3:03:21 PM
    Author     : Lorencius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        if (session.getAttribute("username") != null) {
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
        <title>Tambah Film</title>
        <link rel="shortcut icon" href="img/OM-Item_Logo.png" type="image/png">
        <link href="semantic-ui/packaged/css/semantic.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <!--Menu bar-->
        <div class="ui menu">
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
                <a class="active item" href="halaman-tambah-film.jsp">
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
                                        <td><%out.print(session.getAttribute("name"));%></td>
                                    </tr>
                                    <tr>
                                        <td>ID</td>
                                        <td><%out.print(session.getAttribute("username"));%></td>
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

        <!--Add Film Sidebar-->
        <div class="ui very wide vertical right sidebar menu" id="addSidebar">
            <div class="item">
                <form class="ui form segment" method="POST">
                    <div class="field">
                        <input name="idfilm" type="text" placeholder="ID Film">
                    </div>
                    <div class="field">
                        <input name="judul" type="text" placeholder="Judul">
                    </div>
                    <div class="field">
                        <input name="genre" type="text" placeholder="Genre">
                    </div>
                    <div class="field">
                        <div class="ui fluid selection dropdown">
                            <input name="status" type="hidden">
                            <div class="default text">Status</div>
                            <i class="dropdown icon"></i>
                            <div class="menu">
                                <div class="item" data-value="np" >Now Playing</div>
                                <div class="item" data-value="cs" >Coming Soon</div>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui fluid selection dropdown">
                            <input name="kategori" type="hidden">
                            <div class="default text">Kategori</div>
                            <i class="dropdown icon"></i>
                            <div class="menu">
                                <div class="item" data-value="dewasa" >Dewasa</div>
                                <div class="item" data-value="remaja" >Remaja</div>
                                <div class="item" data-value="semua" >Semua Umur</div>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui red tiny buttons">
                            <input class="ui button" type="submit" name="commit" value="Simpan">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--End of Add Film Sidebar-->

        <!--Film List Table-->
        <div class="main container">
            <div class="ui grid" style="width: 100%; position: absolute;">
                <div class="row">
                    <div class="ten wide column">
                        <h4 class="ui top attached center aligned inverted blue block header">
                            DAFTAR FILM
                        </h4>
                        <table class="ui padded table segment attached" id="filmTable">
                            <thead>
                                <tr>
                                    <th>ID Film</th>
                                    <th>Judul</th>
                                    <th>Genre</th>
                                    <th>Status</th>
                                    <th>Kategori</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>AVG2</td>
                                    <td>The Avenger 2</td>
                                    <td>Action</td>
                                    <td>Coming soon</td>
                                    <td>Remaja</td>
                                </tr>
                                <tr>
                                    <td>BH</td>
                                    <td>Big Hero</td>
                                    <td>Adventure</td>
                                    <td>Coming soon</td>
                                    <td>Semua Umur</td>
                                </tr>
                                <tr>
                                    <td>SBM</td>
                                    <td>Doraemon: Stand By Me</td>
                                    <td>Adventure</td>
                                    <td>Now Playing</td>
                                    <td>Semua Umur</td>
                                </tr>
                                <tr>
                                    <td>JB</td>
                                    <td>Jessable</td>
                                    <td>Thriller</td>
                                    <td>Coming Soon</td>
                                    <td>Remaja</td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="5">
                            <div class="ui blue labeled icon button" id="tambah">
                                <i class="video icon"></i> Tambah Film
                            </div>
                            </th>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                    <div class="six wide column">
                    </div>
                </div>
            </div>
        </div>
        <!--End of Film List Table-->

        <!--Script-->
        <script src="semantic-ui/packaged/javascript/jquery-2.1.1.js" type="text/javascript"></script>
        <script src="semantic-ui/packaged/javascript/semantic.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('.ui.dropdown').dropdown();

                //Tambah film button handler
                $("#tambah").click(function() {
                    $("#addSidebar")
                            .sidebar('toggle');
                });

                //Add film sidebar error prompt
                $("#addSidebar").form({
                    idfilm: {
                        identifier: 'idfilm',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Masukkan ID Film'
                            }
                        ]
                    },
                    judul: {
                        identifier: 'judul',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Masukkan Judul Film'
                            }
                        ]
                    },
                    genre: {
                        identifier: 'genre',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Masukkan Genre Film'
                            }]
                    },
                    status: {
                        identifier: 'status',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Pilih Status Film'
                            }
                        ]
                    },
                    kategori: {
                        identifier: 'kategori',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Pilih Kategori Film'
                            }]
                    }
                }, {
                    on: 'blur',
                    inline: 'true'
                });
            });
        </script>
    </body>
</html>
