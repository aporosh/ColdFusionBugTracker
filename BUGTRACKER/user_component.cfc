<cfcomponent > 
    <cffunction name="getUserList"> 
        <cfquery 
            name="userList" datasource="cfbugtracker" > 
            SELECT user_id, first_name, last_name, login_name
            FROM public.user
        </cfquery> 
        <cfreturn userList> 
    </cffunction> 
    <cffunction name="getUserID"> 
        <cfargument name="login_name"  type="string">
        <cfquery 
            name="userID" datasource="cfbugtracker" > 
            SELECT user_id
            FROM public.user
            WHERE (login_name = #login_name#) 
        </cfquery> 
        <cfreturn userID> 
    </cffunction>         
</cfcomponent>