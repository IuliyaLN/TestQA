﻿#language: ru

@tree

Функционал: проверка документа Заказ

Как <менеджер по закупкам> я хочу
<добавить услугу в Заказ> 
чтобы <проверить указания количества для Услуги> 

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: проверка указания количества для Услуги
* Открытие Заказа
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И в таблице "Список" я перехожу к последней строке
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ * от *'
* Добавление услуги в табличную часть
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	* Выбор услуги
		И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
		Тогда открылось окно 'Товары'
		И я нажимаю на кнопку с именем 'ФормаДерево'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Услуги'       |
		И в таблице  "Список" я перехожу на один уровень вниз
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Доставка'       |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заказ * от * *'
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '2 000,00'
	И в таблице "Товары" я завершаю редактирование строки
	Когда Проверяю шаги на Исключение:
    |И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1''|
	И в таблице "Товары" я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ФормаЗаписать'

* Закрытие форм и клиента
И я закрываю все окна клиентского приложения
И я закрываю сеанс текущего клиента тестирования
