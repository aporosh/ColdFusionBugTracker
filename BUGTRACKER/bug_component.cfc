<cfcomponent > 
    <cffunction name="getBugList"> 
        <cfquery 
            name="bugList" datasource="cfbugtracker" > 
            SELECT bg.bug_id, bg.status, bg.short_description, bg.description, bg.priority, bg.severity, us.first_name, bg.date
            FROM public.bug bg
			join public.user us on us.user_id = bg.ref_user_id
            ORDER BY date DESC;
        </cfquery> 
        <cfreturn bugList> 
    </cffunction> 
    <cffunction name="getBugByID"> 
        <cfargument name="bug_id"  type="string">
        <cfquery 
            name="bugById" datasource="cfbugtracker" > 
            SELECT bg.bug_id, bg.status, bg.short_description, bg.description, bg.priority, bg.severity, us.first_name, bg.date
            FROM public.bug bg
			join public.user us on us.user_id = bg.ref_user_id
            WHERE (bg.bug_id = #bug_id#) 
        </cfquery> 
        <cfreturn bugById> 
    </cffunction>         
</cfcomponent>