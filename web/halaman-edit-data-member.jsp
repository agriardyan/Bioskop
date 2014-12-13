<%-- 
    Document   : halaman-edit-data-member
    Created on : Nov 15, 2014, 10:26:46 PM
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
            session.removeAttribute("user");
            session.removeAttribute("nama");
            session.removeAttribute("tempat");
            session.removeAttribute("tanggal");
            session.removeAttribute("alamat");
            session.removeAttribute("nomor");
            session.removeAttribute("email");
            session.removeAttribute("saldo");
            session.removeAttribute("id");
            session.invalidate();
            response.sendRedirect("home.jsp");
            return;
        }

        if (session.getAttribute("user") != null) {
            session.removeAttribute("user");
            session.removeAttribute("nama");
            session.removeAttribute("tempat");
            session.removeAttribute("tanggal");
            session.removeAttribute("alamat");
            session.removeAttribute("nomor");
            session.removeAttribute("email");
            session.removeAttribute("saldo");
            session.removeAttribute("id");
        }

        Member member = new Member();
        if (null != request.getParameter("updateData")) {
            member.setmUsernameMember(request.getParameter("username"));
            member.setmPasswordMember(request.getParameter("password"));
            member.setmNamaMember(request.getParameter("nama"));
            member.setmTanggalLahir(request.getParameter("tanggalLahir"));
            member.setmAlamatMember(request.getParameter("alamat"));
            member.setmEmail(request.getParameter("email"));
            member.setmNomorTelepon(request.getParameter("telepon"));
            member.setmSaldo(Integer.parseInt(request.getParameter("saldo")));
            member.setmTempatLahir(request.getParameter("tempatLahir"));
            member.setmKodeMember(request.getParameter("kode"));

            Member.updateData(member);

            session.setAttribute("user", Member.getDataListbyUser(request.getParameter("username")).get(0).getmUsernameMember());
            session.setAttribute("nama", Member.getDataListbyUser(request.getParameter("username")).get(0).getmNamaMember());
            session.setAttribute("tempat", Member.getDataListbyUser(request.getParameter("username")).get(0).getmTempatLahir());
            session.setAttribute("tanggal", Member.getDataListbyUser(request.getParameter("username")).get(0).getmTanggalLahir());
            session.setAttribute("alamat", Member.getDataListbyUser(request.getParameter("username")).get(0).getmAlamatMember());
            session.setAttribute("nomor", Member.getDataListbyUser(request.getParameter("username")).get(0).getmNomorTelepon());
            session.setAttribute("email", Member.getDataListbyUser(request.getParameter("username")).get(0).getmEmail());
            session.setAttribute("id", Member.getDataListbyUser(request.getParameter("username")).get(0).getmKodeMember());
            session.setAttribute("saldo", Member.getDataListbyUser(request.getParameter("username")).get(0).getmSaldo());
        }

        if (null != request.getParameter("cariData")) {
            session.setAttribute("user", Member.getDataListbyUser(request.getParameter("user")).get(0).getmUsernameMember());
            session.setAttribute("nama", Member.getDataListbyUser(request.getParameter("user")).get(0).getmNamaMember());
            session.setAttribute("tempat", Member.getDataListbyUser(request.getParameter("user")).get(0).getmTempatLahir());
            session.setAttribute("tanggal", Member.getDataListbyUser(request.getParameter("user")).get(0).getmTanggalLahir());
            session.setAttribute("alamat", Member.getDataListbyUser(request.getParameter("user")).get(0).getmAlamatMember());
            session.setAttribute("nomor", Member.getDataListbyUser(request.getParameter("user")).get(0).getmNomorTelepon());
            session.setAttribute("email", Member.getDataListbyUser(request.getParameter("user")).get(0).getmEmail());
            session.setAttribute("id", Member.getDataListbyUser(request.getParameter("user")).get(0).getmKodeMember());
            session.setAttribute("saldo", Member.getDataListbyUser(request.getParameter("user")).get(0).getmSaldo());
        }
    %>
    <head>
        <title>Edit Data Member</title>
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
                                <a class="item" href="halaman-edit-data-member.jsp?logout=yes"><i class="sign out icon"></i>Logout</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--End of Menu bar-->
        <br>
        <br>
        <br>
        <br>
        <div class="ui one column page grid">
            <div class="column">
                <form class="ui fluid form segment" method="POST">
                    <div class="two fields">
                        <div class="field">
                            <div class="two fields">
                                <div class="field">
                                    <!--Search box-->
                                    <div class="ui search" id="searchInput">
                                        <div class="ui icon input">
                                            <input class="prompt" placeholder="Cari User ..." type="text" name="user" value="${user}">
                                            <button class="ui icon button" type="submit" name="cariData">
                                                <i class="search icon"></i>
                                            </button>
                                        </div>
                                        <div class="results"></div>
                                    </div>
                                    <!--End of Search box-->
                                </div>
                                <div class="field"></div>
                            </div>
                        </div>
                        <div class="field"></div>
                    </div>
                </form>
            </div>
        </div>
        <div class="ui one column page grid">
            <div class="column">
                <form class="ui fluid form segment" method="POST" id="updateForm">
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
                            <input name="nama" id="namaM" disabled="disabled" placeholder="Nama" type="text" value="${nama}">
                        </div>
                        <input name="kode" type="hidden" value="${id}">
                        <input name="saldo" type="hidden" value="${saldo}">
                        <div class="field">
                            <label>Username</label>
                            <input name="username" id="usernameM" disabled="disabled" placeholder="Username" type="text" value="${user}">
                        </div>
                    </div>
                    <div class="two fields">
                        <div class="field">
                            <div class="two fields">
                                <div class="field">
                                    <label>Tempat Lahir</label>
                                    <input name="tempatLahir" id="tempatLahirM" disabled="disabled" placeholder="Tempat Lahir" type="text" value="${tempat}">
                                </div>
                                <div class="field">
                                    <label>Tanggal Lahir</label>
                                    <input name="tanggalLahir"  type="text" id="datePicker" placeholder="Tanggal Lahir" value="${tanggal}">
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <label>E-mail</label>
                            <input name="email" id="emailM" disabled="disabled" placeholder="E-mail" type="text" value="${email}">
                        </div>
                    </div>
                    <div class="two fields">
                        <div class="field">
                            <label>Alamat</label>
                            <input name="alamat" id="alamatM" disabled="disabled" placeholder="Alamat" type="text" value="${alamat}">
                        </div>
                        <div class="field">
                            <div class="two fields">
                                <div class="field">
                                    <label>Password</label>
                                    <input name="password" id="passwordM" disabled="disabled" placeholder="Password" type="password">
                                </div>
                                <div class="field">
                                    <label>Confirm Password</label>
                                    <input name="cpassword" id="cpasswordM" disabled="disabled" placeholder="Password" type="password">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="two fields">
                        <div class="field">
                            <label>Telepon</label>
                            <input name="telepon" id="teleponM" disabled="disabled" placeholder="Telepon" type="text" value="${nomor}">
                        </div>
                        <div class="field">
                            <button class="ui blue disabled button" type="submit" id="updateButton" name="updateData">Update</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--Script-->
        <script src="Semantic-UI-1.0.0/dist/jquery-2.1.1.js" type="text/javascript"></script>
        <script src="Semantic-UI-1.0.0/dist/semantic.js" type="text/javascript"></script>
        <script src="date/jquery.plugin.js" type="text/javascript"></script>
        <script src="date/jquery.datepick.js" type="text/javascript"></script>
        <script type="text/javascript">
            
            $(document).ready(function() {
                $('.ui.dropdown').dropdown({on: 'hover'});

                $("#datePicker").datepick({dateFormat: 'dd-M-yyyy'})
                        .datepick('disable');
            <%
                if (session.getAttribute("user") != null) {
                    if (!session.getAttribute("user").equals("")) {
            %>
                $(document.getElementById("updateButton")).removeClass("disabled");
                $(document.getElementById("namaM")).removeAttr("disabled");
                $(document.getElementById("usernameM")).removeAttr("disabled");
                $(document.getElementById("tempatLahirM")).removeAttr("disabled");
                $("#datePicker").datepick('enable');
                $(document.getElementById("emailM")).removeAttr("disabled");
                $(document.getElementById("teleponM")).removeAttr("disabled");
                $(document.getElementById("alamatM")).removeAttr("disabled");
                $(document.getElementById("passwordM")).removeAttr("disabled");
                $(document.getElementById("cpasswordM")).removeAttr("disabled");
            <%
                    }
                }
            %>

                $('#searchInput').search({
                    source: [
            <%
                for (int i = 0; i < Member.getDataList().size(); i++) {
            %>
                        {title: '<%= Member.getDataList().get(i).getmUsernameMember()%>'},
            <%
                }
            %>
                    ]
                });

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
                            }
                        ]
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
                            }
                        ]
                    },
                    email: {identifier: 'email',
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
                            }
                        ]
                    },
                    cpassword: {
                        identifier: 'cpassword',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Masukkan Konfirmasi Password'
                            },
                            {
                                type: 'match[password]',
                                prompt: 'Password yang Anda masukkan tidak sesuai'
                            }
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
