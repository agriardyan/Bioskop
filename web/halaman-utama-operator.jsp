<%-- 
    Document   : halaman-utama-operator
    Created on : Nov 9, 2014, 3:56:07 PM
    Author     : Lorencius
--%>
<!DOCTYPE html>
<html>
    <%if (session.getAttribute("username") != null) {
            if (session.getAttribute("role").equals("Admin")) {
                out.print("<script>");
                out.print("alert(\"Your current session login as Administrator, ");
                out.print("we will now redirecting you to Administrator Home\");");
                out.print("window.location = 'halaman-utama-admin.jsp';");
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OM-ITEM</title>
        <link rel="shortcut icon" href="img/OM-Item_Logo.png" type="image/png">
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
                    <form method="POST">
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
                                <input class="ui fluid tiny submit button" type="submit" name="logoutAd" value="Logout">
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
            $(document).ready(function() {
                $('.ui.dropdown')
                        .dropdown({action: 'updateForm'});

            });
        </script>
    </body>
</html>