select CODNEG, SUM(VOLTOT) from acoes
group by CODNEG

select REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE
(REPLACE (CODNEG, '0', ''),
'1', ''),
'2', ''),
'3', ''),
'4', ''),
'5', ''),
'6', ''),
'7', ''),
'8', ''),
'9', '') from ACOES


select SETOR, (SELECT SUM(VOLTOT) from ACOES as a2
				INNER join SETORES set2 on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = CODIGO
				where YEAR(DATA)=2019 and set2.SETOR = SETOR
				GROUP BY SETOR
				) from ACOES
INNER join SETORES on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = CODIGO
group by SETOR
ORDER BY SETOR

select SETOR, SUM(VOLTOT) from ACOES
LEFT join SETORES on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = CODIGO
group by SETOR
ORDER BY SUM(VOLTOT) DESC

select SETOR, SUBSETOR, SUM(VOLTOT) from ACOES
LEFT join SETORES on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = CODIGO
group by SETOR, SUBSETOR
ORDER BY SUM(VOLTOT) DESC

select * from SETORES

/*VOLUME POR ANO E POR SETOR*/
select set1.SETOR, (SELECT SUM(VOLTOT) from ACOES
				INNER join SETORES set2 on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = set2.CODIGO
				WHERE set2.SETOR = set1.SETOR and YEAR(DATA)=2019
				) as '2019',
				(SELECT SUM(VOLTOT) from ACOES
				INNER join SETORES set3 on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = set3.CODIGO
				WHERE set3.SETOR = set1.SETOR and YEAR(DATA)=2020
				) as '2020',
				(SELECT SUM(VOLTOT) from ACOES
				INNER join SETORES set4 on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = set4.CODIGO
				WHERE set4.SETOR = set1.SETOR and YEAR(DATA)=2021
				) as '2021' from SETORES set1
				GROUP BY SETOR

/*PREÇO MEDIO POR ANO E POR SETOR*/
select set1.SETOR, (SELECT SUM(PREMED) from ACOES
				INNER join SETORES set2 on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = set2.CODIGO
				WHERE set2.SETOR = set1.SETOR and YEAR(DATA)=2019
				) as '2019',
				(SELECT SUM(PREMED) from ACOES
				INNER join SETORES set3 on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = set3.CODIGO
				WHERE set3.SETOR = set1.SETOR and YEAR(DATA)=2020
				) as '2020',
				(SELECT SUM(PREMED) from ACOES
				INNER join SETORES set4 on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = set4.CODIGO
				WHERE set4.SETOR = set1.SETOR and YEAR(DATA)=2021
				) as '2021' from SETORES set1
				GROUP BY SETOR

/*Preço medio por ano, setor e subsetor*/
select SETOR, SUBSETOR,(SELECT SUM(PREMED)/COUNT(PREMED) from ACOES
				INNER join SETORES set2 on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = set2.CODIGO
				WHERE set2.SUBSETOR = set1.SUBSETOR and set2.SETOR = set1.SETOR and YEAR(DATA)=2019
				) as '2019',
				(SELECT SUM(PREMED)/COUNT(PREMED) from ACOES
				INNER join SETORES set3 on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = set3.CODIGO
				WHERE set3.SUBSETOR = set1.SUBSETOR and set3.SETOR = set1.SETOR and YEAR(DATA)=2020
				) as '2020' from SETORES set1
				GROUP BY SETOR, SUBSETOR

/*Preço medio por ano, setor, subsetor e segmento   -   1 divido pelo outro da a valorizacao/desvalorizacao*/
select SETOR, SUBSETOR, SEGMENTO, (SELECT SUM(PREMED)/COUNT(PREMED) from ACOES
				LEFT join SETORES set2 on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = set2.CODIGO
				WHERE set2.SUBSETOR = set1.SUBSETOR and set2.SETOR = set1.SETOR and set1.SEGMENTO = set2.SEGMENTO and YEAR(DATA)=2019
				) as '2019',
				(SELECT SUM(PREMED)/COUNT(PREMED) from ACOES
				LEFT join SETORES set3 on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = set3.CODIGO
				WHERE set3.SUBSETOR = set1.SUBSETOR and set3.SETOR = set1.SETOR and set1.SEGMENTO = set3.SEGMENTO and YEAR(DATA)=2020
				) as '2020' from SETORES set1
				GROUP BY SETOR, SUBSETOR, SEGMENTO


/*TOP Ações por Setor*/
select SETOR, SUBSETOR, SEGMENTO, CODNEG, NOMRES, SUM(VOLTOT) as VOLUME, 
		(SELECT SUM(PREMED)/COUNT(PREMED) from ACOES ac2
		 where YEAR(DATA)=2019 and ac2.CODNEG = ac1.CODNEG) as 'Preço Medio 2019',
		 (SELECT SUM(PREMED)/COUNT(PREMED) from ACOES ac3
		 where YEAR(DATA)=2020 and ac3.CODNEG = ac1.CODNEG) as 'Preço Medio 2020'  from ACOES ac1
INNER join SETORES on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = CODIGO
group by SETOR, SUBSETOR, SEGMENTO, CODNEG, NOMRES
order by SETOR, SUM(VOLTOT) desc


