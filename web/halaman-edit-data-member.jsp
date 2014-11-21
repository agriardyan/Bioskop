<%-- 
    Document   : halaman-edit-data-member
    Created on : Nov 15, 2014, 10:26:46 PM
    Author     : Lorencius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Data Member</title>
        <link rel="shortcut icon" href="img/OM-Item_Logo.png" type="image/png">
        <link href="semantic-ui/packaged/css/semantic.css" rel="stylesheet" type="text/css">
        <link href="date/jquery.datepick.css" rel="stylesheet" type="text/css">
    </head>
    <body>
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

        <div class="ui container">
            <!--Menu bar-->
            <div class="ui red inverted menu">
            <div class="ui pointing dropdown link item">
                <i class="user icon"></i> MEMBER <i class="dropdown icon"></i>
                <div class="menu">
                    <a class="item" href="#"><i class="add icon"></i>Tambah Member</a>
                    <a class="active item" href="#"><i class="edit icon"></i>Edit Member</a>
                    <a class="item" href="#"><i class="dollar icon"></i>Tambah Saldo</a>
                </div>
            </div>
            <a class="item" href="#">
                <i class="play icon"></i> BUAT JADWAL
            </a>
            <a class="item" href="halaman-tambah-film.jsp">
                <i class="video icon"></i> TAMBAH FILM
            </a>
            <div class="ui pointing dropdown link item">
                <i class="archive icon"></i> REPORT <i class="dropdown icon"></i>
                <div class="menu">
                    <a class="item" href="#"><i class="dollar icon"></i>Penerimaan Uang</a>
                    <a class="item" href="#"><i class="ticket icon"></i>Penjualan Tiket</a>
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
                            <input class="ui fluid tiny submit button" type="submit" name="logoutAd" value="Logout">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--End of Menu bar-->
        <div class="ui grid">
            <div class="column"><div class="ui action input">
                    <input placeholder="Cari User" type="text">
                    <div class="ui icon button"><i class="search icon"></i></div>
                </div></div>
        </div>
        <div class="grid">
            <div class="column">
                <div class="ui fluid form segment">
  <div class="two fields">
    <div class="field">
      <label>Nama</label>
      <input placeholder="Nama" type="text">
    </div>
    <div class="field">
      <label>Tempat Lahir</label>
      <input placeholder="Tempat Lahir" type="text">
    </div>
      
      <div class="field">
      <input type="text" id="datepicker" placeholder="Tanggal Lahir">
      </div>
      
      <div class="field">
      <label>Alamat</label>
      <input placeholder="Alamat" type="text">
    </div>
      
      <div class="field">
      <label>Telepon</label>
      <input placeholder="Telepon" type="text">
    </div>
      
      <div class="field">
      <label>E-mail</label>
      <input placeholder="E-mail" type="text">
    </div>
      
      <div class="field">
      <label>Username</label>
      <input placeholder="Username" disabled="disabled" type="text">
    </div>
      
      <div class="field">
      <label>Password</label>
      <input placeholder="Last Name" type="text">
    </div>
  </div>
                    <input class="ui blue submit button" name="commit" value="Update">
</div>
            </div>
        </div>

       
        <script src="semantic-ui/packaged/javascript/jquery-2.1.1.js" type="text/javascript"></script>
        <script src="semantic-ui/packaged/javascript/semantic.js" type="text/javascript"></script>
        <script src="date/jquery.plugin.js" type="text/javascript"></script>
        <script src="date/jquery.datepick.js" type="text/javascript"></script>
        <script type="text/javascript"> 
            $(document).ready(function (){
                $('#datepicker').datepick();
                $('.ui.dropdown').dropdown();
            });
            
                

                
        </script>
        
    </body>
</html>
