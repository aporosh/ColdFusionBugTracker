<html> 
    <head> 
        <title>Insert Bug Form</title>
        <style type="text/css">
            <cfinclude template="./myStyle.css">
        </style> 
    </head> 
    <body>
        <cfinvoke component="utils" method="getUrl" returnvariable="localUrl">
        <cfoutput >
            <a href="#localUrl#bugList_page.cfm">
                Вернуться к списку ошибок
            </a>            
        </cfoutput> 
        <h1>Форма регистрации ошибки</h1> 
        <div class="table_style">  
            <table> 
                <!--- begin html form; put action page in the "action" attribute of the form tag. ---> 
                <form action="bug_insert_action.cfm" method="post"> 
                    <tr> 
                        <td>Краткое описание</td> 
                        <td><input class=" insert_textarea" type="Text" name="short_description" size="255" maxlength="255"></td> 
                    </tr>
                    <tr> 
                        <td>Описание</td> 
                        <td><textarea class=" insert_textarea" type="Text" name="description" size="4000" maxlength="4000"></textarea></td> 
                    </tr> 
                     
                    <tr> 
                        <td>Срочность</td> 
                            <td>
                                <select name="prioritySel" id="prioritySel">
                                    <option value="Очень Срочно">Очень Срочно</option>
                                    <option value="Срочно">Срочно</option>
                                    <option value="Несрочно">Несрочно</option>
                                    <option value="Совсем несрочно">Совсем несрочно</option>
                                </select>
                            </td>  
                    </tr> 
                    <tr> 
                        <td>Критичность</td> 
                        <td>
                            <select class="field" name="severitySel" id="severitySel">
                                <option value="Авария">Авария</option>
                                <option value="Критичная">Критичная</option>
                                <option value="Некритичная">Некритичная</option>
                                <option value="Запрос на изменение">Запрос на изменение</option>
                            </select>
                        </td>
                    </tr> 
                    <tr> 
                        <td>&nbsp;</td> 
                        <td>
                            <input class="btn" type="Submit" value="Добавить">&nbsp;
                            <input class="btn" type="Reset" value="Очистить форму"></td> 
                    </tr> 
                </form> 
                <!--- end html form ---> 
            </table>
        </div>   
    </body> 
</html>