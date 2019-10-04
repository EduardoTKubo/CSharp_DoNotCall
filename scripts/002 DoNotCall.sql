

 -- ------------------------------------------------------------------------------
-- SRV_db03 -- 08/08/2019
	use PROCON

	select count(*) from DoNotCall wh  -- 6031176
	select UF ,telbase ,count(*) qtd from DoNotCall group by uf,telBase having count(*) > 1 -- 0

	
	
	select top 3 * from ATU_PROCON 	
	select top 3 * from DoNotCall where UF = 'AL' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'AL'                                       -- 21022	21142
	select count(*) from DoNotCall where UF = 'AL' and Procon = 1 and NaoMePerturbe  = 0 --   501	  621
	select count(*) from DoNotCall where UF = 'AL' and Procon = 1 and NaoMePerturbe  = 1 --  8417    8736
	select count(*) from DoNotCall where UF = 'AL' and Procon = 0 and NaoMePerturbe  = 1 -- 12104   11785



	select top 3 * from ATU_PROCON 	
	select top 3 * from DoNotCall where UF = 'CE' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'CE'                                       -- 47518	47764
	select count(*) from DoNotCall where UF = 'CE' and Procon = 1 and NaoMePerturbe  = 0 --   104	 350
	select count(*) from DoNotCall where UF = 'CE' and Procon = 1 and NaoMePerturbe  = 1 -- 14287   14977
	select count(*) from DoNotCall where UF = 'CE' and Procon = 0 and NaoMePerturbe  = 1 -- 33127   32437



	select top 3 * from ATU_PROCON 	
	select top 3 * from DoNotCall where UF = 'ES' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'ES'                                       -- 102379	108449
	select count(*) from DoNotCall where UF = 'ES' and Procon = 1 and NaoMePerturbe  = 0 --  13141	 19211
	select count(*) from DoNotCall where UF = 'ES' and Procon = 1 and NaoMePerturbe  = 1 --  60154   61602
	select count(*) from DoNotCall where UF = 'ES' and Procon = 0 and NaoMePerturbe  = 1 --  29084   27636



	select top 3 * from ATU_PROCON 	
	select top 3 * from DoNotCall where UF = 'GO' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'GO'                                       --  89705	 90555
	select count(*) from DoNotCall where UF = 'GO' and Procon = 1 and NaoMePerturbe  = 0 --    647	  1497
	select count(*) from DoNotCall where UF = 'GO' and Procon = 1 and NaoMePerturbe  = 1 --  31510   33964
	select count(*) from DoNotCall where UF = 'GO' and Procon = 0 and NaoMePerturbe  = 1 --  57548   55094



	select top 3 * from ATU_PROCON 	
	select top 3 * from DoNotCall where UF = 'MG' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'MG'                                       --  -	 437043	444673
	select count(*) from DoNotCall where UF = 'MG' and Procon = 1 and NaoMePerturbe  = 0 --  -	  31875	 39505
	select count(*) from DoNotCall where UF = 'MG' and Procon = 1 and NaoMePerturbe  = 1 --  -   222469	235924
	select count(*) from DoNotCall where UF = 'MG' and Procon = 0 and NaoMePerturbe  = 1 --  -   182699	169244



	select top 3 * from ATU_PROCON 	
	select top 3 * from DoNotCall where UF = 'MS' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'MS'                                       --  -	 46382	47012
	select count(*) from DoNotCall where UF = 'MS' and Procon = 1 and NaoMePerturbe  = 0 --  -	  1595	 2225
	select count(*) from DoNotCall where UF = 'MS' and Procon = 1 and NaoMePerturbe  = 1 --  -   26273	27185
	select count(*) from DoNotCall where UF = 'MS' and Procon = 0 and NaoMePerturbe  = 1 --  -   18514	17602



	select top 3 * from ATU_PROCON 	
	select top 3 * from DoNotCall where UF = 'PB' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'PB'                                       --  -	 19781	19914
	select count(*) from DoNotCall where UF = 'PB' and Procon = 1 and NaoMePerturbe  = 0 --  -	   315	  448
	select count(*) from DoNotCall where UF = 'PB' and Procon = 1 and NaoMePerturbe  = 1 --  -    3603	 4528
	select count(*) from DoNotCall where UF = 'PB' and Procon = 0 and NaoMePerturbe  = 1 --  -   15863	14938



	select top 3 * from ATU_PROCON 	
	select top 3 * from DoNotCall where UF = 'PR' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'PR'                                       --   458332	462980
	select count(*) from DoNotCall where UF = 'PR' and Procon = 1 and NaoMePerturbe  = 0 --      484	  5132
	select count(*) from DoNotCall where UF = 'PR' and Procon = 1 and NaoMePerturbe  = 1 --   366900	382264
	select count(*) from DoNotCall where UF = 'PR' and Procon = 0 and NaoMePerturbe  = 1 --    90948	 75584



	select top 3 * from ATU_PROCON 	
	select top 3 * from DoNotCall where UF = 'RN' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'RN'                                       --  -	 15292	15323
	select count(*) from DoNotCall where UF = 'RN' and Procon = 1 and NaoMePerturbe  = 0 --  -	    18	   49
	select count(*) from DoNotCall where UF = 'RN' and Procon = 1 and NaoMePerturbe  = 1 --  -    1696   1772
	select count(*) from DoNotCall where UF = 'RN' and Procon = 0 and NaoMePerturbe  = 1 --  -   13578	13502



	select top 3 * from ATU_PROCON 	
	select top 3 * from DoNotCall where UF = 'RS' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'RS'                                       --  -	 338258  341878
	select count(*) from DoNotCall where UF = 'RS' and Procon = 1 and NaoMePerturbe  = 0 --  -	  12362	  15982
	select count(*) from DoNotCall where UF = 'RS' and Procon = 1 and NaoMePerturbe  = 1 --  -   236598  242034
	select count(*) from DoNotCall where UF = 'RS' and Procon = 0 and NaoMePerturbe  = 1 --  -    89298	  83862



	select top 3 * from ATU_PROCON 	
	select top 3 * from DoNotCall where UF = 'SC' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'SC'                                       --  -	 166915  170388
	select count(*) from DoNotCall where UF = 'SC' and Procon = 1 and NaoMePerturbe  = 0 --  -	    434	   3907
	select count(*) from DoNotCall where UF = 'SC' and Procon = 1 and NaoMePerturbe  = 1 --  -    98469  103980
	select count(*) from DoNotCall where UF = 'SC' and Procon = 0 and NaoMePerturbe  = 1 --  -    68012	  62501



	select top 3 * from ATU_PROCON 	
	select top 3 * from DoNotCall where UF = 'SP' and Procon = 1 and NaoMePerturbe  = 0  order by id desc

	select count(*) from DoNotCall where UF = 'SP'                                       --  -	 3698368   3708706
	select count(*) from DoNotCall where UF = 'SP' and Procon = 1 and NaoMePerturbe  = 0 --  -	  844439	854777
	select count(*) from DoNotCall where UF = 'SP' and Procon = 1 and NaoMePerturbe  = 1 --  -   2290616   2376499
	select count(*) from DoNotCall where UF = 'SP' and Procon = 0 and NaoMePerturbe  = 1 --  -    563313	477430


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

