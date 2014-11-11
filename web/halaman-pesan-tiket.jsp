<%-- 
    Document   : halaman-pesan-tiket
    Created on : Nov 10, 2014, 11:16:14 PM
    Author     : Lorencius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <div class="right menu">
                    <div class="ui selection dropdown link item">
                        <i class="user icon"></i> MEMBER <i class="dropdown icon"></i>
                        <div class="menu">
                            <table class="ui basic table">
                                <tr>
                                    <td>Nama</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>ID</td>
                                    <td></td>
                                </tr>
                            </table>
                            <a class="item"><i class="sign out icon"></i>Logout</a>
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
            $(document).ready(function() {
                $('.ui.dropdown')
                        .dropdown({action: 'updateForm'});
            });
        </script>
    </body>
</html>
