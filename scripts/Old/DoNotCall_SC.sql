	-- SC

	use procon
	
		select ddd from UFBR where uf = 'SC' group by ddd -- 42,47,48,49
		select * from ATU_PROCON 
		select * from ATU_PROCON where len(telefone) = 8
		select * from ATU_PROCON where len(telefone) = 9
		select * from ATU_PROCON where len(telefone) < 10
		select * from ATU_PROCON where len(telefone) > 11

	-- marcando os fones com tamanho < 10 e > 11
	update ATU_PROCON set obs = 'fone invalido' where ( telefone is null or len(telefone) < 10 );
	update ATU_PROCON set obs = 'fone invalido' where ( telefone is null or len(telefone) > 11 );


	-- gerando ddd e fone a partir de telefone
	update ATU_PROCON set ddd = substring(telefone,1,2) ,fone = substring(telefone,3,len(telefone)) where obs is null and len(telefone) in ( 10 ,11 );
	
	update ATU_PROCON set fone = convert ( nvarchar, convert( bigint ,fone ) ) where obs is null

	update ATU_PROCON set obs = 'fone invalido' where obs is null and Len(fone) < 8;
	update ATU_PROCON set obs = 'fone invalido' where obs is null and substring(fone,1,1) in ('1');



	-- adicionando 9 digito para os fones com 8 digitos iniciados com 6,7,8,9
	update ATU_PROCON set fone = '9' + fone where obs is  null and len(fone) = 8 and substring(fone,1,1) in ('6','7','8','9');


	-- marcando os fones com 9 digitos que nao iniciam com 9
	update ATU_PROCON set obs = 'fone invalido' where obs is null and len(fone) = 9 and substring(fone,1,1) in ('2','3','4','5','6','7','8')


	-- marcando os regs com ddd nao pertencentes a UF ( UFBR )
	update ATU_PROCON set obs = 'ddd invalido' where obs is null and  ddd not in ( select ddd from UFBR where uf = 'SC' group by ddd )
	
	delete from ATU_PROCON where obs is not null;
	

	-- retirando os fones duplicados de ATU_PROCON
	select * into #tmp from ( 
		select * ,row_number() over(partition by ddd,fone order by ddd,fone) as seq from ATU_PROCON 
							  ) as x where seq = 1

	truncate table ATU_PROCON;
	insert into ATU_PROCON ( nome ,uf ,telefone ,data ,situacao ,apartirde ,datalimite ,ddd ,fone ,ddd_padrao )
			          select nome ,uf ,telefone ,data ,situacao ,apartirde ,datalimite ,ddd ,fone ,ddd_padrao from #tmp;

	drop table #tmp;


	-- marcando os fones ja existentes em DoNotCall_UF
	update a set a.obs = 'ja existe' 
	from         ATU_PROCON  as a
	inner join DoNotCall_SC  as b  on  b.ddd = a.ddd and b.telefone = a.fone;

	delete from ATU_PROCON where obs is not null;

	select * from ATU_PROCON 


	-- incluindo em DoNotCall_UF
	insert into DoNotCall_SC ( ddd ,telefone ,telbase ,data ) 
	select ddd ,fone ,ddd + fone ,convert(nvarchar ,data ,103)  from ATU_PROCON order by id


		select top 5 * from ATU_PROCON 
		select top 5 * from DoNotCall_SC order by codcall desc 


	select * into #dupl from ( 
		select * ,row_number() over(partition by telbase order by telbase) as seq from DoNotCall_SC 
							  ) as x where seq > 1

