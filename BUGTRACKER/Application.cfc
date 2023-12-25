<cfcomponent> 
    <cfset This.name = "Orders"> 
    <cfset This.Sessionmanagement="True"> 
    <cfset This.loginstorage="session"> 

    <cffunction name="OnRequestStart"> 
        <cfargument name = "request" required="true"/> 
        <cfif IsDefined("Form.logout")> 
            <cflogout> 
        </cfif> 

        <cflogin> 
            <cfif NOT IsDefined("cflogin")> 
                <cfinclude template="loginform.cfm"> 
                <cfabort> 
            <cfelse> 
                <cfif cflogin.name IS "" OR cflogin.password IS ""> 
                    <cfoutput> 
                        <h2>You must enter text in both the User Name
                        and Password fields. 
                        </h2> 
                    </cfoutput> 
                    <cfinclude template="loginform.cfm"> 
                    <cfabort> 
                <cfelse> 
                    <cfquery name="loginQuery" dataSource="cfbugtracker"> 
                        SELECT login_name, role, user_id 
                        FROM public.user 
                        WHERE 
                        login_name = '#cflogin.name#' 
                        AND pass = '#cflogin.password#' 
                    </cfquery> 
                    <cfif loginQuery.role NEQ ""> 
                        <cfloginuser name="#cflogin.name#" Password = "#cflogin.password#" 
                            roles="#loginQuery.role#"> 
                    <cfelse> 
                        <cfoutput> 
                            <H2>Your login information is not valid.<br> 
                            Please Try again</H2> 
                        </cfoutput> 
                        <cfinclude template="loginform.cfm"> 
                        <cfabort> 
                    </cfif> 
                </cfif> 
            </cfif> 
        </cflogin> 

        <cfif GetAuthUser() NEQ ""> 
            <cfoutput> 
                <form action="securitytest.cfm" method="Post"> 
                    <input class="btn" type="submit" Name="Logout" value="Logout"> 
                </form> 
            </cfoutput> 
        </cfif> 

    </cffunction> 
</cfcomponent>