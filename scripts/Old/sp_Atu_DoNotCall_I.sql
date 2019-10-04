USE [PROCON]
GO

/****** Object:  StoredProcedure [dbo].[sp_Atu_DoNotCall_I]    Script Date: 23/07/2019 15:20:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[sp_Atu_DoNotCall_I] 
	@uf as nvarchar(2) 
	
AS
	declare @qtd as numeric(9,0) 
	declare @res as nvarchar(5)

	if( @uf = 'PB' )
	begin
		update ATU_PROCON set obs = 'fone invalido' where ( telefone is null or len(telefone) < 8 )
		update ATU_PROCON set obs = 'fone invalido' where len(telefone) = 9 and substring(telefone ,1,1 ) in ( '1','2','3','4','5','6','7','8' )
		update ATU_PROCON set obs = 'fone invalido' where ( telefone is null or len(telefone) > 11 )

		update ATU_PROCON set ddd = '83' ,fone = telefone where obs is null and len(telefone) in ( 8,9 )
		
		-- gerando ddd e fone a partir de telefone
		update ATU_PROCON set ddd = substring(telefone,1,2) ,fone = substring(telefone,3,len(telefone)) where obs is null and len(telefone) in ( 10 ,11 )

	end else if ( @uf = 'RS' )
	begin
		update ATU_PROCON set obs = 'fone invalido' where ( fone is null or len(fone) < 8 )
		update ATU_PROCON set obs = 'fone invalido' where ( fone is null or len(fone) > 9 )
	end
	else
	begin
		-- marcando os fones com tamanho < 10 e > 11
		update ATU_PROCON set obs = 'fone invalido' where len(telefone) < 10
		update ATU_PROCON set obs = 'fone invalido' where len(telefone) > 11

		-- gerando ddd e fone a partir de telefone
		update ATU_PROCON set ddd = substring(telefone,1,2) ,fone = substring(telefone,3,len(telefone)) where obs is null and len(telefone) in ( 10 ,11 )
		
	end
	

	
	update ATU_PROCON set fone = convert ( nvarchar, convert( bigint ,fone ) ) where obs is null

	update ATU_PROCON set obs = 'fone invalido' where obs is null and len(fone) < 8
	update ATU_PROCON set obs = 'fone invalido' where obs is null and substring(fone,1,1) in ('1')


	-- adicionando 9 digito para os fones com 8 digitos iniciados com 6,7,8,9
	update ATU_PROCON set fone = '9' + fone where obs is null and len(fone) = 8 and substring(fone,1,1) in ('6','7','8','9')


	-- marcando os fones com 9 digitos que nao iniciam com 9
	update ATU_PROCON set obs = 'fone invalido' where obs is null and len(fone) = 9 and substring(fone,1,1) in ('2','3','4','5','6','7','8')


	-- marcando os regs com ddd nao pertencentes a UF ( UFBR )
	update ATU_PROCON set obs = 'ddd invalido' where obs is null and  ddd not in ( select ddd from UFBR where uf = @uf group by ddd )
	
	delete from ATU_PROCON where obs is not null;
	


	-- retirando os fones duplicados de ATU_PROCON
	select * into #tmp from ( select * ,row_number() over(partition by ddd,fone order by ddd,fone) as seq from ATU_PROCON ) as x where seq = 1

	truncate table ATU_PROCON
	insert into ATU_PROCON ( nome ,uf ,telefone ,data ,situacao ,apartirde ,datalimite ,ddd ,fone ,ddd_padrao ) select nome ,uf ,telefone ,data ,situacao ,apartirde ,datalimite ,ddd ,fone ,ddd_padrao from #tmp
	



	-- marcando os fones ja existentes em DoNotCall_UF
	set @res = ''

	if( @uf = 'AL' )
	begin
		update a set a.obs = 'ja existe' 
		from       ATU_PROCON   as a
		inner join DoNotCall_AL as b  on  b.ddd = a.ddd and b.telefone = a.fone

	end else if ( @uf = 'CE' )
	begin
		update a set a.obs = 'ja existe' 
		from       ATU_PROCON   as a
		inner join DoNotCall_CE as b  on  b.ddd = a.ddd and b.telefone = a.fone

	end else if ( @uf = 'ES' )
	begin
		update a set a.obs = 'ja existe' 
		from       ATU_PROCON   as a
		inner join DoNotCall_ES as b  on  b.ddd = a.ddd and b.telefone = a.fone

	end else if ( @uf = 'GO' )
	begin
		update a set a.obs = 'ja existe' 
		from       ATU_PROCON   as a
		inner join DoNotCall_GO as b  on  b.ddd = a.ddd and b.telefone = a.fone		

	end else if ( @uf = 'MG' )
	begin
		update a set a.obs = 'ja existe' 
		from       ATU_PROCON   as a
		inner join DoNotCall_MG as b  on  b.ddd = a.ddd and b.telefone = a.fone

	end else if ( @uf = 'MS' )
	begin
		update a set a.obs = 'ja existe' 
		from       ATU_PROCON   as a
		inner join DoNotCall_MS as b  on  b.ddd = a.ddd and b.telefone = a.fone

	end else if ( @uf = 'PB' )
	begin
		update a set a.obs = 'ja existe' 
		from       ATU_PROCON   as a
		inner join DoNotCall_PB as b  on  b.ddd = a.ddd and b.telefone = a.fone

	end else if ( @uf = 'PR' )
	begin
		update a set a.obs = 'ja existe' 
		from       ATU_PROCON   as a
		inner join DoNotCall_PR as b  on  b.ddd = a.ddd and b.telefone = a.fone

	end else if ( @uf = 'RN' )
	begin
		update a set a.obs = 'ja existe' 
		from       ATU_PROCON   as a
		inner join DoNotCall_RN as b  on  b.ddd = a.ddd and b.telefone = a.fone
		
	end else if ( @uf = 'RS' )
	begin
		update a set a.obs = 'ja existe' 
		from       ATU_PROCON   as a
		inner join DoNotCall_RS as b  on  b.ddd = a.ddd and b.telefone = a.fone
		
	end else if ( @uf = 'SC' )
	begin
		update a set a.obs = 'ja existe' 
		from       ATU_PROCON   as a
		inner join DoNotCall_SC as b  on  b.ddd = a.ddd and b.telefone = a.fone

	end else if ( @uf = 'SP' )
	begin
		update a set a.obs = 'ja existe' 
		from       ATU_PROCON   as a
		inner join DoNotCall_SP as b  on  b.ddd = a.ddd and b.telefone = a.fone

	end else 
	begin
		set @res = 'ERRO UF'
	end
	
	delete from ATU_PROCON where obs is not null
	drop table #tmp

	if @res = ''
	begin

		set @qtd = ( select COUNT(*) as qtd from ATU_PROCON where UF = @uf )
		if @qtd > 0 	
			begin
			
				if( @uf = 'AL' )
				begin
					insert into DoNotCall_AL ( ddd ,telefone ,telbase ,data ) select ddd ,fone ,ddd + fone ,data  from ATU_PROCON where UF = @uf order by id
			
				end else if ( @uf = 'CE' )   -- 23 = yyyy-mm-dd
				begin
					insert into DoNotCall_CE ( ddd ,telefone ,telbase ,data ) select ddd ,fone ,ddd + fone ,convert(nvarchar ,data ,23)       from ATU_PROCON where UF = @uf order by id
				
				end else if ( @uf = 'ES' )   
				begin
					insert into DoNotCall_ES ( ddd ,telefone ,telbase ,data ,evento ) select ddd ,fone ,ddd + fone ,convert(nvarchar ,data ,103) ,situacao from ATU_PROCON where UF = @uf order by id
			
				end else if ( @uf = 'GO' )
				begin
					insert into DoNotCall_GO ( ddd ,telefone ,telbase ,data ) select ddd ,fone ,ddd + fone ,convert(nvarchar ,getdate() ,23)  from ATU_PROCON where UF = @uf order by id
				
				end else if ( @uf = 'MG' )
				begin
					insert into DoNotCall_MG ( ddd ,telefone ,telbase ,data ) select ddd ,fone ,ddd + fone ,convert(nvarchar ,data ,23)  from ATU_PROCON where UF = @uf order by id
				
				end else if ( @uf = 'MS' )   
				begin
					insert into DoNotCall_MS ( nome ,ddd ,telefone ,telbase ,data ,dataLIMITE ,situacao ) select nome ,ddd ,fone ,ddd + fone ,convert(nvarchar ,data ,103) ,convert(nvarchar ,apartirde ,103) ,situacao from ATU_PROCON where UF = @uf order by id
			
				end else if ( @uf = 'PB' )
				begin
					insert into DoNotCall_PB ( ddd ,telefone ,telbase ,data ) select ddd ,fone ,ddd + fone ,convert(nvarchar ,DATA ,23)  from ATU_PROCON where UF = @uf order by id
				
				end else if ( @uf = 'PR' )   
				begin
					insert into DoNotCall_PR ( ddd ,telefone ,telbase ,data ,dataLIMITE ,situacao ) select ddd ,fone ,ddd + fone ,convert(nvarchar ,data ,103) ,convert(nvarchar ,apartirde ,103) ,situacao from ATU_PROCON where UF = @uf order by id
			
				end else if ( @uf = 'RN' )
				begin
					insert into DoNotCall_RN ( ddd ,telefone ,telbase ,data ) select ddd ,fone ,ddd + fone ,convert(nvarchar ,DATA ,23)  from ATU_PROCON where UF = @uf order by id

				end else if ( @uf = 'RS' )
				begin
					insert into DoNotCall_RS ( ddd ,telefone ,telbase ,data ) select ddd ,fone ,ddd + fone ,convert(nvarchar ,DATA ,23)  from ATU_PROCON where UF = @uf order by id

				end else if ( @uf = 'SC' )    -- 103 dd/mm/yyyy
				begin
					insert into DoNotCall_SC ( ddd ,telefone ,telbase ,data ) select ddd ,fone ,ddd + fone ,convert(nvarchar ,data ,103) from ATU_PROCON where UF = @uf order by id
				
				end else if ( @uf = 'SP' )    -- 103 dd/mm/yyyy
				begin
					insert into DoNotCall_SP ( ddd ,telefone ,telbase ,data ,evento ) select ddd ,fone ,ddd + fone ,convert(nvarchar ,data ,23) ,situacao from ATU_PROCON where UF = @uf order by id

				end
			
			end	

		select @qtd
		return

	end
	else
	begin 
		select @res
		return
	end



GO


