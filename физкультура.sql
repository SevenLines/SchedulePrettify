DECLARE @day int
SELECT @day = 1

SELECT para, fac2 as fac, kurs, aobozn, c
FROM (
	SELECT para, case vf.id_5 when 1 then '�����'
			when 661 then '�����'
			when 4 then '���'
			when 5 then '��'
			when 8 then '����'
			when 9 then '�����'
			when 10 then '��'
			when 144 then '�����'
			when 146 then '�������'
			when 401 then '���'
			when 521 then '�����' end as fac2,  kk.kurs, rtrim(ao.aobozn) as aobozn, 
			(SELECT count(*)
			FROM kontkurs kk2
			LEFT JOIN vacaobozn va ON va.id_6 = kk2.aobozn
			WHERE fac = kk.fac and kurs = kk.kurs and len(va.aobozn) > 2 and right(rtrim(va.aobozn),1) <> '�') as c
	FROM  raspis s
	 LEFT JOIN raspnagr rn ON rn.id_51 = s.raspnagr
	 LEFT JOIN kontkurs kk ON kk.id_1 = rn.kont
	 LEFT JOIN vacaobozn ao ON ao.id_6 = kk.aobozn
	 LEFT JOIN kontgrp kg ON kg.id_7 = rn.kontid
	 LEFT JOIN vacfac vf ON vf.id_5 = kk.fac
	WHERE rn.pred in (
	585, 
	13572, 
	35850, 
	35826
	) and sem = 2 and afobuch = 1 and day = @day
)  t
GROUP BY kurs, fac2, para, aobozn, c
HAVING fac2 is not null
ORDER BY para, kurs, fac2, aobozn
