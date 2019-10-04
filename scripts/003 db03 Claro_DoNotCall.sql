
	use CLARO

	use claro_pme 

	select * from cadastro where uso1 = 777 order by fone1 

	update Cadastro set USO1 = 777 where uso1 < 10 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) 
	update Cadastro set USO2 = 777 where uso2 < 10 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) 
	update Cadastro set USO3 = 777 where uso3 < 10 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) 
	update Cadastro set USO4 = 777 where uso4 < 10 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) 

	update Cadastro set USO = 777 where USO <> 777 and USO1 = 777;
	update Cadastro set USO = 777 where USO <> 777 and USO2 = 777;
	update Cadastro set USO = 777 where USO <> 777 and USO3 = 777;
	update Cadastro set USO = 777 where USO <> 777 and USO4 = 777;

		delete from agenda       where ID     in ( select codigo from Cadastro where USO = 777 );
		delete from aux_tel_pred where codigo in ( select codigo from Cadastro where USO = 777 );
	
	update tab_d1_robo    set lido = 1  where lido = 0  and codigo in ( select codigo from Cadastro where USO = 777 )
	update tab_d3_cadoper set uso = 777 where uso < 100 and codigo in ( select codigo from Cadastro where USO = 777 )

		insert into trabalhados select * from Cadastro where uso = 777;
		delete from Cadastro where uso = 777; 


-- quando Claro PME / Carteira Cli -----------------------------------------------------------------------------------------------------------------------

	update Carteira_Cli set USO1 = 777 where uso1 < 10 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) 
	update Carteira_Cli set USO2 = 777 where uso2 < 10 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) 
	update Carteira_Cli set USO3 = 777 where uso3 < 10 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) 
	update Carteira_Cli set USO4 = 777 where uso4 < 10 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) 

	update Carteira_Cli set USO = 777 where USO <> 777 and USO1 = 777;
	update Carteira_Cli set USO = 777 where USO <> 777 and USO2 = 777;
	update Carteira_Cli set USO = 777 where USO <> 777 and USO3 = 777;
	update Carteira_Cli set USO = 777 where USO <> 777 and USO4 = 777;



