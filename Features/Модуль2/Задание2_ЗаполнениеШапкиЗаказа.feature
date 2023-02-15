﻿#language: ru
@tree
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: создание Заказа с заполненой шапкой

Как <Тестирвощик> я хочу
<создать Заказ с заполненной шапкой> 
чтобы <при тестировании использовать, заранее созданный Заказ> 

Сценарий: создание Заказа с заполненой шапкой
*Создание документа
	Дано Я открываю навигационную ссылку "e1cib/list/Документ.Заказ"
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
*Заполнение шапки
	Тогда открылось окно 'Заказ (создание)'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И в таблице "Список" я перехожу к строке:
		| 'Наименование' |
		| 'Мосхлеб ОАО'  |
	И в таблице "Список" я выбираю текущую строку
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Большой'
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
*Запоминание созданного документа
	И я запоминаю значение поля с именем 'Номер' как 'Номер'
	И я запоминаю значение поля с именем 'Организация' как 'Организация'
	И я запоминаю значение поля с именем 'Покупатель' как 'Покупатель'
И я закрываю все окна клиентского приложения