
USE [NET_2013]

	update Cadastro_new set USO2 = 777 where uso2 < 10 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) 
	update Cadastro_new set USO3 = 777 where uso3 < 10 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) 
	update Cadastro_new set USO1 = 777 where uso1 < 10 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) 
	update Cadastro_new set USO4 = 777 where uso4 < 10 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) 
	

	update Cadastro_new set USO = 777 where USO < 777 and USO1 = 777;
	update Cadastro_new set USO = 777 where USO < 777 and USO2 = 777;
	update Cadastro_new set USO = 777 where USO < 777 and USO3 = 777;
	update Cadastro_new set USO = 777 where USO < 777 and USO4 = 777;
	update Cadastro_new set USO = 777 where USO < 777 and USO1 > 100 and USO2 > 100 and USO3 > 100 and USO4 > 100 ;


--  DELETE FROM Cadastro_new WHERE USO = 777

	select origem ,count(*) qtd from cadastro_new where uso = 777 group by origem order by origem 
		select uso ,count(*) from cadastro_new where origem = 'BASE_PARA_O_CHAT' group by uso order by uso 
		select resultado ,count(*) from cadastro_new where origem = 'BASE_PARA_O_CHAT' and uso = 777 group by resultado order by resultado 
			update cadastro_new set uso1 = 0,uso = 0 where uso = 777 and origem = 'BASE_PARA_O_CHAT' and resultado is null 
			update cadastro_new set uso1 = 8,uso = 8 where uso = 777 and origem = 'BASE_PARA_O_CHAT' and resultado in ('OC', 'NA')
			update cadastro_new set uso1 = 9,uso = 9 where uso = 777 and origem = 'BASE_PARA_O_CHAT' and resultado in ('CREDITO REPROVADO', 'OK')




	delete from agenda     where ID in ( select codigo from Cadastro_new where USO = 777 and origem not in ( 'BASE_PARA_O_CHAT' ) )
	delete from agenda_mob where ID in ( select codigo from Cadastro_new where USO = 777 and origem not in ( 'BASE_PARA_O_CHAT' ) )


	delete from aux_tel_pred where codigo in ( select codigo from Cadastro_new where USO = 777 )
	update tab_d1_robo    set lido = 1  where lido = 0  and codigo in ( select codigo from Cadastro_new where USO = 777 )
	update tab_d3_cadoper set uso = 777 where uso < 100 and codigo in ( select codigo from Cadastro_new where USO = 777 )

--	select origem ,count(*) from Cadastro_new where uso = 777 group by origem order by origem

		insert into Trabalhados_new select * from Cadastro_new where uso = 777;
		delete from Cadastro_new where uso = 777;
   
   
-- ============================================================================================================================
-- Cad_Ura      select count(*) from cad_ura  854.778

	update Cad_Ura set USO1 = 777 where uso1 < 10 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) ;
	update Cad_Ura set USO2 = 777 where uso2 < 10 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) ;
	update Cad_Ura set USO3 = 777 where uso3 < 10 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) ;
	update Cad_Ura set USO4 = 777 where uso4 < 10 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) ;

	update Cad_Ura set USO = 777 where USO < 777 and USO1 = 777
	update Cad_Ura set USO = 777 where USO < 777 and USO2 = 777
	update Cad_Ura set USO = 777 where USO < 777 and USO3 = 777
	update Cad_Ura set USO = 777 where USO < 777 and USO4 = 777
	update Cad_Ura set USO = 777 where USO < 777 and USO1 > 100 and USO2 > 100 and USO3 > 100 and USO4 > 100 

	select origem ,count(*) from cad_ura where uso = 777 group by origem order by origem
		select * from cad_ura where uso = 777 and origem = 'URA_NET_2_SILVIA' order by fone1
	
	delete from aux_tel_pred where codigo in ( select codigo from Cad_Ura where USO = 777 );
	delete from Cad_Ura where USO = 777 ;

	
-- ============================================================================================================================
-- Importacao

	update Importacao set USO1 = 777 where uso1 < 10 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) 
	update Importacao set USO2 = 777 where uso2 < 10 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) 
	update Importacao set USO3 = 777 where uso3 < 10 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) 
	update Importacao set USO4 = 777 where uso4 < 10 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) 

	update Importacao set USO = 777 where USO < 777 and USO1 = 777
	update Importacao set USO = 777 where USO < 777 and USO2 = 777
	update Importacao set USO = 777 where USO < 777 and USO3 = 777
	update Importacao set USO = 777 where USO < 777 and USO4 = 777
	update Importacao set USO = 777 where USO < 777 and USO1 > 100 and USO2 > 100 and USO3 > 100 and USO4 > 100 

	delete from aux_tel_pred where codigo in ( select codigo from Importacao where USO = 777 )
	delete from Importacao where USO = 777 

-- ============================================================================================================================
-- Trabalhados_New

	update Trabalhados_New set USO1 = 777 where uso1 <> 777 and fone1 is not null and CAST( DDD1 as nvarchar(2) ) + cast( FONE1 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) 
	update Trabalhados_New set USO2 = 777 where uso2 <> 777 and fone2 is not null and CAST( DDD2 as nvarchar(2) ) + cast( FONE2 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) 
	update Trabalhados_New set USO3 = 777 where uso3 <> 777 and fone3 is not null and CAST( DDD3 as nvarchar(2) ) + cast( FONE3 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) 
	update Trabalhados_New set USO4 = 777 where uso4 <> 777 and fone4 is not null and CAST( DDD4 as nvarchar(2) ) + cast( FONE4 as nvarchar(10) ) in ( select TelBase from Procon.dbo.donotcall ) 

	update Trabalhados_New set USO = 777 where USO < 777 and USO1 = 777
	update Trabalhados_New set USO = 777 where USO < 777 and USO2 = 777
	update Trabalhados_New set USO = 777 where USO < 777 and USO3 = 777
	update Trabalhados_New set USO = 777 where USO < 777 and USO4 = 777
	update Trabalhados_New set USO = 777 where USO < 777 and USO1 > 100 and USO2 > 100 and USO3 > 100 and USO4 > 100 
	
-- ========================================================================================================================