/*
-- ===============================================================================================================================================
-- Al
	update Cadastro set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_al ) 
	update Cadastro set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_al ) 
	update Cadastro set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_al ) 
	update Cadastro set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_al ) 
	
-- ce
	update Cadastro set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ce ) 
	update Cadastro set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ce ) 
	update Cadastro set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ce ) 
	update Cadastro set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ce ) 

-- es
	update Cadastro set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_es ) 
	update Cadastro set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_es ) 
	update Cadastro set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_es ) 
	update Cadastro set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_es ) 

-- go
	update Cadastro set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_go ) 
	update Cadastro set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_go ) 
	update Cadastro set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_go ) 
	update Cadastro set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_go ) 

--mg
	update Cadastro set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_mg ) 
	update Cadastro set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_mg ) 
	update Cadastro set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_mg ) 
	update Cadastro set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_mg ) 

-- ms
	update Cadastro set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ms ) 
	update Cadastro set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ms ) 
	update Cadastro set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ms ) 
	update Cadastro set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ms ) 

-- pb
	update Cadastro set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pb ) 
	update Cadastro set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pb ) 
	update Cadastro set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pb ) 
	update Cadastro set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pb ) 

-- pr
	update Cadastro set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pr ) 
	update Cadastro set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pr ) 
	update Cadastro set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pr ) 
	update Cadastro set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pr ) 

-- rn
	update Cadastro set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rn ) 
	update Cadastro set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rn ) 
	update Cadastro set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rn ) 
	update Cadastro set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rn ) 

-- rs
	update Cadastro set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rs ) 
	update Cadastro set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rs ) 
	update Cadastro set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rs ) 
	update Cadastro set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rs ) 

-- sc
	update Cadastro set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_sc ) 
	update Cadastro set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_sc ) 
	update Cadastro set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_sc ) 
	update Cadastro set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_sc ) 

--sp
	update Cadastro set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_sp ) 
	update Cadastro set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_sp ) 
	update Cadastro set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_sp ) 
	update Cadastro set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_sp ) 

-- xx
	update Cadastro set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_xx ) 
	update Cadastro set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_xx ) 
	update Cadastro set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_xx ) 
	update Cadastro set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_xx ) 

	update Cadastro set USO = 777 where USO < 777 and USO1 > 100 and USO2 > 100 and USO3 > 100 and USO4 > 100; 
	update Cadastro set USO = 777 where USO < 777 and USO1 = 777;
	update Cadastro set USO = 777 where USO < 777 and USO2 = 777;
	update Cadastro set USO = 777 where USO < 777 and USO3 = 777;
	update Cadastro set USO = 777 where USO < 777 and USO4 = 777;


	delete from agenda       where ID     in ( select codigo from Cadastro where USO = 777 );
	delete from aux_tel_pred where codigo in ( select codigo from Cadastro where USO = 777 );
	
	update tab_d1_robo    set lido = 1  where lido = 0  and codigo in ( select codigo from Cadastro where USO = 777 )
	update tab_d3_cadoper set uso = 777 where uso < 100 and codigo in ( select codigo from Cadastro where USO = 777 )

		insert into trabalhados select * from Cadastro where uso = 777;
		delete from Cadastro where uso = 777; 



-- quando Claro PME / Carteira Cli -----------------------------------------------------------------------------------------------------------------------

	update Carteira_Cli set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_al ) 
	update Carteira_Cli set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_al ) 
	update Carteira_Cli set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_al ) 
	update Carteira_Cli set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_al ) 



-- Al
	update Carteira_Cli set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_al ) 
	update Carteira_Cli set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_al ) 
	update Carteira_Cli set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_al ) 
	update Carteira_Cli set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_al ) 
	
-- ce
	update Carteira_Cli set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ce ) 
	update Carteira_Cli set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ce ) 
	update Carteira_Cli set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ce ) 
	update Carteira_Cli set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ce ) 

-- es
	update Carteira_Cli set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_es ) 
	update Carteira_Cli set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_es ) 
	update Carteira_Cli set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_es ) 
	update Carteira_Cli set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_es ) 

-- go
	update Carteira_Cli set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_go ) 
	update Carteira_Cli set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_go ) 
	update Carteira_Cli set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_go ) 
	update Carteira_Cli set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_go ) 

--mg
	update Carteira_Cli set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_mg ) 
	update Carteira_Cli set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_mg ) 
	update Carteira_Cli set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_mg ) 
	update Carteira_Cli set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_mg ) 

-- ms
	update Carteira_Cli set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ms ) 
	update Carteira_Cli set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ms ) 
	update Carteira_Cli set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ms ) 
	update Carteira_Cli set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ms ) 

-- pb
	update Carteira_Cli set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pb ) 
	update Carteira_Cli set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pb ) 
	update Carteira_Cli set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pb ) 
	update Carteira_Cli set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pb ) 

-- pr
	update Carteira_Cli set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pr ) 
	update Carteira_Cli set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pr ) 
	update Carteira_Cli set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pr ) 
	update Carteira_Cli set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pr ) 

-- rn
	update Carteira_Cli set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rn ) 
	update Carteira_Cli set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rn ) 
	update Carteira_Cli set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rn ) 
	update Carteira_Cli set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rn ) 

-- rs
	update Carteira_Cli set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rs ) 
	update Carteira_Cli set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rs ) 
	update Carteira_Cli set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rs ) 
	update Carteira_Cli set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rs ) 

-- sc
	update Carteira_Cli set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_sc ) 
	update Carteira_Cli set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_sc ) 
	update Carteira_Cli set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_sc ) 
	update Carteira_Cli set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_sc ) 

--sp
	update Carteira_Cli set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_sp ) 
	update Carteira_Cli set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_sp ) 
	update Carteira_Cli set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_sp ) 
	update Carteira_Cli set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_sp ) 

-- xx
	update Carteira_Cli set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_xx ) 
	update Carteira_Cli set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_xx ) 
	update Carteira_Cli set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_xx ) 
	update Carteira_Cli set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_xx ) 

	update Carteira_Cli set USO = 777 where USO < 777 and USO1 > 100 and USO2 > 100 and USO3 > 100 and USO4 > 100; 
	update Carteira_Cli set USO = 777 where USO < 777 and USO1 = 777;
	update Carteira_Cli set USO = 777 where USO < 777 and USO2 = 777;
	update Carteira_Cli set USO = 777 where USO < 777 and USO3 = 777;
	update Carteira_Cli set USO = 777 where USO < 777 and USO4 = 777;





---  importacao ----
	
	update Importacao set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_sp ) 
	update Importacao set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_sp ) 
	update Importacao set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_sp ) 
	update Importacao set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_sp ) 

	update Importacao set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rs ) 
	update Importacao set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rs ) 
	update Importacao set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rs ) 
	update Importacao set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rs ) 

	update Importacao set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rn ) 
	update Importacao set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rn ) 
	update Importacao set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rn ) 
	update Importacao set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_rn ) 

	update Importacao set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pr ) 
	update Importacao set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pr ) 
	update Importacao set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pr ) 
	update Importacao set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pr ) 

	update Importacao set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_al ) 
	update Importacao set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_al ) 
	update Importacao set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_al ) 
	update Importacao set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_al ) 

	update Importacao set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ms ) 
	update Importacao set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ms ) 
	update Importacao set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ms ) 
	update Importacao set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ms ) 

	update Importacao set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pb ) 
	update Importacao set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pb ) 
	update Importacao set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pb ) 
	update Importacao set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_pb ) 

	update Importacao set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_es ) 
	update Importacao set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_es ) 
	update Importacao set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_es ) 
	update Importacao set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_es ) 

	update Importacao set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ce ) 
	update Importacao set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ce ) 
	update Importacao set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ce ) 
	update Importacao set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_ce ) 

	update Importacao set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_mg ) 
	update Importacao set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_mg ) 
	update Importacao set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_mg ) 
	update Importacao set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_mg ) 

	update Importacao set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_xx ) 
	update Importacao set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_xx ) 
	update Importacao set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_xx ) 
	update Importacao set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall_xx ) 

	update Importacao set USO = 777 where USO < 777 and USO1 > 100 and USO2 > 100 and USO3 > 100 and USO4 > 100 
	update Importacao set USO = 777 where USO < 777 and USO1 = 777
	update Importacao set USO = 777 where USO < 777 and USO2 = 777
	update Importacao set USO = 777 where USO < 777 and USO3 = 777
	update Importacao set USO = 777 where USO < 777 and USO4 = 777

	delete from Importacao where uso = 777


*/

