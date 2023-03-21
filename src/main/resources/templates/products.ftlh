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
    <a href="/notifications/">Уведомления</a><br>
    <#if user.isAdmin()><a href="/admin">Панель администратора</#if></a>
<#else>
    <a href="/login">Войти</a></h1>
    <hr>
</#if>
<form action="/" method="get">
    Поиск: <input type="text" name="title"/><br><br>
    <input type="submit" value="Поиск"/>
</form>
<#list products as product>
    <div>
        <p><b>${product.title}</b> ${product.price} руб. | <a href="/product/${product.id}">Подробнее...</a></p>
    </div>

<#else>
    <h3>Товаров нет</h3>
</#list>
<#if user.email??>
    <hr>
    <h3>Создать новый товар</h3>
    <form action="/product/create" method="post">
        Название объявления: <input type="text" name="title"/><br><br>
        Описание объявления: <input type="text" name="description"/><br><br>
        Кол-во на складе: <input type="number" name="in_stock"/><br><br>
        Ключевые слова: <input type="text" name="tags"/><br><br>
        Цена: <input type="number" name="price"/><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Добавить товар">

    </form>
</#if>
</body>
</html>