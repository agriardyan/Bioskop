<%-- 
    Document   : halaman-edit-data-member
    Created on : Nov 15, 2014, 10:26:46 PM
    Author     : Lorencius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
//        if (session.getAttribute("username") != null) {
//                if (session.getAttribute("role").equals("Admin")) {
//                    out.print("<script>");
//                    out.print("alert(\"Your current session login as Operator, ");
//                    out.print("we will now redirecting you to Operator Home\");");
//                    out.print("window.location = 'halaman-utama-operator.jsp';");
//                    out.print("</script>");
//                }
//            } else {
//                out.print("<script>");
//                out.print("alert(\"You don't have permission to access this page\");");
//                out.print("window.location = 'home.jsp'");
//                out.print("</script>");
//            }
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
        <title>Edit Data Member</title>
        <link rel="shortcut icon" href="img/OM-Item_Logo.png" type="image/png">
        <link href="semantic-ui/packaged/css/semantic.css" rel="stylesheet" type="text/css">
        <link href="date/redmond.datepick.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <!--Menu bar-->
        <div class="ui menu">
            <div class="ui container">
                <div class="ui pointing dropdown link item">
                    <i class="user icon"></i> MEMBER <i class="dropdown icon"></i>
                    <div class="menu">
                        <a class="item" href="halaman-registrasi-member.jsp"><i class="add icon"></i>Tambah Member</a>
                        <a class="active item" href="halaman-edit-data-member.jsp"><i class="edit icon"></i>Edit Member</a>
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

        <div class="main container">
            <!--Search box-->
            <div class="ui grid">
                <div class="column">
                    <div class="ui action input">
                        <input placeholder="Cari User" type="text">
                        <div class="ui icon button">
                            <i class="search icon"></i>
                        </div>
                    </div>
                </div>
            </div>
            <!--End of Search box-->

            <div class="ui grid">
                <div class="column">
                    <form class="ui fluid form segment" method="POST" id="updateForm">
                        <div class="two fields">
                            <div class="field">
                                <label>Nama</label>
                                <input name="nama" placeholder="Nama" type="text">
                            </div>
                            <div class="field">
                                <label>Tempat Lahir</label>
                                <input name="tempatLahir" placeholder="Tempat Lahir" type="text">
                            </div>
                        </div>
                        <div class="two fields">
                            <div class="field">
                                <label>Tanggal Lahir</label>
                                <input name="tanggalLahir" type="text" id="datePicker" placeholder="Tanggal Lahir">
                            </div>
                            <div class="field">
                                <label>Alamat</label>
                                <input name="alamat" placeholder="Alamat" type="text">
                            </div>
                        </div>    
                        <div class="two fields">
                            <div class="field">
                                <label>Telepon</label>
                                <input name="telepon" placeholder="Telepon" type="text">
                            </div>
                            <div class="field">
                                <label>E-mail</label>
                                <input name="email" placeholder="E-mail" type="text">
                            </div>
                        </div>
                        <div class="two fields">
                            <div class="field">
                                <label>Username</label>
                                <input name="username" placeholder="Username" disabled="disabled" type="text">
                            </div>
                            <div class="field">
                                <label>Password</label>
                                <input name="password" placeholder="Password" type="password">
                            </div>
                        </div>
                        <div class="two fields">
                            <div class="field">
                            </div>
                            <div class="field">
                                <label>Confirm Password</label>
                                <input name="cpassword" placeholder="Password" type="password">
                            </div>
                        </div>
                        <input class="ui blue submit button" name="commit" value="Update">
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
        <script src="date/jquery.plugin.js" type="text/javascript"></script>
        <script src="date/jquery.datepick.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('.ui.dropdown').dropdown();

                $("#datePicker").datepick({dateFormat: 'dd-M-yyyy'});

                //Update Form error prompt
                $("#updateForm").form({
                    idfilm: {
                        identifier: 'nama',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Masukkan Nama'
                            }
                        ]
                    },
                    judul: {
                        identifier: 'tempatLahir',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Masukkan Tempat Lahir'
                            }
                        ]
                    },
                    genre: {
                        identifier: 'tanggalLahir',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Masukkan Tanggal Lahir'
                            }]
                    },
                    status: {
                        identifier: 'alamat',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Masukkan Alamat'
                            }
                        ]
                    },
                    kategori: {
                        identifier: 'telepon',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Masukkan Nomor Telepon'
                            }]
                    },
                    email: {
                        identifier: 'email',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Masukkan Alamat E-mail'
                            }
                        ]
                    },
                    password: {
                        identifier: 'password',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Masukkan Password'
                            },
                            {
                                type: 'length[6]',
                                prompt: 'Password harus lebih dari 6 karakter'
                            }]
                    },
                    cpassword: {
                        identifier: 'cpassword',
                        rules: [
                            {
                                type: 'match',
                                prompt: 'Password yang Anda masukkan tidak sesuai'
                            }]
                    }
                },
                {
                    on: 'blur',
                    inline: 'true'
                });
            });
        </script>
    </body>
</html>
