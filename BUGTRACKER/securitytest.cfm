<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<html> 
    <head> 
        <title>Basic authentication security test page</title> 
        <style type="text/css">
            <cfinclude template="./myStyle.css">
        </style>
    </head> 

    <body> 
        <div class="welcome">
            <div class="welcome_content">
                <cfinvoke component="utils" method="getUrl" returnvariable="localUrl">
                <cfoutput> 
                    <h2>Welcome #GetAuthUser()#!</h2> 
                </cfoutput> 
                

                ALL Logged-in Users see this message.<br> 
                <br> 
                <cfscript> 
                    if (IsUserInRole("admin")) {
                        WriteOutput("Users in the admin role see this message.<br><br>"); 
                        
                    }

                    if (IsUserInRole("user")) 
                    WriteOutput("Everyone in the user role sees this message.<br><br>"); 
                </cfscript>
                
                <cfoutput >
                    <a href="#localUrl#bugList_page.cfm">
                        Перейти к списку ошибок
                    </a> 
                </cfoutput>
            </div>
        </div>
    </body> 
</html>