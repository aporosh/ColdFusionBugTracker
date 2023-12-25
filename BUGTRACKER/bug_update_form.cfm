<html> 
    <head> 
        <title>Update Bug Form</title> 
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
        <h1>Форма изменения ошибки</h1>  
        <div class="table_style">  
            <table> 
                <!--- begin html form; put action page in the "action" attribute of the form tag. ---> 
                
                <form action="bug_update_action.cfm" method="post"> 
                    <cfset bugById = new bug_component().getBugById(bug_id="#URL.bug_id#")>
                    <cfoutput query="bugById">
                        <tr> 
                            <td>
                                <div class="input-box">
                                    <label for="bug_id">Номер</label>
                                    <input class="bug_id" name="bug_id" value="#bug_id#" aria-label="Номер" >
                                </div>    
                            </td> 
                            <td>
                                <div class="input-box">
                                    <label for="status">Статус</label>
                                    <input  name="status" id="status" size="20" maxlength="20"  value="#status#" hidden>
                                    <select name="statusSel" id="statusSel">
                                        <option value="Новая">Новая</option>
                                        <option value="Открытая">Открытая</option>
                                        <option value="Решенная">Решенная</option>
                                        <option value="Закрытая">Закрытая</option>
                                    </select>
                                </div>
                            </td> 
                            <td>
                                <div class="input-box">
                                    <label for="priority">Срочность</label>
                                    <input type="text" name="priority" id="priority" value="#priority#" hidden>
                                    <select name="prioritySel" id="prioritySel">
                                        <option value="Очень Срочно">Очень Срочно</option>
                                        <option value="Срочно">Срочно</option>
                                        <option value="Несрочно">Несрочно</option>
                                        <option value="Совсем несрочно">Совсем несрочно</option>
                                    </select>
                                </div>    
                            </td> 
                            <td>
                                <div class="input-box">
                                    <label for="severity">Критичность</label>
                                    <input type="Text" name="severity" id="severity" value="#severity#" hidden>
                                    <select name="severitySel" id="severitySel">
                                        <option value="Авария">Авария</option>
                                        <option value="Критичная">Критичная</option>
                                        <option value="Некритичная">Некритичная</option>
                                        <option value="Запрос на изменение">Запрос на изменение</option>
                                    </select>
                                </div>
                            </td> 
                        </tr>
                        
                        <tr> 
                            
                                <div class="input-box">
                                    <label for="short_description">Краткое описание</label>
                                    <input class="update_textarea" id="description" type="Text" name="short_description" size="255" maxlength="255" value="#short_description#">
                                </div>
                            
                        </tr>
                        <tr>  
                            
                                <div class="input-box">
                                    <label for="description">Описание</label>
                                    <textarea class="update_textarea" id="description" type="Text" name="description" size="4000" maxlength="4000" value="#description#">#description#</textarea>
                                </div>
                            
                        </tr> 
                        
                        <tr>
                            
                            <td><b>Системная информация</b></td>
                        </tr>
                        <tr> 
                            <td>
                                <div class="input-box">
                                    <label for="user">Автор</label>
                                    <input type="Text" name="user" value="#first_name#" disabled="true">
                                </div>
                            </td>  
                            <td>
                                <div class="input-box">
                                    <label for="date">Дата создания</label>
                                    <input name="date" value="#date#" disabled="true">
                                </div>
                            </td> 
                        </tr>  
                        
                        <tr> 
                            
                            <td>
                                <input class="btn" name="save" type="Submit" value="Сохранить">&nbsp;
                            </td> 
                        </tr> 
                    </cfoutput>
                </form> 
                
                <!--- end html form ---> 
            </table>
        </div>
        <h2>История изменения ошибки</h2>  
        <cfset historyList = new history_component().getHistoryList(bug_id="#URL.bug_id#")>
        <div class="table_style">  
            <table width="100%"  border="1" cellspacing="0" cellpadding="5">
                <tr>
                    <td><b>Действие</b></td>
                    <td><b>Коментарий</b></td>
                    <td><b>Пользователь</b></td>
                    <td><b>Дата изменения ошибки</b></td>    
                </tr>
                <cfoutput query="historyList">
                    <tr>
                        <td>#act#</td>
                        <td>#note#</td>
                        <td>#first_name#</td>
                        <td>#date#</td>
                        
                    </tr>
                </cfoutput>
            </table>
        </div>
        
        <script>
            function setSelection(id, idSelect) {    
                let element = document.getElementById(id);
                let valueToSelect = document.getElementById(idSelect).value;
                element.value = valueToSelect;
            }

            setSelection('statusSel', 'status');
            setSelection('prioritySel', 'priority');
            setSelection('severitySel', 'severity');
            
        </script>
    </body> 
</html>