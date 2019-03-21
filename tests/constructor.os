#Использовать asserts
#Использовать logos

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт
	
	ВсеТесты = Новый Массив;
	
	ВсеТесты.Добавить("ТестДолжен_СообщитьОбОшибкеНетКонструктора");
	ВсеТесты.Добавить("ТестДолжен_СообщитьОбОшибкеСлишкомМногоПараметров");
	ВсеТесты.Добавить("ТестДолжен_СообщитьОбОшибкеСлишкомМалоПараметров");
	ВсеТесты.Добавить("ТестДолжен_СоздатьОбъект");
	ВсеТесты.Добавить("ТестДолжен_СоздатьОбъектЛог");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьПолучениеПроизвольногоПредставления");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьПолучениеСтандартногоПредставления");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьПолучениеЗначенияПоУмолчанию");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьКорректностьПроверкиУказанияФактическихПараметров");
	
	Возврат ВсеТесты;
	
КонецФункции

Процедура ТестДолжен_СообщитьОбОшибкеНетКонструктора() Экспорт
	
	Попытка
		ТекПуть = Новый Файл(ТекущийСценарий().Источник).Путь;
		ПодключитьСценарий(ОбъединитьПути(ТекПуть,"testdata", "no-magic-object.os") , "ПроверкаБезКонструктора");
		
		НовыйОбъект = Новый ПроверкаБезКонструктора(1);
	Исключение
		Ожидаем.Что(ОписаниеОшибки()).Содержит("Конструктор не определен");
	КонецПопытки;
	
КонецПроцедуры

Процедура ТестДолжен_СообщитьОбОшибкеСлишкомМногоПараметров() Экспорт
	
	Попытка
		ТекПуть = Новый Файл(ТекущийСценарий().Источник).Путь;
		ПодключитьСценарий(ОбъединитьПути(ТекПуть,"testdata", "magic-object.os") , "Проверка");
		
		НовыйОбъект = Новый Проверка(1, 2, 3, 4, 5);
		
	Исключение
		Ожидаем.Что(ОписаниеОшибки()).Содержит("необходимых параметров: 3, передано параметров 5");
	КонецПопытки;
	
КонецПроцедуры

Процедура ТестДолжен_СообщитьОбОшибкеСлишкомМалоПараметров() Экспорт
	
	Попытка
		ТекПуть = Новый Файл(ТекущийСценарий().Источник).Путь;
		ПодключитьСценарий(ОбъединитьПути(ТекПуть,"testdata", "magic-object.os") , "Проверка");
		
		НовыйОбъект = Новый Проверка(1, 2);
		
	Исключение
		Ожидаем.Что(ОписаниеОшибки()).Содержит("необходимых параметров: 3, передано параметров 2");
	КонецПопытки;
	
КонецПроцедуры

Процедура ТестДолжен_СоздатьОбъект() Экспорт
	
	ТекПуть = Новый Файл(ТекущийСценарий().Источник).Путь;
	ПодключитьСценарий(ОбъединитьПути(ТекПуть,"testdata", "magic-object.os") , "Проверка");
	
	НовыйОбъект = Новый Проверка(1, 2, 3);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьПолучениеСтандартногоПредставления() Экспорт
	
	ТекПуть = Новый Файл(ТекущийСценарий().Источник).Путь;
	ПодключитьСценарий(ОбъединитьПути(ТекПуть,"testdata", "magic-object.os") , "Проверка");
	
	НовыйОбъект = Новый Проверка(1, 2, 3);
	Ожидаем.Что(Строка(НовыйОбъект)).Равно("Проверка");
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьПолучениеПроизвольногоПредставления() Экспорт
	
	ТекПуть = Новый Файл(ТекущийСценарий().Источник).Путь;
	ПодключитьСценарий(ОбъединитьПути(ТекПуть,"testdata", "magic-object.os") , "Проверка");
	
	НовыйОбъект = Новый Проверка(1, 2, 3);
	НовыйОбъект.ПроизвольноеПредставление = "Я специальный объект";
	Ожидаем.Что(Строка(НовыйОбъект)).Равно("Я специальный объект");
	
КонецПроцедуры

Процедура ТестДолжен_СоздатьОбъектЛог() Экспорт
	
	НовыйОбъект = Новый Лог();
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьПолучениеЗначенияПоУмолчанию() Экспорт
	
	ТекПуть = Новый Файл(ТекущийСценарий().Источник).Путь;
	ПодключитьСценарий(ОбъединитьПути(ТекПуть,"testdata", "magic-object.os") , "Проверка");
	
	НовыйОбъект = Новый Проверка(1, 2, 3);

	Ожидаем.Что(НовыйОбъект.ЗначПоУмолчанию).Равно(4);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьКорректностьПроверкиУказанияФактическихПараметров() Экспорт

	ТекПуть = Новый Файл(ТекущийСценарий().Источник).Путь;
	ПодключитьСценарий(ОбъединитьПути(ТекПуть,"testdata", "obj-constructor-with-req-prms-after-opt.os") , "ПроверкаКонструктора");
	
	НовыйОбъект = Новый ПроверкаКонструктора(22, 23);

	Ожидаем.Что(НовыйОбъект.П1, "Параметр 1 заполнился верно").Равно(22);
	Ожидаем.Что(НовыйОбъект.П2, "Параметр 2 заполнился верно").Равно(23);

	Попытка
		НовыйОбъект = Новый ПроверкаКонструктора(22);
		Ожидаем.Что(Ложь,"Объект не должен быть создан").ЭтоИстина();
	Исключение
		Ожидаем.Что(ОписаниеОшибки()).Содержит("Недостаточно фактических параметров");	
	КонецПопытки;

КонецПроцедуры