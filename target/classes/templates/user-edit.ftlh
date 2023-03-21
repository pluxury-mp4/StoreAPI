<!DOCTYPE html>
<html>
<head>
    <title>StoreAPI</title>
</head>
<body>
<h1>StoreAPI</h1><hr>
<h3>Редактирование пользователя ${user.name}</h3>
<form action="/admin/user/edit" method="post">
    <#list roles as role>
        <div>
            <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
        </div>
    </#list>
    <input type="hidden" value="${user.id}" name="userId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <button type="submit">Сохранить</button>
    <br><hr><br>
    Баланс: <input type="number" name="balance"/><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Изменить">
</form>
</body>
</html>