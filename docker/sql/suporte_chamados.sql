SELECT
  user_id,
  COUNT(*) AS total_chamados
FROM tickets
WHERE status = 'aberto'
GROUP BY user_id
ORDER BY total_chamados DESC;
