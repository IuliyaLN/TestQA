﻿#language: ru

@tree

Функционал: <описание фичи>

Как <менеджер по закупкам> я хочу
<изменить существующий Заказ> 
чтобы <изменить итоговую сумму документа> 

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий
И Я запоминаю значение выражения '0' в переменную "ИтоговаяСумма"

Сценарий: проверка итоговой суммы Заказа
* Открытие Заказа
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И в таблице "Список" я перехожу к последней строке
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ * от *'
* Редактирование существующей табличной части
	//И я запоминаю строку "0" в переменную "ИтоговаяСумма"
	И для каждой строки таблицы "Товары" я выполняю
		И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '500,00'
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '6'
		И в таблице "Товары" я завершаю редактирование строки
		И я запоминаю значение поля с именем 'ТоварыСумма' таблицы 'Товары' как 'Сумма'
		И Я запоминаю значение выражения '$ИтоговаяСумма$ + $Сумма$' в переменную "ИтоговаяСумма"
* Добавление нового товара
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	* Выбор товара
		И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
		Тогда открылось окно 'Товары'
		И я нажимаю на кнопку с именем 'ФормаСписок'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Сапоги'       |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заказ * от * *'
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '300,00'
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '23'
	И в таблице "Товары" я завершаю редактирование строки
	И я запоминаю значение поля с именем 'ТоварыСумма' таблицы 'Товары' как 'Сумма'
	И Я запоминаю значение выражения '$ИтоговаяСумма$ + $Сумма$' в переменную "ИтоговаяСумма"
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
* Проверка итогой суммы
	И элемент формы с именем "ТоварыИтогСумма" стал равен "$ИтоговаяСумма$"

