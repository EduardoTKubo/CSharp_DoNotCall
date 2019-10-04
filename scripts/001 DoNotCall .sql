
	-- srv_db03
	-- 09/09/2019 
	
	use procon

		select count(*) from DoNotCall where Procon = 1   -- 4.592.237

	truncate table atu_procon 

	select count(*) from ATU_PROCON 
	select top 20 * from ATU_PROCON 
	select        * from ATU_PROCON 
	select obs ,count(*) from ATU_PROCON group by obs order by obs 


	select count(*) from DoNotCall where uf = 'AL' and Procon = 1;  --    9357    9568
	select count(*) from DoNotCall where uf = 'CE' and Procon = 1;  --   15327   15892
	select count(*) from DoNotCall where uf = 'ES' and Procon = 1;  --   80813   82144
	select count(*) from DoNotCall where uf = 'GO' and Procon = 1;  --   35461   36902
	select count(*) from DoNotCall where uf = 'MG' and Procon = 1;  --  275429  287216
	select count(*) from DoNotCall where uf = 'MS' and Procon = 1;  --   29410   30404
	select count(*) from DoNotCall where uf = 'PB' and Procon = 1;  --    4976	  5290
	select count(*) from DoNotCall where uf = 'PR' and Procon = 1;  --  387396  399361
	select count(*) from DoNotCall where uf = 'RN' and Procon = 1;  --    1821	  1887
	select count(*) from DoNotCall where uf = 'RS' and Procon = 1;  --  258016  264383
	select count(*) from DoNotCall where uf = 'SC' and Procon = 1;  --  107887  113741
	select count(*) from DoNotCall where uf = 'SP' and Procon = 1;  -- 3231276 3305922

