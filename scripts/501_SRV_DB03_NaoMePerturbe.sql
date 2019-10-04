USE [PROCON]
GO
	
	-- 31/07/2019
	-- 01/08/2019
	-- 08/08/2019
	-- 15/08/2019

	-- baixar arquivo via ftp 

	truncate table NAOPERTURBE
	truncate table ATU_PROCON;

	-- apos importar arquivo via sql server management	

	select count(*) from NAOPERTURBE;	-- 4553016 9636705 13140869 9553468 9683790
	

	select top 5 * from ATU_PROCON 
	select top 5 * from NAOPERTURBE 

	
	-- NAOPERTURBE ---> ATU_PROCON
	select origem ,count(*) from NAOPERTURBE group by origem order by origem; 


		insert into ATU_PROCON ( origem ,uf ,telefone ,data ,situacao ,apartirde )
		select 'NaoMePerturbe' ,origem ,telefone ,convert( datetime ,dt_cadastro ,103 ) ,evento ,convert( datetime ,dt_inicio ,103 ) 
		from NAOPERTURBE;
			-- 02:16
			-- 4553016 9636705 13140869 9553468 9683790

	-- ===================================================================================================

	select top 3 * from donotcall;
	select top 3 * from ATU_PROCON;  
	
//*	
	-- UFs com apenas 1 DDD
	select uf ,count(*) qtd  into #tmp from UFBR group by uf having count(*) = 1 order by uf;
	select * from ufbr where uf in ( select uf from #tmp ) order by uf;
	drop table #tmp;

1	AC	68
2	AL	82
5	AP	96
13	DF	61
28	MS	67
34	PB	83
48	RN	84
49	RO	69
50	RR	95
59	SE	79
69	TO	63
*//

	-- inicio trata Atu_Procon ====================================================================================================

	select top 10 * from ATU_PROCON;

	-- fone/cel sem DDD - incluindo o DDD para os estados abaixo ( que só possuem 1 DDD ): 
		select uf ,count(*) from ATU_PROCON where len(telefone) in (8,9) group by uf order by uf;
	
	select * from ATU_PROCON where len(telefone) in (8,9) and uf = 'AC' and left(telefone,2) <> '68';
	select * from ATU_PROCON where len(telefone) in (8,9) and uf = 'AL' and left(telefone,2) <> '82';
	select * from ATU_PROCON where len(telefone) in (8,9) and uf = 'AP' and left(telefone,2) <> '96';
	select * from ATU_PROCON where len(telefone) in (8,9) and uf = 'DF' and left(telefone,2) <> '61';
		drop table #tmp;
		select id into #tmp from ATU_PROCON where len(telefone) in (8,9) and uf = 'DF' and left(telefone,2) <> '61';
			update ATU_PROCON set telefone = '61' + telefone where id in ( select id from #tmp );
			select * from ATU_PROCON where id in ( select id from #tmp );

	select * from ATU_PROCON where len(telefone) in (8,9) and uf = 'MS' and left(telefone,2) <> '67';
		drop table #tmp;
		select id into #tmp from ATU_PROCON where len(telefone) in (8,9) and uf = 'MS' and left(telefone,2) <> '67';
			update ATU_PROCON set telefone = '67' + telefone where id in ( select id from #tmp );

	select * from ATU_PROCON where len(telefone) in (8,9) and uf = 'PB' and left(telefone,2) <> '83';
		drop table #tmp;
		select id into #tmp from ATU_PROCON where len(telefone) in (8,9) and uf = 'PB' and left(telefone,2) <> '83';
			update ATU_PROCON set telefone = '83' + telefone where id in ( select id from #tmp );
			select * from ATU_PROCON where id in ( select id from #tmp );

	select * from ATU_PROCON where len(telefone) in (8,9) and uf = 'RN' and left(telefone,2) <> '84';
	select * from ATU_PROCON where len(telefone) in (8,9) and uf = 'RO' and left(telefone,2) <> '69';
	select * from ATU_PROCON where len(telefone) in (8,9) and uf = 'RR' and left(telefone,2) <> '95';
	select * from ATU_PROCON where len(telefone) in (8,9) and uf = 'SE' and left(telefone,2) <> '79';
	select * from ATU_PROCON where len(telefone) in (8,9) and uf = 'TO' and left(telefone,2) <> '63';

	-- ==========================================================================================================
	select * from ATU_PROCON where len(telefone) < 10 order by telefone;
	select * from ATU_PROCON where len(telefone) > 11 order by telefone;
		update ATU_PROCON set obs = 'fone invalido' where len(telefone) < 10 ;  -- 2217 2464 3468 2438 2461 
		update ATU_PROCON set obs = 'fone invalido' where len(telefone) > 11 ;  -- 6175 6567 6600 6875 6984

		select * from ATU_PROCON where obs = 'fone invalido' order by telefone;
		delete   from ATU_PROCON where obs = 'fone invalido';

	select count(*) from ATU_PROCON where obs is null;  -- 4544624 9627674 13130801 9544155 9674345


	-- gerando ddd e fone a partir de telefone
	update ATU_PROCON set ddd = substring(telefone,1,2) ,fone = substring(telefone,3,len(telefone)) where obs is null and len(telefone) in ( 10 ,11 );
		-- 03:05
		-- 4544624 9627674 13130801 9544155 9674345
	
	select top 10 * from ATU_PROCON where obs is null order by fone;
		update ATU_PROCON set fone = convert ( nvarchar, convert( bigint ,fone ) ) where obs is null;   
			-- 00:15
			-- 9627674 13130801 9544155

	select top 10 * from ATU_PROCON where obs is null and len(fone) < 8 order by fone desc;
		update ATU_PROCON set obs = 'fone invalido' where obs is null and len(fone) < 8;                  --  266  307  436  541  554
		update ATU_PROCON set obs = 'fone invalido' where obs is null and substring(fone,1,1) in ('1');   -- 1043 1838 2507 2074 2116
			delete from ATU_PROCON where obs = 'fone invalido';  -- 2943 2615 2670


	-- adicionando 9 digito para os fones com 8 digitos iniciados com 6,7,8,9
	select top 10 * from ATU_PROCON where obs is null and len(fone) = 8 and left(fone,1) in ('6','7','8','9') order by fone
		update ATU_PROCON set fone = '9' + fone where obs is null and len(fone) = 8 and left(fone,1) in ('6','7','8','9') ;    
			-- 00:10
			-- 928595 1160396 1726040 1045418 1050270


	-- marcando os fones com 9 digitos que nao iniciam com 9
	select top 10 * from ATU_PROCON where obs is null and len(fone) = 9 and substring(fone,1,1) in ('2','3','4','5','6','7','8') order by fone desc
		update ATU_PROCON set obs = 'fone invalido' where obs is null and len(fone) = 9 and substring(fone,1,1) in ('2','3','4','5','6','7','8'); -- 5259 6200 8932
			delete from ATU_PROCON where obs = 'fone invalido';
				-- 11398  11589


	-- atualizando UF  dos  ABR / NET_OPTPUT
		update a  set   a.uf = b.UF 
		from       ATU_PROCON  as a
		inner join ufbr        as b  on  b.ddd = a.ddd 
		where a.uf in ('ABR','NET_OPTPUT') and a.obs is null;  -- 01:13 5102703 8580176 4917404 5011400
		

	select uf ,count(*) from atu_procon where obs is null group by uf order by uf ;
		select * from ATU_PROCON where uf in ('ABR','NET_OPTPUT') and obs is null order by ddd;
			update ATU_PROCON set obs = 'DDD INVALIDO' where obs is null and uf in ('ABR','NET_OPTPUT'); -- 24 288 347 151 
			delete from ATU_PROCON where obs = 'DDD INVALIDO';


		update a set a.obs = 'ddd ok'
		from ATU_PROCON as a
		inner join ufbr as b on b.uf = a.uf and b.ddd = a.ddd   -- 4513598 9585125 13084663	9491637 9619883	                                  
		where a.obs is null;   --  03:03
		
		delete from ATU_PROCON where obs is null; -- 24434 33916 33916 38359 40052 

		update ATU_PROCON set obs = null where obs = 'ddd ok';  -- 4513598 9585125 13084663 9491637 9619883

		delete from ATU_PROCON where obs is not null;


	------ atualizando telefone = ddd + fone
	----drop table #tmp;
	----select id into #tmp from ATU_PROCON where telefone <> ddd + fone;  -- 925658

	----	update ATU_PROCON set telefone = ddd + fone where id in ( select id from #tmp );   -- 925658
		


	-- retirando duplicidades de ATU_PROCON
	drop table #tmp;
	select * into #tmp from ( 
		select * ,row_number() over( partition by uf,ddd,fone order by uf,ddd,fone,data desc ) as seq from ATU_PROCON where Obs is null 
						    ) as x  where seq = 1;
		-- 02:37
		-- 3446936 5105527 5259868 5252304 5344755


	-- atualizado ATU_PROCON
	truncate table ATU_PROCON;
	insert into ATU_PROCON ( origem ,uf ,nome ,telefone   ,data ,situacao ,apartirde ,datalimite ,ddd ,fone ) 
	                  select origem ,uf ,nome ,ddd + fone ,data ,situacao ,apartirde ,datalimite ,ddd ,fone from #tmp;
					  -- 00:19
	drop table #tmp;



	select top 5 * from ATU_PROCON;
	select top 5 * from DoNotCall;
	 
		
	update a set a.obs = 'SO PROCON'
	from       atu_procon  as a
	inner join DoNotCall   as d on d.uf       = a.uf  and
								   d.ddd      = a.ddd and
								   d.telefone = a.fone		    
	where d.Procon = 1 and d.NaoMePerturbe = 0  and  a.data < '2019-07-16';  -- 17129 5036 5023


	update a set a.obs = 'SO NAOMEPERTURBE'
	from       atu_procon  as a
	inner join DoNotCall   as d on d.uf       = a.uf  and
								   d.ddd      = a.ddd and
								   d.telefone = a.fone		    
	where d.Procon = 0 and d.NaoMePerturbe = 1  and  a.data < '2019-07-16';  -- 0 261 255


	update a set a.obs = 'PROCON + NAOMEPERTURBE'
	from       atu_procon  as a
	inner join DoNotCall   as d on d.uf       = a.uf  and
								   d.ddd      = a.ddd and
								   d.telefone = a.fone						 -- 01:04
	where d.Procon = 1 and d.NaoMePerturbe = 1  and  a.data < '2019-07-16';  -- 3368485 3266724 3262616 3335216 3330965

				select top 100 d.* 
				from    DoNotCall     as d
				inner join Atu_Procon as a  on a.uf     = d.uf  and
								               a.ddd    = d.ddd and
								               a.fone   = d.telefone
				where a.obs = 'PROCON + NAOMEPERTURBE' and d.dataLimite is not null;


				-- atualizando dados
				update d set d.data       = a.data ,
				             d.dataLimite = a.DATALIMITE ,
							 d.situacao   = a.SITUACAO 
				from    DoNotCall     as d
				inner join Atu_Procon as a  on a.uf     = d.uf  and
								               a.ddd    = d.ddd and    -- 00:47
								               a.fone   = d.telefone   -- 3368485 3266724 3262616 3335216 3330965
				where a.obs = 'PROCON + NAOMEPERTURBE';	



	--update d set d.NaoMePerturbe = 1
	--from    DoNotCall     as d
	--inner join Atu_Procon as a  on a.uf     = d.uf  and
	--							   a.ddd    = d.ddd and
	--							   a.fone   = d.telefone
	--where a.obs = 'EXISTE EM DONOTCALL' and d.NaoMePerturbe = 0;	-- 3228918





	delete from ATU_PROCON where obs is not null;     -- 3283844 3279745 3340513 3336243

	select count(*) from ATU_PROCON where obs is null -- 78451 1821683 1980123 1911791 2008512

	select  * from ATU_PROCON where obs is null and data < '2019-07-16' 


	
	update a set a.obs = 'PROCON + NAOMEPERTURBE'
	from       atu_procon  as a
	inner join DoNotCall   as d on d.uf       = a.uf  and
								   d.ddd      = a.ddd and
								   d.telefone = a.fone		   
	where d.Procon = 1 and d.NaoMePerturbe = 1  and  a.data >= '2019-07-16';  -- 32034 133785 137894 196858 232581
	
				-- atualizando dados
				update d set d.data       = a.data ,
				             d.dataLimite = a.DATALIMITE ,
							 d.situacao   = a.SITUACAO 
				from    DoNotCall     as d
				inner join Atu_Procon as a  on a.uf     = d.uf  and
								               a.ddd    = d.ddd and
								               a.fone   = d.telefone   -- 32034 133785 137894 196858 232581
				where a.obs = 'PROCON + NAOMEPERTURBE';	



	update a set a.obs = 'SO PROCON'
	from       atu_procon  as a
	inner join DoNotCall   as d on d.uf       = a.uf  and
								   d.ddd      = a.ddd and
								   d.telefone = a.fone		    
	where d.Procon = 1 and d.NaoMePerturbe = 0  and  a.data >= '2019-07-16';  -- 707 789 31580 2180
	
				-- atualizando dados
				update d set d.data       = a.data ,
				             d.dataLimite = a.DATALIMITE ,
							 d.situacao   = a.SITUACAO ,
							 d.NaoMePerturbe = 1
				from    DoNotCall     as d
				inner join Atu_Procon as a  on a.uf     = d.uf  and
								               a.ddd    = d.ddd and
								               a.fone   = d.telefone          -- 707 789 31580 2180
				where a.obs = 'SO PROCON';	



	update a set a.obs = 'SO NAOMEPERTURBE'
	from       atu_procon  as a
	inner join DoNotCall   as d on d.uf       = a.uf  and
								   d.ddd      = a.ddd and
								   d.telefone = a.fone		    
	where d.Procon = 0 and d.NaoMePerturbe = 1  and  a.data >= '2019-07-16';  -- 46417 46400 1571789 1576947 1677731

				-- atualizando dados
				update d set d.data       = a.data ,
				             d.dataLimite = a.DATALIMITE ,
							 d.situacao   = a.SITUACAO 
				from    DoNotCall     as d
				inner join Atu_Procon as a  on a.uf     = d.uf  and
								               a.ddd    = d.ddd and
								               a.fone   = d.telefone          -- 46417 46400 1571789 1576947 1677731
				where a.obs = 'SO NAOMEPERTURBE';	






    select COUNT(*) from ATU_PROCON where obs is null and data >= '2019-07-16'  -- 1525443 152882 100883 90480
	select TOP 5 *  from ATU_PROCON where obs is null and data >= '2019-07-16' 

		insert into DoNotCall ( Procon,NaoMePerturbe ,uf ,nome ,ddd ,telefone ,telBase ,data ,dataLimite ,situacao ) 
			select 0 ,1 ,uf ,nome ,ddd ,fone ,telefone ,data ,apartirde ,situacao
			from ATU_PROCON 
			where obs is null and data >= '2019-07-16'; 
			-- 01:24
			-- 46417 1525443 152882 100883 90480




	-- RESUMO FINAL

	select count(*) from DoNotCall										   -- 4352851	5878294 6031176	6169848	6260328
	select count(*) from DoNotCall where procon = 1 and NaoMePerturbe = 0  --  905915	 905915  905915  912124  909944
	select count(*) from DoNotCall where procon = 1 and NaoMePerturbe = 1  -- 3400519	3400519 3400519 3564572 3566752
	select count(*) from DoNotCall where procon = 0 and NaoMePerturbe = 1  --   46417	1571860 1724742 1693152 1783632

	truncate table ATU_PROCON;
	truncate table NAOPERTURBE;
	

	select uf ,telbase ,count(*) from DoNotCall group by uf ,telBase having count(*) > 1  --> 0
	

	-- exportar para o servidor 10.0.32.53 / procon -- flavio
	-- exportar para o servidor SRV_DB02   / procon





