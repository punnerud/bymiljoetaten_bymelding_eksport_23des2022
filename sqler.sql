## Telling per ormåde i Oslo ##

select p.Omrade, substr(b.melding_opprettetdato,1,4) as aar, b.meldingstype_navn,
count(*) from bymelding b
left join postnummer p on p.postnummer =  upper(substr(b.adresse,-9,10))
where b.meldingsstatus_navn like 'Arbeid utført'
group by p.Omrade, substr(b.melding_opprettetdato,1,4), b.meldingstype_navn
order by p.Omrade asc, substr(b.melding_opprettetdato,1,4) desc, count(*) desc
;

