<%-- 
    Document   : halaman-tambah-saldo
    Created on : Nov 15, 2014, 10:25:26 PM
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
        
        if (session.getAttribute("id") != null) {
            session.removeAttribute("user");
            session.removeAttribute("nama");
            session.removeAttribute("saldo");
            session.removeAttribute("id");
        }
        
        Member member = new Member();
        if (null != request.getParameter("cariData")) {
            session.setAttribute("id", Member.getDataListbyUser(request.getParameter("user")).get(0).getmKodeMember());
            session.setAttribute("nama", Member.getDataListbyUser(request.getParameter("user")).get(0).getmNamaMember());
            session.setAttribute("saldo", Member.getDataListbyUser(request.getParameter("user")).get(0).getmSaldo());
            session.setAttribute("user", request.getParameter("user"));
        }

        if (null != request.getParameter("tambah")) {
            member.setmKodeMember(request.getParameter("idT"));
            member.setmSaldo(Integer.parseInt(request.getParameter("saldoT")) + Integer.parseInt(request.getParameter("saldo")));
            Member.updateSaldo(member);
            session.setAttribute("id", Member.getDataListbyUser(request.getParameter("userT")).get(0).getmKodeMember());
            session.setAttribute("nama", Member.getDataListbyUser(request.getParameter("userT")).get(0).getmNamaMember());
            session.setAttribute("user", request.getParameter("userT"));
            session.setAttribute("saldo", member.getmSaldo());
        }
    %>
    <head>
        <title>Tambah Saldo</title>
        <link rel="shortcut icon" href="img/OM-Item_Logo.png" type="image/png">
        <link href="Semantic-UI-1.0.0/dist/semantic.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <!--Menu bar-->
        <div class="ui fixed top menu">
            <div class="container">
                <div class="ui pointing dropdown link item">
                    <i class="user icon"></i> MEMBER <i class="dropdown icon"></i>
                    <div class="menu">
                        <a class="item" href="halaman-registrasi-member.jsp"><i class="add icon"></i>Tambah Member</a>
                        <a class="item" href="halaman-edit-data-member.jsp"><i class="edit icon"></i>Edit Member</a>
                        <a class="active item" href="halaman-tambah-saldo.jsp"><i class="dollar icon"></i>Tambah Saldo</a>
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
                                <a class="item" href="halaman-tambah-saldo.jsp?logout=yes"><i class="sign out icon"></i>Logout</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--End of Menu bar-->

        <!--Main body-->
        <br>
        <br>
        <br>
        <br>
        <div class="ui one column page grid">
            <div class="column">
                <form class="ui fluid form segment" method="POST" id="updateSaldo">
                    <div class="three fields">
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
                        </div>
                        <div class="field"></div>
                        <div class="field"></div>
                        <!--End of Search box-->
                    </div>
                </form>
                <div class="ui fluid form segment">
                    <h4 class="ui horizontal header divider">
                        <i class="info icon"></i>
                        Personal Information
                    </h4>
                    <!--<form class="ui fluid form segment" method="POST" id="updateForm">-->
                    <div class="three fields">
                        <div class="field">
                            <label>Id Member</label>
                            <input name="id" placeholder="ID Member" type="text" disabled="disabled" value="${id}">
                        </div>
                        <div class="field">
                            <label>Nama</label>
                            <input name="nama" placeholder="Nama" type="text" disabled="disabled" value="${nama}">
                        </div>
                        <div class="field">
                            <label>Saldo</label>
                            <input name="saldo" placeholder="Saldo" type="text" disabled="disabled" value="${saldo}">
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui blue disabled button"  id="tambahSaldo">Tambah Saldo</div>
                    </div>
                    <!--</form>-->
                </div>
            </div>
        </div>

        <div class="ui small modal saldo">
            <i class="close icon"></i>
            <div class="header">
                Pilih Jumlah Saldo
            </div>
            <div class="content">
                <form class="ui form segment" method="POST" id="formSaldo">
                    <div class="field">
                        <input type="hidden" name="idT" value="${id}">
                        <input type="hidden" name="namaT" value="${nama}">
                        <input type="hidden" name="saldoT" value="${saldo}">
                        <input type="hidden" name="userT" value="${user}">
                        <div class="ui fluid selection dropdown">
                            <input name="saldo" type="hidden">
                            <div class="default text">Pilih Saldo</div>
                            <i class="dropdown icon"></i>
                            <div class="menu">
                                <div class="item" data-value="150000" >Rp. 150.000</div>
                                <div class="item" data-value="200000" >Rp. 200.000</div>
                                <div class="item" data-value="250000" >Rp. 250.000</div>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <button class="ui blue button" type="submit" name="tambah">Tambah</button>
                    </div>
                </form>
            </div>
        </div>
        <!--End of Main body-->

        <!--Script-->
        <script src="Semantic-UI-1.0.0/dist/jquery-2.1.1.js" type="text/javascript"></script>
        <script src="Semantic-UI-1.0.0/dist/semantic.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function() {
            <%
                if (session.getAttribute("id") != null) {
                    if (!session.getAttribute("id").equals("")) { %>
                $(document.getElementById("tambahSaldo")).removeClass("disabled");
            <%
                    }
                }
            %>

                $('.ui.small.modal.saldo')
                        .modal('attach events', '#tambahSaldo', 'show');

                $('.ui.dropdown').dropdown({on: 'hover'});

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

                $("#updateSaldo").form({
                    idfilm: {
                        identifier: 'user',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Masukkan Username Member'
                            }
                        ]
                    }
                },
                {
                    on: 'submit'
                });

                $("#formSaldo").form({
                    idfilm: {
                        identifier: 'saldo',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Pilih nominal saldo'
                            }
                        ]
                    }
                },
                {
                    on: 'submit',
                    inline: true
                });
            });
        </script>
    </body>
</html>
