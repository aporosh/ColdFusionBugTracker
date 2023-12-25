<head>
  <style type="text/css">
    <cfinclude template="./myStyle.css">
 </style>
</head>
<body>
    <h1>Вход в систему BUGTRACKER</h1> 
    <cfoutput> 
        <form action="#CGI.script_name#?#CGI.query_string#" method="Post"> 
            <table> 
                <tr> 
                    <td>
                        <div class="input-box">
                            <label for="j_username">user name</label>
                            <input type="text" name="j_username">
                        </div>
                    </td> 
                </tr> 
                <tr> 
                    <td>
                        <div class="input-box">
                            <label for="j_password">password</label>
                            <input type="password" name="j_password">
                        </div>
                    </td> 
                </tr> 
            </table> 
            <br> 
            <input class="btn" type="submit" value="Войти"> 
        </form> 
    </cfoutput>
</body>