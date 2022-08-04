
-- 1. Основы реляционной модели и SQL
-- 1.1 Отношение (таблица) 

-- Создание таблицы 

-- ЗАДАНИЕ. Сформулируйте SQL запрос для создания таблицы book, занесите его в окно кода (расположено ниже) и отправьте на проверку (кнопка Отправить). 
-- Структура таблицы book:
-- Поле	       Тип, описание
-- book_id	   INT PRIMARY KEY AUTO_INCREMENT
-- title	     VARCHAR(50)
-- author	     VARCHAR(30)
-- price	     DECIMAL(8, 2)
-- amount	     INT

Create table book(
    book_id INT primary key auto_increment,
    title VARCHAR(50), 
    author VARCHAR(30),
    price DECIMAL(8, 2), 
    amount INT
    );
    
-- Вставка записи в таблицу

--ЗАДАНИЕ. Занесите новую строку в таблицу book (текстовые значения (тип VARCHAR) заключать либо в двойные, либо в одинарные кавычки):

insert into book (book_id, title, author, price, amount) values ( NULL, 'Мастер и Маргарита','Булгаков М.А.', 670.99, 3  );

-- Результат:
-- Affected rows: 1
-- Query result:
-- +---------+--------------------+---------------+--------+--------+
-- | book_id | title              | author        | price  | amount |
-- +---------+--------------------+---------------+--------+--------+
-- | 1       | Мастер и Маргарита | Булгаков М.А. | 670.99 | 3      |
-- +---------+--------------------+---------------+--------+--------+

-- ЗАДАНИЕ. Занесите три последние записи в таблицу book, первая запись уже добавлена на предыдущем шаге:
-- book_id	                          title	              author	          price	        amount
-- INT PRIMARY KEY AUTO_INCREMENT	    VARCHAR(50)	        VARCHAR(30)	      DECIMAL(8,2)	INT
-- 1	                                Мастер и Маргарита	Булгаков М.А.	    670.99	      3
-- 2	                                Белая гвардия	      Булгаков М.А.	    540.50	      5
-- 3	                                Идиот	              Достоевский Ф.М.	460.00	      10
-- 4	                                Братья Карамазовы	  Достоевский Ф.М.	799.01	      2

insert into book ( book_id, title, author, price, amount) values (NUll,'Белая гвардия', 'Булгаков М.А.', 540.50, 5);
insert into book ( book_id, title, author, price, amount) values (NUll,'Идиот', 'Достоевский Ф.М.', 460.00, 10);
insert into book ( book_id, title, author, price, amount) values (NUll,'Братья Карамазовы', 'Достоевский Ф.М.', 799.01, 2);

-- Результат:
-- Affected rows: 1
-- Affected rows: 1
-- Affected rows: 1
-- Query result:
-- +---------+--------------------+------------------+--------+--------+
-- | book_id | title              | author           | price  | amount |
-- +---------+--------------------+------------------+--------+--------+
-- | 1       | Мастер и Маргарита | Булгаков М.А.    | 670.99 | 3      |
-- | 2       | Белая гвардия      | Булгаков М.А.    | 540.50 | 5      |
-- | 3       | Идиот              | Достоевский Ф.М. | 460.00 | 10     |
-- | 4       | Братья Карамазовы  | Достоевский Ф.М. | 799.01 | 2      |
-- +---------+--------------------+------------------+--------+--------+


-- 1.2. Выборка данных 

-- Выборка всех данных их таблицы

-- ЗАДАНИЕ
-- Вывести информацию о всех книгах, хранящихся на складе
-- Для этого: 
-- Напишите SQL запрос в окне кода; 
-- Отправьте на проверку (кнопка  Отправить); 
-- Если запрос работает неверно, исправьте его и снова отправьте на проверку.
-- Важно! В окне кода можно использовать комментарии для сохранения разных вариантов запросов или пояснений. Комментарии заключаются в /* и */
SELECT * FROM book;

-- Результат:

