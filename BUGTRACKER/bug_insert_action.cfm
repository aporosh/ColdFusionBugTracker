<html> 
    <head> 
        <title>Input form</title>
        <style type="text/css">
            <cfinclude template="./myStyle.css">
        </style>  
    </head> 
    <body> 
        <cfinvoke component="utils" method="getUrl" returnvariable="localUrl">
        
        <cfquery name="currentUserId" datasource="cfbugtracker">
            SELECT us.user_id from public.user as us 
            WHERE us.login_name = '#GetAuthUser()#'                     
        </cfquery>
        <cfloop query="currentUserId">
            <cfset cur_user_id = '#user_id#'>
        </cfloop>
        <!--- Insert the new record ---> 
        <cfquery name="addBug" datasource="cfbugtracker"> 
            INSERT INTO public.bug 
            (status, description, short_description, priority, severity, date, ref_user_id) 
            VALUES 
            ( 'Новая','#Form.description#','#Form.short_description#',
            '#Form.prioritySel#', '#Form.severitySel#', now(), #cur_user_id#) 
        </cfquery> 
        
        <h1>Ошибка добавлена</h1> 
        <cfoutput >
            <a href="#localUrl#bugList_page.cfm">
                Вернуться к списку ошибок
            </a>
        </cfoutput>
    </body> 
</html>