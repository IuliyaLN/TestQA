﻿#language: ru
@tree
@БыстрыеПроверки

Функционал: <проверка формы документа Продажи>

Как <Тестировщик> я хочу
<доступность элементов на форме> 
чтобы <убедиться, что пользователь не ошибется при вводе данных> 

Контекст:
Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _0301_1 подготовительный
	Когда Экспорт основных данных

Сценарий: _0301_2 проверка функциональной опции использовать склады в Продажах
*Установка константы Учет по скаладам и проверка присутствия на форме Склад
	И я перезаполняю константу "УчетПоСкладам" значением "True"
	И пауза 30
	И В командном интерфейсе я выбираю 'Продажи' 'Продажи'
	Тогда открылось окно 'Продажи товара'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Продажа товара (создание)'
	И элемент формы "Склад" присутствует на форме
	И я закрываю все окна клиентского приложения
*Установка константы Учет по скаладам и проверка присутствия на форме Склад
	И я перезаполняю константу "УчетПоСкладам" значением "False"
	И Пауза 30
	И В командном интерфейсе я выбираю 'Продажи' 'Продажи'
	Тогда открылось окно 'Продажи товара'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Продажа товара (создание)'
	И элемент формы "Склад" отсутствует на форме
	И я закрываю все окна клиентского приложения

Сценарий: _0301_3 проверка заполнения поля Вид цены
*Открытие формы создания
	Дано Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
	Тогда открылось окно 'Продажи товара'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Продажа товара (создание)'
*Выбор покупателя и проверка заполнения Вида цен
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Наименование' |
		| 'Мосхлеб ОАО'  |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Продажа товара (создание) *'
	И элемент формы с именем 'ВидЦен' стал равен 'Оптовая'
*Выбор другого покупателя и проверка заполнения Вида цен
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И в таблице "Список" я перехожу к строке:
		| 'Наименование'              |
		| 'Магазин "Бытовая техника"' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Продажа товара (создание) *'
	И элемент формы с именем 'ВидЦен' стал равен 'Мелкооптовая'
И я закрываю все окна клиентского приложения

Сценарий: _0301_4 проверка доступности поля Валюта
*Открытие формы создания
	Дано Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
	Тогда открылось окно 'Продажи товара'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Продажа товара (создание)'
*Выбор организации с валютным учетом
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И элемент формы с именем "Валюта" присутствует на форме
*Выбор организации без валютного учета
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И элемент формы с именем "Валюта" отсутствует на форме
И я закрываю все окна клиентского приложения

Сценарий: _0301_5 проверка расположения элементов в форме Продажи
	И В командном интерфейсе я выбираю 'Продажи' 'Продажи'
	Тогда открылось окно 'Продажи товара'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	@screenshot
	Тогда открылось окно 'Продажа товара (создание)'

И я закрываю все окна клиентского приложения
И я закрываю сеанс текущего клиента тестирования
