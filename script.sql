DECLARE @day int
SELECT @day = 3

SELECT para, fac2 as fac, kurs
FROM (
SELECT para, case vf.id_5 when 1 then '�����'
		when 661 then '�����'
		when 4 then '����'
		when 5 then '�����'
		when 8 then '����'
		when 9 then '�����'
		when 10 then '�����'
		when 144 then '�����'
		when 146 then '�������'
		when 220 then '��'
		when 401 then '���'
		when 521 then '�����' end as fac2,  kk.kurs
FROM  raspis s
 LEFT JOIN raspnagr rn ON rn.id_51 = s.raspnagr
 LEFT JOIN kontkurs kk ON kk.id_1 = rn.kont
 LEFT JOIN kontgrp kg ON kg.id_7 = rn.kontid
 LEFT JOIN vacfac vf ON vf.id_5 = kk.fac
WHERE rn.pred in (13572) and sem = 1 and afobuch = 1 and day = @day )  t
GROUP BY kurs, fac2, para
ORDER BY para, kurs, fac2
