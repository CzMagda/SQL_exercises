
-- 1.	Wypisz nazwiska pierwszych 2 użytkowników którzy są najmłodsi:
SELECT TOP 2 LastName FROM Users
WHERE Age IS NOT NULL
ORDER BY Age;

-- 2.	Wypisz wszystkie dane użytkowników, którzy są poniżej 18 roku życia lub powyżej 30 i mieszkają w Polsce:
SELECT * FROM Users
WHERE Age > 18 AND Country = 'Poland' OR Age < 30 AND Country = 'Poland';

-- 3.	Wypisz imiona użytkowników w kolejności alfabetycznej:
SELECT FirstName FROM Users
ORDER BY FirstName;

-- 4.	Znajdz użytkownikow, których wiek jest liczbą parzystą:
SELECT * FROM Users
WHERE AGE % 2 = 0;


-- 5.	Wypisz połączone imię i nazwisko wszystkich użytkowników w formie jednej kolumny o nazwie 'UserName'.
SELECT FirstName + ' ' + LastName AS UserName
FROM Users;



