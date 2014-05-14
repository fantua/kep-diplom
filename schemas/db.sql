-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Апр 16 2014 г., 12:35
-- Версия сервера: 5.5.32-MariaDB
-- Версия PHP: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `itdeya`
--
CREATE DATABASE IF NOT EXISTS `diplom` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `diplom`;

-- --------------------------------------------------------

--
-- Структура таблицы `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` char(40) NOT NULL DEFAULT '',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `created_at`, `active`) VALUES
(1, 'admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `preview_content` text NOT NULL,
  `full_content` text NOT NULL,
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `name`, `preview_content`, `full_content`, `date`) VALUES
(16, 'Как решить проблему с аккумулятором iPhone и iPad?', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="http://s.appleinsider.ru/2014/04/IMG_3631-1300x866.jpg" style="height:333px; width:500px" /></p>\r\n\r\n<p>Инструкций о том, как сохранить уровень заряда аккумулятора iPhone или iPad, довольно много, однако ни одна из них не была написана человеком, который сталкивался с этой проблемой на протяжении нескольких лет &mdash; работником Genius Bar в Apple Store.</p>\r\n', '<p><img alt="" src="http://s.appleinsider.ru/2014/04/IMG_3631-1300x866.jpg" style="height:400px; width:600px" /></p>\r\n\r\n<p>Инструкций о том, как сохранить уровень заряда аккумулятора iPhone или iPad,довольно много, однако ни одна из них не была написана человеком, который сталкивался с этой проблемой на протяжении нескольких лет &mdash; работником Genius Bar в Apple Store. На основе своих исследований и многолетней практики он подготовил самый полный &laquo;справочник&raquo; по устранению проблемы с быстрым расходом батареи iOS-устройства. И сегодня мы поделимся им с вами.</p>\r\n\r\n<p>Прежде всего следует отметить, что в 99,9% случаев проблемы с батареей вызваны не самой iOS. Большое количество запущенных приложений &laquo;в фоне&raquo;, которые еще вдобавок используют вашу геолокацию, регулярное обновление почтовых ящиков &mdash; если избавиться от всех подобных причин, ваш iPhone перестанет быть лучшим другом ближайшей розетки. Но согласитесь, что никто не использует девайс таким образом &mdash; в противном случае, вместо покупки iPhone можно ограничиться старой Nokia.</p>\r\n\r\n<p>Данная инструкция направлена на то, чтобы сохранить расход заряда аккумулятора с минимальным ущербом, без отключения главных функций вашего смартфона или планшета.</p>\r\n\r\n<p>Отключите службы геолокации для конкретных приложений</p>\r\n\r\n<p>Определение вашего местонахождения &mdash; одна из основных причин проблем с аккумулятором. Но отключать службы геолокации насовсем, как это советуют делать многие &laquo;эксперты&raquo;, не стоит: вдруг вам неожиданно понадобится воспользоваться картами? Лучше выключите их для отдельных приложений &mdash; автор заметки советует в первую очередь сделать это для программы Facebook, но вам лучше изучить все приложения, использующие местоположение. Вот я, например, не понимаю, зачем программе &laquo;Яндекс.Деньги&raquo; требуется знать, где я нахожусь.</p>\r\n\r\n<p>Сделать это можно в меню &laquo;Настройки&raquo; &mdash; &laquo;Приватность&raquo; &mdash; &laquo;Службы геолокации&raquo;.</p>\r\n\r\n<p>Выключите фоновое обновление программ для неиспользуемых приложений</p>\r\n\r\n<p>Вряд ли вам нужно знать о минорном обновлении каждого установленного приложения &mdash; в конце концов, многими программами мы пользуемся довольно редко, только при необходимости. Поэтому целесообразно отключить фоновое обновление для некоторых программ. Для этого необходимо войти в меню &laquo;Настройки&raquo; &mdash; &laquo;Основные&raquo; &mdash; &laquo;Обновление контента&raquo;.</p>\r\n\r\n<p>Прекратите закрывать приложения из панели мультизадачности</p>\r\n\r\n<p>Многие считают, что постоянно &laquo;выкидывая&raquo; приложения из панели многозадачности, они помогают iPhone работать дольше, ведь программы прекращают &laquo;фоновую&raquo; работу.</p>\r\n\r\n<p>Это ложь.</p>\r\n\r\n<p>Безусловно, вы закрываете работающие программы. Но если делаете это с завидной периодичностью, то уровень заряда iOS-устройства будет уменьшаться такими же темпами. Почему?</p>\r\n\r\n<p>Дело в том, что каждый раз, когда вы закрываете приложение, вы &laquo;выселяете&raquo; его из оперативной памяти телефона. Когда вы открываете его снова, то в дело опять же вступает оперативная память. Подобные &laquo;стрессы&raquo; оказывают на аккумулятор гораздо более негативное воздействие, нежели приложение просто находилось бы в панели мультизадачности.</p>\r\n\r\n<p>Кроме того, ведь далеко не все программы работают &laquo;в фоне&raquo;, пока находятся в списке открытых: iOS &laquo;замораживает&raquo; их, а затем запускает обратную процедуру, как только вы обращаетесь к приложениям снова.</p>\r\n\r\n<p>Как бы то ни было, никто не мешает вам почистить панель многозадачности пару раз в день &mdash; например, перед сном.</p>\r\n\r\n<p>Временно отключите push-уведомления о новых письмах</p>\r\n\r\n<p>Если первые два шага вам не помогли, попробуйте на время отключить push-уведомления почтовых приложений. Поэкспериментируйте: установите различный интервал обновления почты &mdash; каждый час, полчаса, 15 минут, а затем посмотрите, как эти действия повлияют на время автономной работы девайса.</p>\r\n\r\n<p>Вообще, эта тема довольно &laquo;скользкая&raquo;, поскольку во многом зависит от почтового сервера, который вы используете. Например, с ящиками Exchange наблюдаются серьезные проблемы, связанные с батареей.</p>\r\n\r\n<p>Отключите push-уведомления для неиспользуемых приложений</p>\r\n\r\n<p>Неужели вам нужно получать уведомления от всех программ, установленных на iPhone или iPad? Думаю, нет. Многие игры иногда присылают уведомления с просьбой вернуться обратно на &laquo;поле битвы&raquo; или &laquo;ферму&raquo; &mdash; вряд ли вы испытываете в этом острую потребность.</p>\r\n\r\n<p>Просто зайдите в &laquo;Центр уведомлений&raquo; в настройках iOS-устройства и отключите неиспользуемые приложения.</p>\r\n\r\n<p>Отключите процентное отображение уровня заряда батареи</p>\r\n\r\n<p>Для этого зайдите в настройки, затем &laquo;Основные&raquo; &mdash; &laquo;Статистика&raquo;. Пролистайте вниз и переключите нужный тумблер в положение &laquo;выключено&raquo;. Поверьте, это помогает.</p>\r\n\r\n<p>Не забывайте про авиарежим</p>\r\n\r\n<p>Во время поездок на поезде, в метро или перелетов, а также в местах с плохим покрытием сотовой сети по возможности включайте авиарежим. Когда телефон находится в поисках сотового сигнала, то расходует зарядку намного быстрее.</p>\r\n\r\n<p>Надеюсь, эти советы помогут вам продлить &laquo;жизнь&raquo; вашего смартфона или планшета. Сам автор заметки гарантирует успешный результат после проведения всех вышеперечисленных манипуляций.</p>\r\n', 1397597760),
(17, 'Facebook в двух шагах от запуска собственной платежной системы', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="http://hi-news.ru/wp-content/uploads/2014/04/Facebook-Like-650x365.jpg" style="height:281px; width:500px" /></p>\r\n\r\n<p>Социальная сеть&nbsp;Facebook&nbsp;собирается запустить&nbsp;собственную платежную систему. В настоящий момент компания договаривается с регуляторами в Ирландии о получении одобрения на сервис, который позволил бы пользователям хранить свои сбережения на аккаунтах в социальных сетях.</p>\r\n', '<p><img alt="" src="http://hi-news.ru/wp-content/uploads/2014/04/Facebook-Like-650x365.jpg" style="height:337px; width:600px" /></p>\r\n\r\n<p>Социальная сеть&nbsp;Facebook&nbsp;собирается запустить&nbsp;собственную платежную систему. В настоящий момент компания договаривается с регуляторами в Ирландии о получении одобрения на сервис, который позволил бы пользователям хранить свои сбережения на аккаунтах в социальных сетях, а также использовать их для интернет-платежей, в том числе через смартфоны. Об этом сообщила газета Financial Times, которая узнала о ближайших планах Facebook из своих источников. Люди, знакомые с ситуацией, информировали, что до введения в оборот электронных денег Facebook, которые могут распространиться по всей Европе, остались считанные недели.</p>\r\n\r\n<p>Война за доминирование на рынке электронных платежей обещает быть долгой и жесткой. Несколько известных компаний, в том числе Google, PayPal и операторы мобильной связи, пытаются занять доминирующее положение на этом рынке. По мнению аналитиков, Facebook сосредоточит основное усилие на мобильных платежах. Решающую роль здесь могут сыграть развивающиеся рынки, которые давно нуждаются в подобных решениях. Именно на них и будет сделан акцент. Однако неясно, сможет ли платежная система Facebook привлечь достаточное количество пользователей.</p>\r\n\r\n<p>Исследование показывает, что всего 1 процент респондентов доверяют свои сбережения социальным сетям по типу Facebook. Это резко контрастирует с уровнем доверия к банкам (43 процента), эмитентам кредитных карт (13 процентов), а также операторам сотовой связи в контексте развивающихся рынков (11 процентов в Китае), &mdash; сообщил изданию CNET аналитик британской исследовательской фирмы Ovum Эден Цоллер.</p>\r\n\r\n<p>Также непонятно, сможет ли Facebook перенести успех социальной сети в совершенно другую сферу. Аналитик указывает на провалы компании с виртуальной валютой Facebook Credits и Facebook Gifts &mdash; два простых примера неудавшейся попытки социальной сети взять на себя роль электронной платежной системы.</p>\r\n\r\n<p>Тем не менее, это не останавливает Facebook, которая жаждет как можно скорее монетизировать свою огромную базу пользователей. В компании в свою очередь отказались давать какие-либо комментарии относительно запуска фирменной платежной системы.</p>\r\n\r\n<p>Похоже, в мире начался бум на собственные платежные системы. Свое слово по этому поводу недавно&nbsp;сказала Россия.</p>\r\n', 1397598180),
(18, 'Устройство OrCam облегчит жизнь слепым людям', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="http://hi-news.ru/wp-content/uploads/2014/04/VISION-superJumbo.jpg" style="height:339px; width:500px" /></p>\r\n\r\n<p>Новое устройство от израильского стартапа OrCam призвано повысить возможности людей с&nbsp;ограниченным зрением. Устройство выглядит как обычная камера, которая крепится на дужку очков.</p>\r\n', '<p>&nbsp; &nbsp;<img alt="" src="http://hi-news.ru/wp-content/uploads/2014/04/VISION-superJumbo.jpg" style="height:407px; width:600px" /></p>\r\n\r\n<p>Новое устройство от израильского стартапа OrCam призвано повысить возможности людей с&nbsp;ограниченным зрением. Устройство выглядит как обычная камера, которая крепится на дужку очков. При этом она непрерывно анализирует пространство и может озвучивать увиденное перед собой.<br />\r\n<br />\r\nВ камеру встроен микрокомпьютер, который анализирует изображение с камеры, а затем трансформирует полученные данные в звуковое сообщение. Кроме того, устройство непрерывно распознает лица и окружающую обстановку.</p>\r\n\r\n<p><img alt="" src="http://hi-news.ru/wp-content/uploads/2014/04/Orcam-device-Liat5.jpg" style="height:425px; width:600px" /></p>\r\n\r\n<p>Для управления OrCam пользователю просто необходимо указать на предмет, который необходимо опознать. С помощью устройства пользователь с плохим&nbsp;зрением&nbsp;может &laquo;читать&raquo; вывески, книги и газеты, определять продукты в супермаркете. На данный момент система может распознавать только печатный английский текст, однако в будущем планируется добавить большее количество языков, а также научить OrCam распознавать рукописный текст.</p>\r\n\r\n<p>Также стоит заметить, что устройство не требует подключения к сети, делая пользователя полностью независимым от наличия связи.</p>\r\n\r\n<p>Купить устройство OrCam можно за 2500 долларов.</p>\r\n', 1397598480),
(19, 'Apple, Amazon и Google — компании с лучшей репутацией', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="http://hi-news.ru/wp-content/uploads/2014/02/apple-sign-487-650x401.jpg" style="height:308px; width:500px" /></p>\r\n\r\n<p>Деловой журнал Fortune опубликовал ежегодный рейтинговый список американских компаний с наилучшей репутацией. Рейтинг снова возглавили технологические гиганты, один из которых в прошлом году был назван&nbsp;самым дорогим брендом&nbsp;в мире.</p>\r\n', '<p><img alt="" src="http://hi-news.ru/wp-content/uploads/2014/02/apple-sign-487-650x401.jpg" style="height:370px; width:600px" /></p>\r\n\r\n<p>Деловой журнал Fortune опубликовал ежегодный рейтинговый список американских компаний с наилучшей репутацией. Рейтинг снова возглавили технологические гиганты, один из которых в прошлом году был назван&nbsp;самым дорогим брендом&nbsp;в мире.</p>\r\n\r\n<p>В результате исследования Fortune, проводимого с помощью опроса представителей бизнеса, был составлен список Fortune America&rsquo;s Most Admired Companies. Американских предпринимателей больше всего восхитила деятельность Apple, Amazon и Google. Эти компании заняли первые три места в рейтинге. Такие компании, как Samsung, Microsoft и Facebook получили 21, 24 и 38 места, соответственно.</p>\r\n\r\n<p>Пребывание Apple на вершине рейтинга в качестве лидера не удивляет. Первое место в списке компания занимает вот уже семь лет подряд. Единственной трещиной в броне Apple в Fortune назвали определенную нервозность инвесторов в ожидании выхода &laquo;следующих больших продуктов&raquo;. Журнал считает ее необоснованной, учитывая доходы Apple, которые за прошлый год составили 171 миллиард долларов.</p>\r\n\r\n<p>Что касается Amazon, то, по словам Fortune, она использует клиент-ориентированную стратегию и не показывает никаких признаков ослабления. К тому же крупнейший ритейлер мира начал открывать для себя новые направления.</p>\r\n\r\n<p>Тройку лидеров замыкает Google. Fortune пишет, что эта компания продолжает искать способы сделать жизнь людей более комфортной через умопомрачительные идеи. В качестве примера журнал приводит такие проекты, как&nbsp;Google Glass&nbsp;и самоуправляемые автомобили.</p>\r\n\r\n<p>Ранее Fortune назвал&nbsp;Google лучшим работодателем.</p>\r\n', 1397598720),
(20, 'Google порадовала разработчиков умных часов', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="http://hi-news.ru/wp-content/uploads/2014/03/Google-Now-650x365.png" style="height:281px; width:500px" /></p>\r\n\r\n<p>Компания Google планирует в ближайшие недели выпустить пакет программ, который позволит мобильным разработчикам создавать Android-приложения для носимой электроники, в том числе умных часов.</p>\r\n', '<p><img alt="" src="http://hi-news.ru/wp-content/uploads/2014/03/Google-Now-650x365.png" style="height:337px; width:600px" /></p>\r\n\r\n<p>Компания Google планирует в ближайшие недели выпустить пакет программ, который позволит мобильным разработчикам создавать Android-приложения для носимой электроники, в том числе умных часов. Об этом в ходе конференции SXSW в Остине заявил вице-президент Google Сундар Пичаи, ответственный за такие направления, как Android, Apps и Chrome.</p>\r\n\r\n<p>Через две недели мы выпустим первый SDK для Android, который изложит наше видение этого рынка разработчикам, &mdash; сказал Сундар Пичаи.</p>\r\n\r\n<p>Сравнивая эволюцию носимых устройств с революцией на рынке смартфонов, вице-президент Google отметил, что его компания намерена вывести Android за пределы рынка смартфонов и планшетных компьютеров. И надо признать, Google активно работает в этом направлении. Например, недавно с ее помощью был создан Открытый автомобильный альянс, целью которого является полная интеграция мобильной операционной системыAndroid в автомобили.</p>\r\n\r\n<p>Ожидается, что Google объявит о планах относительно смартвотч-ориентированной операционной системы во второй половине этого месяца. Об этом изданию CNET сообщили хорошо информированные источники еще в феврале. Тогда же было заявлено, что производством брендовых умных часов, которые дебютируют на конференции&nbsp;Google I/O&nbsp;в июне, займется южнокорейский производитель электроники LG.</p>\r\n\r\n<p>По предварительным данным, операционная система для умных часов будет базироваться на системе голосового поиска Google Now, которая также задействована в очках дополненной реальности Google Glass. На сегодняшний день объемы продаж смартвотч незначительны, но уже к 2018 году этот рынок будет оцениваться в 19 миллиардов долларов. Такой прогноз сделала исследовательская фирма Juniper Research.</p>\r\n\r\n<p>Традиционно мелкие компании перенимают идеи более крупных. Так, перспективный проект Google по созданию модульного смартфона вдохновил сторонних разработчиков на выпуск&nbsp;модульных умных часов.</p>\r\n', 1397598900),
(21, 'Первые скриншоты iOS 8 на экране iPhone 6', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="http://s.appleinsider.ru/2014/04/ios8.jpg" style="height:285px; width:500px" /></p>\r\n\r\n<p>Разумеется, вряд ли китайскую соцсеть Weibo можно считать надежным источником информации, но не рассказать об этом вам мы не можем. Еще на прошлой неделе в этой сети появился скриншот, который предположительно принадлежит новой операционной системе iOS 8</p>\r\n', '<p><img alt="" src="http://s.appleinsider.ru/2014/04/ios8.jpg" style="height:342px; width:600px" /></p>\r\n\r\n<p>Разумеется, вряд ли китайскую соцсеть Weibo можно считать надежным источником информации, но не рассказать об этом вам мы не можем. Еще на прошлой неделе в этой сети появился скриншот, который предположительно принадлежит новой операционной системе iOS 8, запущенной на еще неанонсированном смартфоне iPhone 6. Тогда мы проигнорировали эту новость, однако сегодня появился еще один скриншот, который распространил другой пользователь. И нет сомнений, что эти две картинки имеют много общего.<br />\r\n<br />\r\nНа первом скриншоте, распространенном еще на прошлой неделе, мы видим главный экран iOS, который отличается от того, с чем мы имеем дело сейчас. Во-первых, там появились иконки приложений Healthbook, CarPlay и&nbsp;iTunes Radio, а во-вторых, изменилось соотношение сторон дисплея и увеличилось число иконок на экране. Если сегодня на экране iPhone 5/5s/5c можно разместить 24 значка (4 столбца и 6 рядов), то на новом скриншоте их уже 35 (5 столбцов и 7 рядов). Кроме того, исходное изображение имеет разрешение 1600 на 966 пикселей, которое соответствует соотношению сторон 16:10. Напомним, что в нынешних моделях iPhone используется соотношение 16:9.</p>\r\n\r\n<p><img alt="" src="http://s.appleinsider.ru/2014/04/ios811.jpg" style="height:954px; width:576px" /></p>\r\n\r\n<p>Второй скриншот появился сегодня, и на нем изображен браузер Safari. Перед созданием скриншота пользователь нажал кнопку &laquo;Поделиться&raquo;, и мы видим, что на экране умещается гораздо больше иконок для шаринга, чем в iPhone 5/5s/5c на базе iOS 7. Кроме того, в панели появились новые иконки &mdash; &laquo;Предпросмотр&raquo;, &laquo;Редактировать в TextEdit&raquo; и &laquo;Советы&raquo;. Ранее в сети уже появлялись предположительные скриншоты, указывавшие на возможность появления в iOS приложения TextEdit, однако тогда мало кто поверил в то, что текстовый редактор из Mac может пригодиться пользователям мобильных гаджетов Apple.</p>\r\n\r\n<p><img alt="" src="http://s.appleinsider.ru/2014/04/iOS821.jpg" style="height:911px; width:550px" /></p>\r\n', 1397599139),
(22, 'Google может стать первой компанией, принявшей «Tри закона робототехники»', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="http://hi-news.ru/wp-content/uploads/2014/01/av-109352.jpg" style="height:375px; width:500px" /></p>\r\n\r\n<p>Слухи об этическом совете,&nbsp;сопровождавшие&nbsp;последнее приобретение Google &mdash; компании&nbsp;DeepMind&nbsp;Technologies, &mdash; могут намекать на создание единых законов робототехники в будущем.</p>\r\n', '<p><img alt="" src="http://hi-news.ru/wp-content/uploads/2014/01/av-109352.jpg" style="height:450px; width:600px" /></p>\r\n\r\n<p>Слухи об этическом совете,&nbsp;сопровождавшие&nbsp;последнее приобретение Google &mdash; компании&nbsp;DeepMind&nbsp;Technologies, &mdash; могут намекать на создание единых законов робототехники в будущем.</p>\r\n\r\n<p>Научная фантастика в позитивном смысле завалена идеями об искусственном интеллекте. От первых шепотков о механическом сознании в исполнении Самуэля Батлера в 1906 году до современных, полностью сформированных цифровых людей как Cortana во франшизе Halo, все говорит о том, что в один прекрасный день машины смогут мыслить и действовать самостоятельно.</p>\r\n\r\n<p>Google&nbsp;предпринял&nbsp;невероятные фантастические шаги за последние несколько месяцев, активно поощрив воображение любителей фантастики, поскольку приобрел быстро развивающиеся компании по созданию двуногих роботов. Все в сборе &mdash;&nbsp;роботы и искусственный интеллект: такой может стать картина уже через десяток лет, а то и раньше. Тем не менее все мы выросли с мыслью о том, что как роботов, так и искусственный интеллект нужно контролировать, а то будет полный терминатор.</p>\r\n\r\n<p>Искусственный интеллект, в общем смысле, уже является существенной частью деятельности Google и сервисов компании. Google Now, поисковые технологии, сети доставки работают на очень и очень продвинутых алгоритмах. Для своего будущего компания купила DeepMind Technologies, технологии которой думают как люди, играющие в видеоигры.</p>\r\n\r\n<p>Непонятно, как эта технология будет использоваться в Google, но все услышали, что вместе с покупкой будет сформирован и совет по этике, который поможет разработать правила для применения искусственного интеллекта.</p>\r\n\r\n<p>Google обладает рядом вещей, которым совет по этике просто необходим. Будучи подрядчиком DARPA, создателем самодвижущихся автомобилей и объединяющей десятки самых ярких умов в роботехнике компанией, в Google есть больше чем несколько приложений, которые потребуют более грамотного населения. Кроме того, крайне важно, чтобы внутри самой Google был совет по этике, собранный из сотрудников, которым можно доверять и которые знакомы с внутренней работой компании. Скажем, лишним не будет.</p>\r\n\r\n<p>Следующие несколько шагов для Google будут невероятно важными, поскольку прямо сейчас компания находится на передней грани этих технологий. Правила, касающиеся использования искусственного интеллекта не только помогут отточить специфику Google, но также дадут корпорации больше влияния на мировое сообщество таких же разработчиков. Стандарт может стать единым для организаций, которые решат двигаться в том же направлении. Такой ход ставит Google в уникальное положение силы и авторитета в сфере искусственного интеллекта, и может сделать компанию ответственной за принятие первых трех законов робототехники.</p>\r\n\r\n<p>Здравствуй, Айзек Азимов:</p>\r\n\r\n<p>1) Робот не может причинить вред человеку или своим бездействием допустить, чтобы человеку был причинён вред.<br />\r\n2 )Робот должен повиноваться всем приказам, которые даёт человек, кроме тех случаев, когда эти приказы противоречат Первому Закону.<br />\r\n3) Робот должен заботиться о своей безопасности в той мере, в которой это не противоречит Первому и Второму Законам.</p>\r\n', 1397599260),
(23, 'Google раскрыла новые подробности о модульном смартфоне Project Ara', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="http://hi-news.ru/wp-content/uploads/2014/04/Project_Ara_scattered_parts-650x433.png" style="height:333px; width:500px" /></p>\r\n\r\n<p>Компания Google официально выпустила первый комплект разработчика модулей&nbsp;Project Ara. Набор Project Ara Module Developers Kit (MDK) дает лучшее понимание платформы и предоставляет производителям руководство по созданию компонентов для модульных смартфонов Ara.</p>\r\n', '<p><img alt="" src="http://hi-news.ru/wp-content/uploads/2014/04/Project_Ara_scattered_parts-650x433.png" style="height:400px; width:600px" /></p>\r\n\r\n<p>Компания Google официально выпустила первый комплект разработчика модулей&nbsp;Project Ara. Набор Project Ara Module Developers Kit (MDK) дает лучшее понимание платформы и предоставляет производителям руководство по созданию компонентов для модульныхсмартфонов Ara.</p>\r\n\r\n<p>Документация MDK v0.10 демонстрирует нам три разных размера модульного смартфона Project Ara &ndash; миниатюрный, средний, большой. Очевидно, что более крупные варианты смогут вместить в себя большее количество модулей. Каркас, на котором будут держаться все модули, Google будет выпускать сама.</p>\r\n\r\n<p>Мобильные устройства Project Ara будут предложены в различных вариациях. Пользователям будут доступны как сенсорные аппараты, так и устройства с физической QWERTY-клавиатурой или даже клавишной панелью, пишет ресурс GSMArena.</p>\r\n\r\n<p><img alt="" src="http://hi-news.ru/wp-content/uploads/2014/04/gsmarena_002.jpg" style="height:352px; width:600px" /></p>\r\n\r\n<p>С целью обеспечения единообразия функциональных элементов Project Ara комплект MDK предлагает руководящие принципы для наиболее часто используемых модулей, таких как дисплеи, процессоры, чипы Wi-Fi, аккумуляторные батареи и прочее. Дополнительные элементы от сторонних компаний, используемые для расширения существующих возможностей аппарата, не подпадают под действие этих принципов.</p>\r\n\r\n<p><img alt="" src="http://hi-news.ru/wp-content/uploads/2014/04/gsmarena_003.jpg" style="height:460px; width:600px" /></p>\r\n\r\n<p>Google планирует сделать несколько релизов Ara MDK в этом году и провести ряд конференций для разработчиков. Первая такая конференция пройдет на следующей неделе в Калифорнии (15-16 апреля). Дебютные устройства Ara поступят в продажу в первом квартале следующего года. Google планирует продавать свои модульные смартфоны по низким ценам.</p>\r\n', 1397599500),
(24, '3 из 10 компьютеров в мире по-прежнему работают на базе Windows XP', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="http://hi-news.ru/wp-content/uploads/2014/04/Windows-XP.jpg" style="height:275px; width:500px" /></p>\r\n\r\n<p>Для тех, кто еще не знает, компания Microsoft вчера официально прекратила поддержку Windows XP, однако операционная система, запущенная в 2001 году, до сих пор используется примерно на 28 процентах компьютеров по всему миру.</p>\r\n', '<p><img alt="" src="http://hi-news.ru/wp-content/uploads/2014/04/Windows-XP.jpg" style="height:330px; width:600px" /></p>\r\n\r\n<p>Для тех, кто еще не знает, компания Microsoft вчера официально прекратила поддержку Windows XP, однако операционная система, запущенная в 2001 году, до сих пор используется примерно на 28 процентах компьютеров по всему миру.</p>\r\n\r\n<p>Согласно последним статистическим данным аналитического агентства Statista, примерно 300 миллионов компьютеров по всему миру до сих пор используют Windows XP. Агентство отмечает, что примерно 3 из 10 компьютеров в мире по-прежнему работают на базе устаревшей операционной системы, поддержку которой Microsoft официально прекратила.</p>\r\n\r\n<p>Даже несмотря на то, что для Windows XP больше не будут выпускаться обновления и патчи, повышающие ее безопасность, большинство ее пользователей не хотят обновляться на более современные операционные системы. И основной причиной этого отказа называется высокая стоимость этого обновления.</p>\r\n\r\n<p>Переход на ту же новенькую&nbsp;Windows 8.1&nbsp;потребует от человека не только потратиться на саму операционную систему, но и заставит его обновить железо, так как старые компьютеры, на которых без проблем работает Windows XP, в большинстве своем не смогут справиться с новой операционной системой и не подходят под минимальные требования к железу, установленные Windows 8.1. Тем не менее, многие подумывают о переходе на Windows 7, которая, как показывает практика, намного дружелюбнее как к старому железу, так и конечному пользователю &mdash; здесь есть кнопка &laquo;Пуск&raquo; (в обновлении Windows 8.1 ее тоже вернули, хотя и в видоизмененном состоянии), а также приятные глазу эффекты рабочего стола Aero.</p>\r\n\r\n<p>Сама Microsoft отмечает, что проделала большую работу в обновлении Windows 8.1 по оптимизации работы этой ОС и смогла снизить минимальный порог требований для аппаратного обеспечения на ее базе. Теперь данной операционной системе хватает 1 ГБ оперативной и 16 ГБ постоянной памяти. Помимо этого, компания всячески старается снизить конечную стоимость продуктов на базе Windows 8.1, включая стоимость на планшеты, которые, по оптимистичным планам редмондского гиганта, должны будут стоить ниже 250 долларов.</p>\r\n', 1397599848);
INSERT INTO `news` (`id`, `name`, `preview_content`, `full_content`, `date`) VALUES
(25, 'Touch ID: Когда содержание не успевает за формой', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="http://s.appleinsider.ru/2014/01/TiD_3.jpeg" style="height:300px; width:500px" /></p>\r\n\r\n<p>В конце декабря прошлого года журналисты определили для себя любимое слово американского бизнеса &mdash; &laquo;инновация&raquo;. По данным Wall Street Journal, в этом году 197 из 500 крупнейших компаний мира использовали это слово в своих квартальных отчетах перед акционерами.</p>\r\n', '<p><img alt="" src="http://s.appleinsider.ru/2014/01/TiD_3.jpeg" style="height:360px; width:600px" /></p>\r\n\r\n<p>В конце декабря прошлого года журналисты определили для себя любимое слово американского бизнеса &mdash; &laquo;инновация&raquo;. По данным Wall Street Journal, в этом году 197 из 500 крупнейших компаний мира использовали это слово в своих квартальных отчетах перед акционерами. Например, во время интервью с руководством компании HP (Hewlett-Packard) в октябре 2013 года слово &laquo;инновация&raquo; было упомянуто 70 (обратите внимание на эту цифру) раз. Не думаю, что кто-нибудь рискнет подсчитать, сколько раз российский премьер употребил сей заезженный штамп, но все мы знаем, что это любимое слово для человека, стоящего столь высоко в иерархии нашей страны. Поэтому каждый раз, когда я слышу нечто подобное на презентациях технологических компаний, меня едва ощутимо бросает в дрожь.</p>\r\n\r\n<p>Так отчего же все IT-блоги мира называют технологию сенсорного сканера отпечатка пальцев Touch ID инновационной? Да-да, мы помним про сапфировое стекло, про сенсор с повышенной чувствительностью, про металлическое кольцо всевластья, служащее индикатором прикосновения, и уверен, что есть ещё множество наисложнейших штук, которые команда Apple всунула под капот кнопки Home в новом&nbsp;iPhone 5s. Однако у меня, по прошествии почти трёх месяцев пользования новеньким айфоном, возникает простой вопрос: &laquo;Зачем мне все это, если оно никогда в нужный момент не работает, черт бы его побрал?&raquo;. Я использую свой телефон каждый день как основной рабочий инструмент, при том, что мой образ жизни весьма далёк от бессмысленного лежания на диване, и мне может понадобиться оказаться в самых неожиданных местах в дождь, грязь или жару. Прибавьте к этому одержимость системами безопасности и у вас сложится образ человека, которому функция Touch ID необходима, как воздух. Человека, который отключил ее вчера вообще, потому что она не работает.</p>\r\n\r\n<p><img alt="" src="http://s.appleinsider.ru/2014/01/TiD_2.jpeg" style="height:365px; width:600px" /></p>\r\n\r\n<p>Когда Джони Айв в традиционном ролике Apple на презентации рассказывал про &laquo;инновационный&raquo; сенсор, призванный защитить ваши данные от окружающих, он явно забыл упомянуть несколько вещей. Пожалуй, в оригинальной версии это звучало примерно так: &laquo;Выдающиеся инновации в iPhone 5s устанавливают новый уровень. Это не просто набор технологий &mdash; абсолютно каждый компонент, каждый процесс был тщательно обдуман при создании Touch ID. Но вполне возможно, что наш сенсор отпечатка пальцев не сработает, если будет немного испачкан&hellip; Или вы только что помыли руки&hellip; Или, наоборот, не мыли их слишком долго&hellip; Возможно, ваши пальцы вспотеют в теплое время года, как у любого нормального человека, и тогда Touch ID также перестанет работать. Не переживайте, что забудете пароль от Apple аккаунта при покупках в нашем онлайн-магазине. Потому что, несмотря на возможность проводить идентификацию с помощью отпечатка, мы все равно будем заставлять вас вводить пароль вручную в двух случаях из трех&raquo;. Безусловно, это всё носит скорее ироничный характер, и Айв, конечно же, так не говорил, но закончить можно фразой, которая взята из настоящей презентации и в вольном переводе звучит так: &laquo;Мы убеждены, что технология находится в лучшем виде, с максимально расширенными способностями, когда она просто исчезает&raquo;. Вице-президент Apple не врет &mdash; так и происходит в реальной жизни! Эта технология действительно имеет неприятную привычку испаряться в самый неожиданный и неподходящий для этого момент.</p>\r\n\r\n<p><img alt="" src="http://s.appleinsider.ru/2014/01/TiD_1.jpeg" style="height:450px; width:600px" /></p>\r\n\r\n<p>Автором были опробованы самые разнообразные методы заставить работать сенсор лучше:</p>\r\n\r\n<p>1) Добавить несколько отпечатков одного пальца в разные слоты.<br />\r\n2) Сканировать при настройке палец мокрым или немного жирным.<br />\r\n3) Сканировать один и тот же палец под разными углами.<br />\r\n4) Обновлять отпечатки раз в несколько дней.<br />\r\n5) И, конечно, устанавливать свежую прошивку сразу, как только она появляется.</p>\r\n\r\n<p>Может быть, у читателей все совсем не так? Поделитесь в комментариях своим опытом от использования Touch ID!</p>\r\n', 1397600075);


CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;


CREATE TABLE IF NOT EXISTS `teachers` (
  id int unsigned NOT NULL AUTO_INCREMENT,
  firstname varchar(50) NOT NULL DEFAULT '',
  middlename varchar(50) NOT NULL DEFAULT '',
  lastname varchar(50) NOT NULL DEFAULT '',
  info text NOT NULL,
  CONSTRAINT pkId PRIMARY KEY (id)
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE IF NOT EXISTS `lessons` (
  id int unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL DEFAULT '',
  info text NOT NULL,
  CONSTRAINT pkId PRIMARY KEY (id)
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE IF NOT EXISTS `groups` (
  id int unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL DEFAULT '',
  curator int unsigned NOT NULL DEFAULT 0,
  info text NOT NULL,
  CONSTRAINT pkId PRIMARY KEY (id),
  INDEX ixCurator (curator),
  CONSTRAINT fkGroupsCuratorId FOREIGN KEY (curator)
    REFERENCES teachers (id)
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE IF NOT EXISTS `classrooms` (
  id int unsigned NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL DEFAULT '',
  CONSTRAINT pkId PRIMARY KEY (id)
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE IF NOT EXISTS `week_types` (
  id int unsigned NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL DEFAULT '',
  CONSTRAINT pkId PRIMARY KEY (id)
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE IF NOT EXISTS `days` (
  id int unsigned NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL DEFAULT '',
  CONSTRAINT pkId PRIMARY KEY (id)
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE IF NOT EXISTS `lesson_numbers` (
  id int unsigned NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL DEFAULT '',
  start_time time NOT NULL,
  end_time time NOT NULL,
  CONSTRAINT pkId PRIMARY KEY (id)
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `timetables` (
  id int unsigned NOT NULL AUTO_INCREMENT,
  group_id int unsigned NOT NULL DEFAULT 0,
  day_id int unsigned NOT NULL DEFAULT 0,
  lesson_number_id int unsigned NOT NULL DEFAULT 0,
  lesson_id int unsigned NOT NULL DEFAULT 0,
  week_type_id int unsigned NOT NULL DEFAULT 0,
  classroom_id int unsigned NOT NULL DEFAULT 0,
  CONSTRAINT pkId PRIMARY KEY (id),
  INDEX ixGroupId (group_id),
  INDEX ixDayId (day_id),
  INDEX ixLessonNumberId (lesson_number_id),
  INDEX ixLessonId (lesson_id),
  INDEX ixWeekTypeId (week_type_id),
  INDEX ixClassroomId (classroom_id),
  CONSTRAINT fkGroupsGrouId FOREIGN KEY (group_id)
    REFERENCES groups (id)
      ON DELETE CASCADE,
  CONSTRAINT fkGroupsDayId FOREIGN KEY (day_id)
    REFERENCES days (id)
      ON DELETE CASCADE,
  CONSTRAINT fkGroupsLessonNumberId FOREIGN KEY (lesson_number_id)
    REFERENCES lesson_numbers (id)
      ON DELETE CASCADE,
  CONSTRAINT fkGroupsLessonId FOREIGN KEY (lesson_id)
    REFERENCES lessons (id)
      ON DELETE CASCADE,
  CONSTRAINT fkGroupsWeekTypeId FOREIGN KEY (week_type_id)
    REFERENCES week_types (id)
      ON DELETE CASCADE,
  CONSTRAINT fkGroupsClassroomId FOREIGN KEY (classroom_id)
    REFERENCES classrooms (id)
      ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `timetable_teachers` (
  id int unsigned NOT NULL AUTO_INCREMENT,
  timetable_id int unsigned NOT NULL DEFAULT 0,
  teacher_id int unsigned NOT NULL DEFAULT 0,
  CONSTRAINT pkId PRIMARY KEY (id),
  INDEX ixTimetableId (timetable_id),
  INDEX ixTeacherId (teacher_id),
  CONSTRAINT fkGroupsTimetableId FOREIGN KEY (timetable_id)
    REFERENCES timetables (id)
      ON DELETE CASCADE,
  CONSTRAINT fkGroupsTeacherId FOREIGN KEY (teacher_id)
    REFERENCES teachers (id)
      ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
