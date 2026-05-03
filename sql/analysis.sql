     -- top spending costumer
		SELECT `Customer ID`,
		SUM(`Purchase Amount (USD)`) AS total_spent
		FROM customer_details
		GROUP BY `Customer ID`
		ORDER BY total_spent DESC
		LIMIT 10;
        
     -- Category Paling Laku     
        SELECT 
			Category,
		COUNT(*) AS total_sales,
		SUM(`Purchase Amount (USD)`) AS revenue
		FROM customer_details
		GROUP BY Category
		ORDER BY revenue DESC;
        
        
     -- Avg Pengaruh Discount
			SELECT 
			`Discount Applied`,
			AVG(`Purchase Amount (USD)`) AS avg_spending
			FROM customer_details
			GROUP BY `Discount Applied`;
            
            
	 -- Subscription vs Non-subscription
		SELECT 
		`Subscription Status`,
		AVG(`Purchase Amount (USD)`) AS avg_spending,
		COUNT(*) AS total_transaction
		FROM customer_details
		GROUP BY `Subscription Status`;

	 -- Customer Segmentation
	 	-- Most spending By Age(Avg)
				SELECT 
					CASE 
        		WHEN Age < 25 THEN 'Young(under 25)'
       			 WHEN Age BETWEEN 25 AND 40 THEN 'Adult(26-40)'
       			 ELSE 'Older(above 41)'
				END AS age_group,
				AVG(`Purchase Amount (USD)`) AS avg_spending
				FROM customer_details
				GROUP BY age_group
				ORDER BY avg_spending DESC;

		-- Revenue By Age Group	
				SELECT 
					CASE 
        		WHEN Age < 25 THEN 'Young(under 25)'
       			 WHEN Age BETWEEN 25 AND 40 THEN 'Adult(26-40)'
       			 ELSE 'Older(above 41)'
				END AS age_group,
				SUM(`Purchase Amount (USD)`) AS revenue
				FROM customer_details
				GROUP BY age_group
				ORDER BY revenue DESC;	
    
     -- Loyal Customer Analysis
		SELECT 
			`Customer ID`,
			`Previous Purchases` AS total_previous,
			`Purchase Amount (USD)` AS total_spent
		FROM customer_details
		ORDER BY total_previous DESC, total_spent desc
        limit 10;