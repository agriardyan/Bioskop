<%-- 
    Document   : home
    Created on : Nov 9, 2014, 12:35:02 PM
    Author     : Lorencius
--%>

<%@page import="com.rplo.bioskop.model.DatabaseConnection"%>
<%@page import="com.rplo.bioskop.model.Pegawai"%>
<!DOCTYPE html>
<html>
    <%
        if (session.getAttribute("username") != null) {
            if (session.getAttribute("role").equals("Admin")) {
                response.sendRedirect("halaman-utama-admin.jsp");
            } else if (session.getAttribute("role").equals("Operator")) {
                response.sendRedirect("halaman-utama-operator.jsp");
            }
        }
        
        if (null != request.getParameter("commit")) {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            RequestDispatcher rd;
            int login = Pegawai.validateLoginCredential(request.getParameter("username"), request.getParameter("password"));
            switch (login) {
                case 0:
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert(\"Unregistered username\");");
                    out.print("</script>");
                    break;
                case 1:
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert(\"Username or Password or Role was incorrect\");");
                    out.print("</script>");
                    break;
                case 2:
                    session.setAttribute("role", "Operator");
                    rd = request.getRequestDispatcher("halaman-utama-operator.jsp");
                    rd.forward(request, response);
                    break;
                case 3:
                    session.setAttribute("role", "Admin");
                    rd = request.getRequestDispatcher("halaman-utama-admin.jsp");
                    rd.forward(request, response);
                    break;
                default:
                    break;
            }
        }
    %>


    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OM-ITEM</title>
        <link rel="shortcut icon" href="img/Deep_User.png" type="image/png">
        <link href="semantic-ui/packaged/css/semantic.css" rel="stylesheet" type="text/css">
        <link href="bxslider/jquery.bxslider.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="ui container" style="min-width: 800px">
            <!--Menu bar-->
            <div class="ui menu">
                <a class="active item" href="home.jsp">
                    <i class="home icon"></i> HOME
                </a>
                <a class="item" href="nowplaying.html">
                    <i class="video icon"></i> NOW PLAYING
                </a>
                <a class="item" href="m-tix.html">
                    <i class="user icon"></i> M-TIX
                </a>
                <div class="right menu">
                    <a class="item" id="loginButton">
                        <i class="sign in icon"></i> LOGIN
                    </a>
                </div>
            </div>
            <!--End of Menu bar-->

            <!--Login Sidebar-->
            <div class="ui black small floating vertical right sidebar menu" id="loginSidebar">
                <div class="item">
                    <form class="ui form segment" method="POST" id="sideLogin">
                        <div class="field">
                            <div class="ui blue ribbon label">Username</div>
                            <div class="ui left labeled icon input">
                                <input name="username" id="username" type="text" placeholder="Username">
                                <i class="user icon"></i>
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui blue ribbon label">Password</div>
                            <div class="ui left labeled icon input">
                                <input name="password" id="password" type="password" placeholder="Password">
                                <i class="lock icon"></i>
                            </div>
                        </div>
                        <div class="field">
                            <select class="ui selection dropdown" name="role" id="role">
                                <option value="">Connect as</option>
                                <option value="ADMIN">ADMIN</option>
                                <option value="OPERATOR">OPERATOR</option>
                            </select>
                        </div>
                        <div class="field">
                            <input class="ui tiny red submit button" type="submit" name="commit" value="LOGIN">
                            <!--<div class="ui error message"></div>-->
                        </div>
                    </form>
                </div>
            </div>
            <!--End of Login Sidebar-->

            <!--Main body-->
            <div class="ui grid" style="position: absolute;">
                <div class="row">
                    <div class="three wide column">
                        <h4 class="ui top attached inverted red block header">
                            BENEFIT
                        </h4>
                        <div class="ui segment attached">
                            <!--(Lia) Benefit info <img>-->
                        </div>
                    </div>
                    <div class="ten wide column">
                        <h4 class="ui top center aligned attached inverted red block header">
                            NOW PLAYING
                        </h4>
                        <div class="ui segment attached">
                            <ul id="slider1">
                                <li><img src="img/Kucing Berdoa.jpg" alt="slide1" title="Kucing Berdoa"></li>
                                <li><img src="img/Kucing Galau.jpg" alt="slide2" title="Kucing Galau"></li>
                                <li><img src="img/Kucing Natal.jpg" alt="slide2" title="Kucing Natal"></li>
                                <li><img src="img/Kucing Fotografer.jpg" alt="slide2" title="Kucing Fotografer"></li>
                            </ul>
                        </div>
                        <h4 class="ui top center aligned attached inverted red block header">
                            COMING SOON
                        </h4>
                        <div class="ui segment attached">
                            <ul id="slider2">
                                <li><img src="img/11.jpg" alt="slide1" title="Domo"></li>
                                <li><img src="img/12.jpg" alt="slide2" title="AKB48"></li>
                                <li><img src="img/13.jpg" alt="slide3" title="The North Face"></li>
                                <li><img src="img/12.jpg" alt="slide2" title="AKB48"></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End of Main body-->

        <!--Script-->
        <script src="semantic-ui/packaged/javascript/jquery-2.1.1.js" type="text/javascript"></script>
        <script src="bxslider/jquery.bxslider.js" type="text/javascript"></script>
        <script src="semantic-ui/packaged/javascript/semantic.js" type="text/javascript"></script>
        <script type="text/javascript">
            //Reset login sidebar value when reload
            var originalState = $('#sideLogin').clone();
            $('#sideLogin').replaceWith(originalState);

            $(document).ready(function() {
                //Slideshow 1
                $('#slider1').bxSlider({
                    speed: 1000, //transition speed
                    mode: 'horizontal', //transition mode
                    captions: true, //captions based on its title
                    auto: true, //auto slide
                    autoStart: true, //auto start when the page load
                    autoControls: false,
                    adaptiveHeight: true
                });

                //Slideshow 2
                $('#slider2').bxSlider({
                    speed: 1000,
                    auto: true,
                    autoStart: true,
                    autoControls: false,
                    captions: true,
                    slideWidth: 200,
                    minSlides: 4,
                    maxSlides: 4,
                    moveSlides: 1
                });

                //Login button handler
                $("#loginButton").click(function() {
                    $("#loginSidebar")
                            .sidebar('toggle');
                });

                //Login sidebar error prompt
                $("#sideLogin").form({
                    username: {
                        identifier: 'username',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Please enter a username'
                            }
                        ]
                    },
                    password: {
                        identifier: 'password',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Please enter a password'
                            }
                        ]
                    },
                    dropdownValue: {
                        identifier: 'role',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Please choose a role'
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

