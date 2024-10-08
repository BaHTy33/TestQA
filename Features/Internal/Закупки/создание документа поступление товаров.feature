﻿#language: ru
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: создание документа Поступление товаров

Как Менеджер по закупкам я хочу
создать документ поступление товаров 
чтобы поставить товар на учет  
Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий
Сценарий: Создание документа поступление товаров
// создание документа
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю "Закупки" "Поступления товаров"
	Тогда открылось окно "Поступления товаров"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно "Поступление товара (создание)"
* Заполнение шапки документа
	И из выпадающего списка с именем 'Организация' я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем 'Склад' я выбираю точное значение "Малый"
	Тогда элемент формы с именем 'Склад' стал равен "Малый"	
	И из выпадающего списка с именем 'Валюта' я выбираю точное значение "Рубли"
	И я нажимаю кнопку выбора у поля с именем 'Поставщик'
	Тогда открылось окно "Контрагенты"
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000012" | "Мосхлеб ОАО"  |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Поступление товара (создание) *"
* Заполнение товарной части
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	Тогда открылось окно "Товары"
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000027" | "Ряженка"      |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Поступление товара (создание) *"
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыАртикул'
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыЦена'
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' я выбираю текущую строку
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "1,00"
	И в таблице 'Товары' я завершаю редактирование строки
* Проверка заполнения табличной части
	Тогда таблица 'Товары' содержит строки:
		| 'Товар'   | 'Артикул' | 'Цена'  | 'Количество' | 'Сумма' |
		| 'Ряженка' | 'R45'     | '45,00' | '1,00'       | '45,00' |
* Сохраняем номер
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я запоминаю значение поля "Номер" как "Номер"	
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна "Поступление товара (создание) *" в течение 20 секунд
* Проверка создания документа
	И таблица "Список" содержит строки:
		| "Номер"       |
		| '$Номер$' |
	
Сценарий: проверка наличия в справочнике номенклатуры Ряженка
	И В командном интерфейсе я выбираю "Товарные запасы" "Товары"
	Тогда открылось окно "Товары"
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И таблица "Список" содержит строки:
		| "Наименование"       |
		| 'Ряженка' |