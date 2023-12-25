<style type="text/css">
    <cfinclude template="./myStyle.css">
</style>

<cfinvoke component="utils" method="getUrl" returnvariable="localUrl">

<cfset bugList = new bug_component().getBugList()>


<h1>Система регистрации ошибок</h1>    
<cfform>
    <cfinput class="btn" name="location.reload()" type="submit" value="Обновить таблицу">&nbsp;
    <cfinput class="btn" name="createData" type="button" value="Добавить ошибку" onclick="window.open('#localUrl#bug_insert_form.cfm', '_self')">&nbsp;
</cfform>

<div class="bugListContainer">
<cfoutput query="bugList">
    <div class="bugContainer" data-href="#localUrl#bug_update_form.cfm?bug_id=#bug_id#">
        <div class="infoCell infoCell1">
            <span>###bug_id#</span>
            <span>#status#</span>
        </div>
        <div class="infoCell infoCell2">
            #short_description#
        </div>
        <div class="infoCell infoCell3">
            <span>#priority#</span>
            <span>#severity#</span>
        </div>
        <div class="infoCell infoCell4">
            <span>#first_name#</span>
            <span>#date#</span>
        </div>        
    </div>
</cfoutput>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
    $(document).ready(function($) {
        $('*[data-href]').on('click', function() {
            window.location = $(this).data("href");
        });
    });
</script>
	
    
