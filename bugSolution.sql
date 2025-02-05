To fix this, either use a `LIMIT` clause to restrict the subquery to a single row or use a different approach entirely, such as a `JOIN`. Here are two solutions:

**Solution 1: Using `LIMIT` (if appropriate)**

```sql
SELECT * FROM employees WHERE department_id = (SELECT id FROM departments WHERE name = 'Sales' LIMIT 1);
```

This solution is only appropriate if you can safely assume that there will always be at least one 'Sales' department and you are okay with picking just one arbitrarily if there are multiple. 

**Solution 2: Using `JOIN` (preferred)**

```sql
SELECT employees.* FROM employees JOIN departments ON employees.department_id = departments.id WHERE departments.name = 'Sales';
```

This solution uses an `INNER JOIN` to efficiently retrieve the desired data. It will only return employees from departments named 'Sales'.  If you need to handle the case where no departments are named 'Sales', consider using a `LEFT JOIN`. This is generally the preferred and most robust solution.