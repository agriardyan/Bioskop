<%-- 
    Document   : halaman-utama-operator
    Created on : Nov 9, 2014, 3:56:07 PM
    Author     : Lorencius
--%>
<!DOCTYPE html>
<html>
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
                <a class="active item" href="#">
                    <i class="ticket icon"></i> JUAL TIKET
                </a>
                <a class="item" href="#">
                    <i class="print icon"></i> CETAK TIKET
                </a>
                <div class="right menu">
                    <div class="ui selection dropdown link item">
                        <i class="user icon"></i> OPERATOR <i class="dropdown icon"></i>
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
                                <a class="item" id="logoutButton"><i class="sign out icon"></i>Logout</a>
                        </div>
                    </div>
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
            $('#logoutButton').click(function() {
            <%
                session.removeAttribute("username");
                session.removeAttribute("password");
                session.removeAttribute("name");
                session.invalidate();
                response.sendRedirect("home.jsp");
            %>
                });
            $(document).ready(function() {
                $('.ui.dropdown')
                        .dropdown({action: 'updateForm'});
                
            });
        </script>
    </body>
</html>