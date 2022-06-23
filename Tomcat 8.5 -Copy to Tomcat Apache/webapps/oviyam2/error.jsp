<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta charset="utf-8" />
        <title>Oviyam </title>

        <script type="text/javascript" src="js/lib/jquery-latest.js"></script>
        <script type="text/javascript" src="js/lib/jquery-ui-latest.js"></script>
        <script type="text/javascript" src="js/lib/themeswitchertool.js"></script>
        <script type="text/javascript" src="js/lib/jquery.cookies.min.js"></script>

		<link rel="icon" type="image/png" href="images/favicon.png"/>
        <link rel="stylesheet" href="css/login.css" type="text/css" />
        <link rel="stylesheet" type="text/css" href="css/jquery.ui.all.css" />


        <script type="text/javascript">
            //if(navigator.platform.indexOf('iPad') != -1) {
            if( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) {
                var loc = window.location.toString();
                loc = loc.substring(0, loc.indexOf('/', loc.lastIndexOf(':')));
                //window.location = loc + '/iviewer';
                alert('Your browser is not supported.');
                window.stop();
            }

            $(document).ready(function() {
                var theme = $.cookies.get( 'theme' );
            	if(theme == null) {
                    theme = 'Dark Hive';
            	}

		$('#switcher').themeswitcher({
                    loadTheme: theme,
                    cookieName:'',
                    width: 160
                });

		$('#loginButton').button();

            });

        </script>
    </head>
    <body class="ui-widget-content" style="border:none;" onload="document.login.j_username.focus()">
    	 <center><h2>Login Failed!</h2></center>
    <section>
        <form name="login" id="login" action="j_security_check" method="POST">
            <fieldset>
                <legend><font>Login</font></legend>
                <h1>Oviyam 2</h1> <h4>DICOM Web Workstation - Version 2.8</h4>
                <label><font>Username </font><span class="mandatory"><font>*</font></span><font></font></label>
                <input type="text" name="j_username" class="textInput" placeholder="Username" required>

                <label><font>Password </font><span class="mandatory"><font>*</font></span><font></font></label>
                <input type="password" name="j_password" class="textInput" placeholder="Password" required>

                <input type="submit" name="submit" id="loginButton" value="Login" class="button disabled">
            </fieldset>
        </form>
    </section>
    <footer style="text-align: center;">OVIYAM 2.8 requires latest version of Google Chrome / Safari / Mozila Firefox.</footer>
</body>
</html>