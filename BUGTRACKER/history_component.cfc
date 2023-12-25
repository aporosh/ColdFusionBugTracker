<cfcomponent > 
    <cffunction name="getHistoryList"> 
        <cfargument name="bug_id"  type="string">
        <cfquery 
            name="historyList" datasource="cfbugtracker" > 
            SELECT hs.act, hs.note, us.first_name, hs.date
            FROM history as hs
            join public.user us on us.user_id = hs.ref_user_id
            WHERE hs.ref_bug_id= '#bug_id#'
            ORDER BY date DESC;
        </cfquery> 
        <cfreturn historyList> 
    </cffunction> 
</cfcomponent>