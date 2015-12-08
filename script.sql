DECLARE @day int
SELECT @day = 3

SELECT para, fac2 as fac, kurs
FROM (
SELECT para, case vf.id_5 when 1 then 'ÈÀÌèÒ'
		when 661 then 'ÈÏÈèÁ'
		when 4 then 'Íåäğ'
		when 5 then 'Êèáåğ'
		when 8 then 'ÈÀèÑ'
		when 9 then 'Õèìèê'
		when 10 then 'İíåğã'
		when 144 then 'ÈİÓèÏ'
		when 146 then 'ÈÈÈèÑÃÍ'
		when 220 then 'Èİ'
		when 401 then 'ÔÒÈ'
		when 521 then 'ÌĞÖÏÊ' end as fac2,  kk.kurs
FROM  raspis s
 LEFT JOIN raspnagr rn ON rn.id_51 = s.raspnagr
 LEFT JOIN kontkurs kk ON kk.id_1 = rn.kont
 LEFT JOIN kontgrp kg ON kg.id_7 = rn.kontid
 LEFT JOIN vacfac vf ON vf.id_5 = kk.fac
WHERE rn.pred in (13572) and sem = 1 and afobuch = 1 and day = @day )  t
GROUP BY kurs, fac2, para
ORDER BY para, kurs, fac2
