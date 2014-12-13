<%-- 
    Document   : halaman-report-penerimaan-uang
    Created on : Nov 15, 2014, 10:45:40 PM
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
        <title>Report Penerimaan Uang</title>
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
                        <a class="active item" href="halaman-report-penerimaan-uang.jsp"><i class="dollar icon"></i>Penerimaan Uang</a>
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
                                <a class="item" href="halaman-report-penerimaan-uang.jsp?logout=yes"><i class="sign out icon"></i>Logout</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
                                    
       <br>
       <br>
       <br>
       
       <div class="ui two column page grid" >
            <div class="column">
            <div class="ui fluid form segment">
                <h4 class="ui horizontal header divider">
                    <i class="file text outline icon"></i>
                    REPORT PENERIMAAN UANG
                    
                </h4>
                <!--<div class="ui bottom segment attached">-->
                <div class="two fields">
                <div class="field">
                    
                        <div class="field">
                        <label class="ui red teal tag label" >Tanggal Awal</label>
                    <input name="tanggalAwal" type="text" id="datePicker" placeholder="Tanggal Awal">
                        </div>
                    
                </div>
                    
                    <div class="field">
                    
                        <div class="field">
                        <label class="ui red teal tag label" >Tanggal Akhir</label>
                    <input name="tanggalAkhir" type="text" id="datePicker" placeholder="Tanggal Akhir">
                        </div>
                    
                </div>
                    
                </div>
                
                <div class="field">
                    <div class="ui button" id="download">
                        <i class="cloud download icon"></i>
                        Download
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!--End of Menu bar-->

        <!--Main body-->

        <!--End of Main body-->

        <!--Script-->
        <script src="Semantic-UI-1.0.0/dist/jquery-2.1.1.js" type="text/javascript"></script>
        <script src="Semantic-UI-1.0.0/dist/semantic.js" type="text/javascript"></script>
        <script src="date/jquery.plugin.js" type="text/javascript"></script>
        <script src="date/jquery.datepick.js" type="text/javascript"></script>
        <script type="text/javascript">
        
            $(document).ready(function() {
                $('.ui.dropdown').dropdown({on: 'hover'});
                $("#datePicker").datepick({dateFormat: 'dd-M-yyyy'});
            });
        </script>
    </body>
</html>