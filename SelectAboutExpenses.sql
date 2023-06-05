-- 1.	Wypisz wszystkie wydatki z tabeli Expenses, które powiązane są z użytkownikiem ‘Filip’, w kolejności od najnowszych do najstarszych:
SELECT price FROM Expenses
WHERE FirstName = 'Filip'
ORDER BY date;


-- 2.	Wypisz wszystkie wydatki użytkownika 'Filip' i 'Damian' które zostały wykonane w sklepie 'Lidl':
SELECT price FROM expenses
LEFT JOIN users ON expenses.userId = users.id
WHERE users.id IN (1,2) AND StoreName = 'Lidl'


-- 3.	Wypisz jaka jest cena najdroższego wydatku dla użytkownika 'Filip':
SELECT MAX (price)
FROM Expenses
WHERE FirstName = 'Filip';


-- 4. Podlicz i wypisz ile sumarycznie wydał użytkownik 'Damian' na mięso w miesiącu 'Marzec':
SELECT SUM (Price)
FROM Expenses
WHERE userid = 2 AND title = 'Mięso' AND date LIKE '2022-03%';


-- 5.  Wypisz wszystkie wydatki wszystkich użytkowników które mają dodany opis:
SELECT price FROM Expenses
WHERE description IS NOT NULL; 


-- 6. Podlicz i wypisz ile średnio wydawał użytkownik 'Damian' na mięso:
SELECT AVG (Price)
FROM Expenses
WHERE userid = 2 AND title = 'Mięso'

-- 7. Podlicz i wypisz za pomocą jednego zapytania ile wydał łącznie Filip oraz Damian dnia 07.03.2022. 
-- Wypisz wynik w postaci dwóch kolumn: Użytkownik, Kwota.
SELECT UserId AS 'Użytkownik', SUM(price) AS 'Kwota' FROM Expenses
WHERE  date = '2022-03-07'
GROUP BY UserId;


