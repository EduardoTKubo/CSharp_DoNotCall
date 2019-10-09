

 -- ------------------------------------------------------------------------------
-- SRV_db03 -- 08/10/2019
	use PROCON

	select count(*) from DoNotCall  -- 25682913
	select UF ,telbase ,count(*) qtd from DoNotCall group by uf,telBase having count(*) > 1 -- 0

	
	
	select top 3 * from ATU_PROCON 	
	select top 3 * from DoNotCall where UF = 'AL' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'AL'                                       -- 210918	 210944
	select count(*) from DoNotCall where UF = 'AL' and Procon = 1 and NaoMePerturbe  = 0 --    283	    309
	select count(*) from DoNotCall where UF = 'AL' and Procon = 1 and NaoMePerturbe  = 1 --   9285     9390



	select top 10 * from ATU_PROCON 	
	select top 3 * from DoNotCall where UF = 'CE' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'CE'                                       -- 598017	598042
	select count(*) from DoNotCall where UF = 'CE' and Procon = 1 and NaoMePerturbe  = 0 --       	    26
	select count(*) from DoNotCall where UF = 'CE' and Procon = 1 and NaoMePerturbe  = 1 --			 16155




	select top 3 * from ATU_PROCON 	
	select top 3 * from DoNotCall where UF = 'ES' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'ES'                                       -- 306124	307710
	select count(*) from DoNotCall where UF = 'ES' and Procon = 1 and NaoMePerturbe  = 0 --       	 14702
	select count(*) from DoNotCall where UF = 'ES' and Procon = 1 and NaoMePerturbe  = 1 --			 69349



	select top 3 * from ATU_PROCON 	
	select top 3 * from DoNotCall where UF = 'GO' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'GO'                                       --  657858	 658061
	select count(*) from DoNotCall where UF = 'GO' and Procon = 1 and NaoMePerturbe  = 0 --       	    299
	select count(*) from DoNotCall where UF = 'GO' and Procon = 1 and NaoMePerturbe  = 1 --			  37458



	select top 3 * from ATU_PROCON 	
	select top 3 * from DoNotCall where UF = 'MG' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'MG'                                       --  -	1423352	1423917
	select count(*) from DoNotCall where UF = 'MG' and Procon = 1 and NaoMePerturbe  = 0 --  -	  21468	  22033
	select count(*) from DoNotCall where UF = 'MG' and Procon = 1 and NaoMePerturbe  = 1 --  -   265748  271598



	select top 3 * from ATU_PROCON 	
	select top 3 * from DoNotCall where UF = 'MS' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'MS'                                       --  -  281558	281649
	select count(*) from DoNotCall where UF = 'MS' and Procon = 1 and NaoMePerturbe  = 0 --  -	    84	   175
	select count(*) from DoNotCall where UF = 'MS' and Procon = 1 and NaoMePerturbe  = 1 --  -   30320	 31571



	select top 3 * from ATU_PROCON 	
	select top 3 * from DoNotCall where UF = 'PB' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'PB'                                       --  -	416783	416796
	select count(*) from DoNotCall where UF = 'PB' and Procon = 1 and NaoMePerturbe  = 0 --  -	    29	    42
	select count(*) from DoNotCall where UF = 'PB' and Procon = 1 and NaoMePerturbe  = 1 --  -    5261	  5411


	select top 3 * from ATU_PROCON 	
	select obs ,count(*) from ATU_PROCON group by obs order by obs
	select top 3 * from DoNotCall where UF = 'PR' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'PR'                                       --  1670723	1670723
	select count(*) from DoNotCall where UF = 'PR' and Procon = 1 and NaoMePerturbe  = 0 --       96	     96
	select count(*) from DoNotCall where UF = 'PR' and Procon = 1 and NaoMePerturbe  = 1 --   399265	 399265



	select top 3 * from ATU_PROCON 	
	select top 3 * from DoNotCall where UF = 'RN' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'RN'                                       --  -	 190149	 190154
	select count(*) from DoNotCall where UF = 'RN' and Procon = 1 and NaoMePerturbe  = 0 --  -	      2	      7
	select count(*) from DoNotCall where UF = 'RN' and Procon = 1 and NaoMePerturbe  = 1 --  -     1885    1912



	select top 3 * from ATU_PROCON 	
	select top 3 * from DoNotCall where UF = 'RS' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'RS'                                       --  -	1876963  1877306
	select count(*) from DoNotCall where UF = 'RS' and Procon = 1 and NaoMePerturbe  = 0 --  -	    469	     812
	select count(*) from DoNotCall where UF = 'RS' and Procon = 1 and NaoMePerturbe  = 1 --  -   263914   267733



	select top 3 * from ATU_PROCON 	
	select top 3 * from DoNotCall where UF = 'SC' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'SC'                                       --  -	 957538   957892
	select count(*) from DoNotCall where UF = 'SC' and Procon = 1 and NaoMePerturbe  = 0 --  -	      0	     354
	select count(*) from DoNotCall where UF = 'SC' and Procon = 1 and NaoMePerturbe  = 1 --  -   113741   117217



	select top 3 * from ATU_PROCON 	
	select top 3 * from DoNotCall where UF = 'SP' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'SP'                                       --  -	11309149	11310317
	select count(*) from DoNotCall where UF = 'SP' and Procon = 1 and NaoMePerturbe  = 0 --  -	  835553	  836721
	select count(*) from DoNotCall where UF = 'SP' and Procon = 1 and NaoMePerturbe  = 1 --  -   2470369	 2517035


	select * into [BKP_SP] from donotcall where uf = 'SP' -- 3698368
	DROP TABLE [BKP_SP]



/*
	select count(*) from donotcall_AL;  --					   8251
	select count(*) from donotcall_CE;  --    8716	  10614   12751
	select count(*) from donotcall_ES;  --   70441	  71315   72109
	select count(*) from donotcall_GO;  --   25907	  26977   29847
	select count(*) from donotcall_MG;  --  216023	 224089	 243718
	select count(*) from donotcall_MS;  --   21451	  23702	  26461
	select count(*) from donotcall_PB;  --	  2509	   2572	   3028
	select count(*) from donotcall_PR;  --  330361	 335598  359117
	select count(*) from donotcall_RN;  --     948		961    1036
	select count(*) from donotcall_RS;  --  225525	 230096  238591
	select count(*) from donotcall_SC;  --   83768	  86857   93723
	select count(*) from donotcall_SP;  -- 3014071	3041157 3046201

		
		
		select count(*) from ATU_PROCON 
		select top 20 * from ATU_PROCON order by nome 


		select top 20 * from [DoNotCall_SP] order by CodCall desc -- 
		select top 10 * from [DoNotCall_SP] where CodCall >= 3044828 order by CodCall 
		
		select top 20 * from [DoNotCall_SP] order by Cod_Call desc -- 
		select top 10 * from [DoNotCall_SP] where Cod_Call >= 961 order by Cod_Call 

			delete from [DoNotCall_SP] where codcall > 3044828

	
	

-- ------------------------------------------------------------------------------
-- 169.57.141.25	
	--truncate table donotcall_AL;
	--truncate table donotcall_ES;
	--truncate table donotcall_GO;
	--truncate table donotcall_MG;
	--truncate table donotcall_MS;
	--truncate table donotcall_PR;
	--truncate table donotcall_RN;
	--truncate table donotcall_RS;
	--truncate table donotcall_SC;
	--truncate table donotcall_SP;

*/

