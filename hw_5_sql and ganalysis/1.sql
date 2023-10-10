USE bank;

-- clients
	-- id_client (primary key) number,
	-- limit_sum number
-- 
-- transactions
	-- id_transaction (primary key) number,
	-- id_client (foreign key) number,
	-- transaction_date number,
	-- transaction_time number,
	-- transaction_sum number
-- 
--     Написать текст SQL-запроса, выводящего количество транзакций, сумму транзакций, среднюю сумму транзакции и дату и время первой транзакции для каждого клиента
--     Найти id пользователей, кот использовали более 70% карточного лимита


SELECT * FROM 
(select id_client, COUNT(transction_sum), SUM(transction_sum), AVG(transction_sum) from transactions t group by id_client c
join 
(select id_client, MIN(transaction_date), MIN(transaction_time) from transactions t2 group by id_client HAVING transaction_date=MIN(transaction_date)) tt 
on c.id_client=tt.id_client) ttt

select id_clients from transactions t 
join clients c on t.id_client=c.id_client
group by id_clients 
HAVING sum(transaction_sum)>=0.7*max(limit_sum)