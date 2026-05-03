      -- cek duplikat
		SELECT `Customer ID`, COUNT(*)
		FROM customer_details
		GROUP BY `Customer ID`
		HAVING COUNT(*) > 1;
	
    -- kategori produk
		SELECT Category, COUNT(*) AS total
		FROM customer_details
		GROUP BY Category
		ORDER BY total DESC;