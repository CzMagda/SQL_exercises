-- Examples:
INSERT INTO us_states (state_id, state_name, state_region, state_abbr)
VALUES (58,'podlaskie', 'wschód', 'PD');

UPDATE us_states SET state_name = 'Alibaba'
WHERE state_name = 'Alabama';

DELETE FROM us_states
WHERE state_id > 100;

-- Exercises:
-- 1. Wstaw do tabeli "us_states" stan "mazowieckie":
INSERT INTO us_states (state_id, state_name)
VALUES (59, 'mazowieckie');

-- 2. Popraw w tabeli "us_states" wszystkie wartości pola "state_abbr" na duże litery:
UPDATE us_states SET state_abbr = UPPER(state_abbr);

-- 3. Usuń z tabeli "us_states" wszystkie stany zaczynające się na literę "W":
DELETE FROM us_states
WHERE state_name LIKE 'W%';

-- lub

DELETE FROM us_states
WHERE LEFT(state_name, 1) = 'W';