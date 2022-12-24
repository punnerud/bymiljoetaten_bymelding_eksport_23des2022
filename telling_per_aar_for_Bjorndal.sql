select substr(b.melding_opprettetdato,1,4) as aar,meldingsstatus_navn as status, meldingstype_navn as type,
meldingstype_beskrivelse as beskrivelse, count(*) as antall,
((count(*)*100)/(select count(*) from bymelding b2
where 
59.83885581521323 > b2.breddegrad and 
10.82528077510494 < b2.lengdegrad and
59.816294202335136 < b2.breddegrad and 
10.846824276909016 > b2.lengdegrad and 
substr(b2.melding_opprettetdato,1,4) = substr(b.melding_opprettetdato,1,4) --Samme år
)) as prosent
--,b.*
from bymelding b
where 
59.83885581521323 > breddegrad and 
10.82528077510494 < lengdegrad and
59.816294202335136 < breddegrad and 
10.846824276909016 > lengdegrad
group by substr(b.melding_opprettetdato,1,4), meldingsstatus_navn, meldingstype_navn, meldingstype_beskrivelse
order by substr(b.melding_opprettetdato,1,4) desc, count(*) desc
--limit 50