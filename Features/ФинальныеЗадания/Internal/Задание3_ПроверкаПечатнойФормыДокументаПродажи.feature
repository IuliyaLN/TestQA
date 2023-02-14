﻿#language: ru
@tree
@ПечатныеФормы

Функционал: <проверка печатной формы "Расходная товараная накладная" документа Продажи>

Как <Тестировщик> я хочу
<проверить движения документа Продажи> 
чтобы <убедиться, что документ делает движения по нужным регистрам> 

Контекст:
Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _0304_1 подготовительный
*Загрузка тестовых данных
	Когда экспорт документа Продажи для проверки движений
*Проведение документов расхода товара
	И я выполняю код встроенного языка на сервере
		|'Документы.РасходТовара.НайтиПоНомеру("000000097").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|

Сценарий: _0304_2 проверка печатной формы Расходная товараная накладная документа Продажи
*Открытие документа Продажи
	Дано Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
	Когда открылось окно 'Продажи товара'
	И в таблице "Список" я перехожу к строке:
		| 'Номер'     |
		| '000000097' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Продажа * от *'
*Проверка печатной формы Расходная накладная
	Когда открылось окно 'Продажа * от *'
	И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
	Тогда открылось окно 'Таблица'
	И я жду когда в табличном документе 'SpreadsheetDocument' заполнится ячейка 'R3C3' в течение 20 секунд
	Дано Табличный документ "SpreadsheetDocument" равен макету "ПечатнаяФормаРасходнаяНакладная" по шаблону

И я закрываю все окна клиентского приложения
И я закрываю сеанс текущего клиента тестирования