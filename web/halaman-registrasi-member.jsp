<%-- 
    Document   : halaman-registrasi-member
    Created on : Nov 15, 2014, 10:24:38 PM
    Author     : Lorencius
--%>

<%@page import="com.rplo.bioskop.model.Member"%>
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

        if (request.getParameter("logout") != null) {
            session.removeAttribute("username");
            session.removeAttribute("password");
            session.removeAttribute("name");
            session.removeAttribute("role");
            session.invalidate();
            response.sendRedirect("home.jsp");
            return;
        }

        if (null != request.getParameter("regButton")) {
            Member member = new Member();
            String tanggal[] = request.getParameter("tanggalLahir").split("-");
            String kodeM = "" + tanggal[0] + "" + tanggal[1] + "" + tanggal[2] + Member.cariIdTerakhir();
            member.setmNamaMember(request.getParameter("nama"));
            member.setmUsernameMember(request.getParameter("username"));
            member.setmTempatLahir(request.getParameter("tempatLahir"));
            member.setmTanggalLahir(request.getParameter("tanggalLahir"));
            member.setmEmail(request.getParameter("email"));
            member.setmGender(request.getParameter("gender"));
            member.setmAlamatMember(request.getParameter("alamat"));
            member.setmNomorTelepon(request.getParameter("telepon"));
            member.setmPasswordMember(request.getParameter("password"));
            member.setmSaldo(150000);
            member.setmKodeMember(kodeM);
            Member.simpanData(member);
        }
    %>
    <head>
        <title>Registrasi Member</title>
        <link rel="shortcut icon" href="img/OM-Item_Logo.png" type="image/png">
        <link href="Semantic-UI-1.0.0/dist/semantic.css" rel="stylesheet" type="text/css">
        <link href="date/redmond.datepick.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <!--Menu bar-->
        <div class="ui fixed top menu">
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
                                <a class="item" href="halaman-registrasi-member.jsp?logout=yes"><i class="sign out icon"></i>Logout</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--End of Menu bar-->

        <!--Main body-->
        <br><br><br><br>
        <div class="ui one column page grid">
            <div class="column">
                <form class="ui fluid form segment" method="POST" id="saveMember">
                    <div class="two fields">
                        <div class="field">
                            <h4 class="ui horizontal header divider">
                                <i class="info icon"></i>
                                Personal Information
                            </h4>
                        </div>
                        <div class="field">
                            <h4 class="ui horizontal header divider">
                                <i class="user icon"></i>
                                Account Information
                            </h4>
                        </div>
                    </div>
                    <div class="two fields">
                        <div class="field">
                            <label>Nama</label>
                            <input type="text" name="nama" placeholder="Nama">
                        </div>
                        <div class="field">
                            <label>User Name</label>
                            <input type="text" name="username" placeholder="Username">
                        </div>
                    </div>
                    <div class="two fields">
                        <div class="field">
                            <div class="two fields">
                                <div class="field">
                                    <label>Jenis Kelamin</label>
                                    <div class="ui selection dropdown">
                                        <input type="hidden" name="gender">
                                        <div class="default text">Jenis Kelamin</div>
                                        <i class="dropdown icon"></i>
                                        <div class="menu">
                                            <div class="item" data-value="Laki-laki">Laki-laki</div>
                                            <div class="item" data-value="Perempuan">Perempuan</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="field">
                                    <label>No Telpon</label>
                                    <input type="text" name="telepon" placeholder="08098997809">
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <label>Email</label>
                            <input type="text" name="email" placeholder="member@yahoo.com">
                        </div>
                    </div>
                    <div class="two fields">
                        <div class="field">
                            <div class="two fields">
                                <div class="field">
                                    <label>Tempat Lahir</label>
                                    <input type="text" placeholder="Tempat Lahir" name="tempatLahir">
                                </div>
                                <div class="field">
                                    <label>Tanggal Lahir</label>
                                    <input type="text" id="datePicker" placeholder="Tanggal Lahir" name="tanggalLahir">
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <div class="two fields">
                                <div class="field">
                                    <label>Password</label>
                                    <input type="password" name="password" placeholder="Password">
                                </div>
                                <div class="field">
                                    <label>Confirm Password</label>
                                    <input type="password" name="confirm" placeholder="Password">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="two fields">
                        <div class="field">
                            <label>Alamat</label>
                            <input type="text" name="alamat" placeholder="Jalan xxx no.xx, Yogyakarta">
                        </div>
                        <div class="field">
                            <button class="ui blue button" type="submit" name="regButton">Registrasi</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--End of Main body-->

        <!--Script-->
        <script src="Semantic-UI-1.0.0/dist/jquery-2.1.1.js" type="text/javascript"></script>
        <script src="Semantic-UI-1.0.0/dist/semantic.js" type="text/javascript"></script>
        <script src="date/jquery.plugin.js" type="text/javascript"></script>
        <script src="date/jquery.datepick.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('.ui.dropdown').dropdown({on: 'hover'});
                $("#datePicker").datepick({dateFormat: 'dd-mm-yyyy'});
                //save form error prompt 
                $("#saveMember").form({
                    nama:
                            {
                                identifier: 'nama',
                                rules:
                                        [
                                            {type: 'empty', prompt: 'Masukkan Nama'}
                                        ]
                            },
                    tempatLahir:
                            {
                                identifier: 'tempatLahir',
                                rules:
                                        [
                                            {type: 'empty', prompt: 'Masukkan Tempat Lahir'}
                                        ]
                            },
                    tanggalLahir:
                            {
                                identifier: 'tanggalLahir',
                                rules:
                                        [
                                            {type: 'empty', prompt: 'Masukkan Tanggal Lahir'}
                                        ]
                            },
                    alamat:
                            {
                                identifier: 'alamat',
                                rules:
                                        [
                                            {type: 'empty', prompt: 'Masukkan Alamat'}
                                        ]
                            },
                    telpon:
                            {
                                identifier: 'telepon',
                                rules:
                                        [
                                            {type: 'empty', prompt: 'Masukkan Nomor Telepon'}
                                        ]
                            },
                    email:
                            {
                                identifier: 'email',
                                rules:
                                        [
                                            {type: 'empty', prompt: 'Masukkan Email'}
                                        ]
                            },
                    username:
                            {
                                identifier: 'username',
                                rules:
                                        [
                                            {type: 'empty', prompt: 'Masukkan Username'},
            <%
                for (int i = 0; i < Member.getDataList().size(); i++) {
            %>
                                            {type: 'not[<%=Member.getDataList().get(i).getmUsernameMember()%>]', prompt: 'Username telah digunakan'},
            <%
                                                }
            %>
                                        ]
                            },
                    password:
                            {
                                identifier: 'password',
                                rules:
                                        [
                                            {type: 'empty', prompt: 'Masukkan Password'},
                                            {type: 'length[6]', prompt: 'Password harus lebih dari 6 karakter'}
                                        ]
                            },
                    confirm:
                            {
                                identifier: 'confirm',
                                rules:
                                        [
                                            {type: 'empty', prompt: 'Masukkan Konfirmasi Password'},
                                            {type: 'match[password]', prompt: 'Password yang Anda masukkan tidak sesuai'}
                                        ]
                            },
                    gender:
                            {
                                identifier: 'gender',
                                rules:
                                        [
                                            {type: 'empty', prompt: 'Pilih Jenis Kelamin'}
                                        ]
                            }
                },
                {
                    on: 'submit',
                    inline: 'true'
                });
            });
        </script>
    </body>
</html>