-- +---------+-----------------------+------------------+--------+--------+
-- | book_id | title                 | author           | price  | amount |
-- +---------+-----------------------+------------------+--------+--------+
-- | 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
-- | 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      |
-- | 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     |
-- | 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 2      |
-- | 5       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
-- +---------+-----------------------+------------------+--------+--------+
-- Affected rows: 5

-- Выборка отдельных столбцов

-- Задание
-- Выбрать авторов, название книг и их цену из таблицы book.
select author, title, price  from book;

-- Результат:

-- +------------------+-----------------------+--------+
-- | author           | title                 | price  |
-- +------------------+-----------------------+--------+
-- | Булгаков М.А.    | Мастер и Маргарита    | 670.99 |
-- | Булгаков М.А.    | Белая гвардия         | 540.50 |
-- | Достоевский Ф.М. | Идиот                 | 460.00 |
-- | Достоевский Ф.М. | Братья Карамазовы     | 799.01 |
-- | Есенин С.А.      | Стихотворения и поэмы | 650.00 |
-- +------------------+-----------------------+--------+
-- Affected rows: 5

-- Выборка новых столбцов и присвоение им новых имен

-- Задание
-- Выбрать названия книг и авторов из таблицы book, для поля title задать имя(псевдоним) Название, для поля author –  Автор. 

select title as Название, author as Автор from book;

-- Результат:

-- +-----------------------+------------------+
-- | Название              | Автор            |
-- +-----------------------+------------------+
-- | Мастер и Маргарита    | Булгаков М.А.    |
-- | Белая гвардия         | Булгаков М.А.    |
-- | Идиот                 | Достоевский Ф.М. |
-- | Братья Карамазовы     | Достоевский Ф.М. |
-- | Стихотворения и поэмы | Есенин С.А.      |
-- +-----------------------+------------------+
-- Affected rows: 5

-- Выборка данных с созданием вычисляемого столбца

-- Задание
-- Для упаковки каждой книги требуется один лист бумаги, цена которого 1 рубль 65 копеек. 
-- Посчитать стоимость упаковки для каждой книги (сколько денег потребуется, чтобы упаковать все экземпляры книги). 
-- В запросе вывести название книги, ее количество и стоимость упаковки, последний столбец назвать pack. 

select title, amount, 
amount * 1.65 as pack
from book;

-- Результат:

-- +-----------------------+--------+-------+
-- | title                 | amount | pack  |
-- +-----------------------+--------+-------+
-- | Мастер и Маргарита    | 3      | 4.95  |
-- | Белая гвардия         | 5      | 8.25  |
-- | Идиот                 | 10     | 16.50 |
-- | Братья Карамазовы     | 2      | 3.30  |
-- | Стихотворения и поэмы | 15     | 24.75 |
-- +-----------------------+--------+-------+
-- Affected rows: 5

-- Выборка данных, вычисляемые столбцы, математические функции

-- Задание
-- В конце года цену всех книг на складе пересчитывают – снижают ее на 30%. 
-- Написать SQL запрос, который из таблицы book выбирает названия, авторов, количества и вычисляет новые цены книг. 
-- Столбец с новой ценой назвать new_price, цену округлить до 2-х знаков после запятой.

select title, author, amount,
round((price-price*0.3), 2) as new_price
from book;

-- Результат:
-- +-----------------------+------------------+--------+-----------+
-- | title                 | author           | amount | new_price |
-- +-----------------------+------------------+--------+-----------+
-- | Мастер и Маргарита    | Булгаков М.А.    | 3      | 469.69    |
-- | Белая гвардия         | Булгаков М.А.    | 5      | 378.35    |
-- | Идиот                 | Достоевский Ф.М. | 10     | 322.00    |
-- | Братья Карамазовы     | Достоевский Ф.М. | 2      | 559.31    |
-- | Стихотворения и поэмы | Есенин С.А.      | 15     | 455.00    |
-- +-----------------------+------------------+--------+-----------+
-- Структура и наполнение таблицы book:
