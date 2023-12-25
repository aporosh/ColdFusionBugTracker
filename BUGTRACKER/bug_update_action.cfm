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
        <!--- Update the record for Bug --->
        <cfquery name="updateBug" datasource="cfbugtracker"> 
            UPDATE public.bug 
            Set 
            status = '#Form.statusSel#', 
            description = '#Form.description#',
            short_description = '#Form.short_description#', 
            priority = '#Form.prioritySel#', 
            severity = '#Form.severitySel#'
            
            WHERE bug_id = '#Form.bug_id#'
        </cfquery> 
        <!--- Create the history record --->
        <cfquery name="addHistory" datasource="cfbugtracker"> 
            INSERT INTO history 
            (ref_bug_id, act, note, date, ref_user_id) 
            VALUES 
            ( '#Form.bug_id#','#Form.statusSel#','#Form.short_description#',
             now(), #cur_user_id#) 
        </cfquery> 
        <h1>Ошибка изменена</h1> 
        <cfoutput >
            <a href="#localUrl#bugList_page.cfm">
                Вернуться к списку ошибок
            </a>
        </cfoutput>
    </body> 
</html>