/*Valorização por setor, subsetor e segmento*/
select CONCAT(SETOR,'-', SUBSETOR, '-', SEGMENTO) 'SEGMENTO', ((SELECT SUM(PREMED)/COUNT(PREMED) from ACOES
				INNER join SETORES set2 on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = set2.CODIGO
				WHERE set2.SUBSETOR = set1.SUBSETOR and set2.SETOR = set1.SETOR and set2.SEGMENTO = set1.SEGMENTO and YEAR(DATA)=2020
				)-
				(SELECT SUM(PREMED)/COUNT(PREMED) from ACOES
				INNER join SETORES set3 on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = set3.CODIGO
				WHERE set3.SUBSETOR = set1.SUBSETOR and set3.SETOR = set1.SETOR and set3.SEGMENTO = set1.SEGMENTO and YEAR(DATA)=2019
				))/(SELECT SUM(PREMED)/COUNT(PREMED) from ACOES
				INNER join SETORES set4 on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = set4.CODIGO
				WHERE set4.SUBSETOR = set1.SUBSETOR and set4.SETOR = set1.SETOR and set4.SEGMENTO = set1.SEGMENTO and YEAR(DATA)=2019
				) as 'Valorização'from SETORES set1
				GROUP BY SETOR, SUBSETOR, SEGMENTO
				ORDER BY 'Valorização'

/*Valorização por setor*/
select SETOR, ((SELECT SUM(PREMED)/COUNT(PREMED) from ACOES
				INNER join SETORES set2 on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = set2.CODIGO
				WHERE set2.SETOR = set1.SETOR and YEAR(DATA)=2020
				)-
				(SELECT SUM(PREMED)/COUNT(PREMED) from ACOES
				INNER join SETORES set3 on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = set3.CODIGO
				WHERE set3.SETOR = set1.SETOR and YEAR(DATA)=2019
				))/(SELECT SUM(PREMED)/COUNT(PREMED) from ACOES
				INNER join SETORES set4 on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = set4.CODIGO
				WHERE set4.SETOR = set1.SETOR and YEAR(DATA)=2019
				) as 'Valorização'from SETORES set1
				GROUP BY SETOR
				ORDER BY 'Valorização'

/*Valorização por subsetor*/
select SUBSETOR, ((SELECT SUM(PREMED)/COUNT(PREMED) from ACOES
				INNER join SETORES set2 on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = set2.CODIGO
				WHERE set2.SUBSETOR = set1.SUBSETOR and set2.SETOR = set1.SETOR and YEAR(DATA)=2020
				)-
				(SELECT SUM(PREMED)/COUNT(PREMED) from ACOES
				INNER join SETORES set3 on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = set3.CODIGO
				WHERE set3.SUBSETOR = set1.SUBSETOR and set3.SETOR = set1.SETOR and YEAR(DATA)=2019
				))/(SELECT SUM(PREMED)/COUNT(PREMED) from ACOES
				INNER join SETORES set4 on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = set4.CODIGO
				WHERE set4.SUBSETOR = set1.SUBSETOR and set4.SETOR = set1.SETOR and YEAR(DATA)=2019
				) as 'Valorização'from SETORES set1
				GROUP BY SETOR, SUBSETOR
				ORDER BY 'Valorização'

/*Valorização por segmento*/
select SEGMENTO, ((SELECT SUM(PREMED)/COUNT(PREMED) from ACOES
				INNER join SETORES set2 on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = set2.CODIGO
				WHERE set2.SUBSETOR = set1.SUBSETOR and set2.SETOR = set1.SETOR and set2.SEGMENTO = set1.SEGMENTO and YEAR(DATA)=2020
				)-
				(SELECT SUM(PREMED)/COUNT(PREMED) from ACOES
				INNER join SETORES set3 on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = set3.CODIGO
				WHERE set3.SUBSETOR = set1.SUBSETOR and set3.SETOR = set1.SETOR and set3.SEGMENTO = set1.SEGMENTO and YEAR(DATA)=2019
				))/(SELECT SUM(PREMED)/COUNT(PREMED) from ACOES
				INNER join SETORES set4 on REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (CODNEG, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '') = set4.CODIGO
				WHERE set4.SUBSETOR = set1.SUBSETOR and set4.SETOR = set1.SETOR and set4.SEGMENTO = set1.SEGMENTO and YEAR(DATA)=2019
				) as 'Valorização'from SETORES set1
				GROUP BY SETOR, SUBSETOR, SEGMENTO
				ORDER BY 'Valorização'


				

				select CODNEG, ((select SUM(PREMED)/COUNT(PREMED) from ACOES ac2
								where ac2.CODNEG = ac1.CODNEG and YEAR(DATA)=2020)-
								(select SUM(PREMED)/COUNT(PREMED) from ACOES ac2
								where ac2.CODNEG = ac1.CODNEG and YEAR(DATA)=2019))/
								(select SUM(PREMED)/COUNT(PREMED) from ACOES ac2
								where ac2.CODNEG = ac1.CODNEG and YEAR(DATA)=2019) as 'Valorização' from ACOES ac1
				WHERE 'Valorização' is NOT NULL
				GROUP BY CODNEG
				ORDER BY 'Valorização' DESC


				select * from acoes where CODNEG='IBOV11'

				select * from setores order by codigo