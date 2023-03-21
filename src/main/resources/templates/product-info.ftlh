<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8" />
    <title>StoreAPI</title>
    <link rel="stylesheet"/>
</head>
<body>
<h1>StoreAPI</h1><hr>
<h4>Подробная информация о товаре</h4>
<b>Название товара: </b>${product.title}<br>
<b>Описание товара: </b>${product.description}<br>
<b>Кол-во на складе: </b>${product.in_stock}<br>
<b>Ключевые слова: </b>${product.tags}<br>
<b>Цена: </b>${product.price}<br>
<b>Автор: </b><a href="/user/${product.user.id}">${product.user.name}</a><br>

</body>
</html>