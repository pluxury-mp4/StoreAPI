<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8"/>
    <title>StoreAPI</title>
</head>
<body>
<h1>StoreAPI</h1>
<hr>
<#if user.email??>
    <h3>Имя пользователя: <i>${user.name}</i> </h3>
    <b>Баланс: </b> ${user.balance} руб.<br>
    <form action="/logout" method="post">
        <input type="submit" value="Выйти">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
    </form>
    <a href="/">Главная</a><br>
    <#if user.isAdmin()><a href="/admin">Панель администратора</#if></a>
<#else>
    <a href="/login">Войти</a></h1>
    <hr>
</#if>

<#if user.isAdmin()>
    <hr>
    <h3>Создать новое уведомление</h3>
    <form action="/notification/create" method="post">
        Заголовок уведомления: <input type="text" name="title"/><br><br>
        Содержание уведомления: <input type="text" name="description"/><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Создать уведомление">

    </form>
</#if>
<#list notification as notification>
    <div>
        <p><b>${notification.title}</b> | <a href="/notification/${notification.id}">Подробнее...</a></p>
    </div>

<#else>
    <h3>Уведомлений нет</h3>
</#list>
</body>
</html>