with markup as (
    select *,
    first_value(customer_id)
    over(partition by company_name, contact_name order by company_name
    rows between unbounded preceding and unbounded following) as result
    from {{source('sources','customers')}}
), removed as (
    select distinct result from markup
), final as (
    select * from {{source('sources','customers')}} where customer_id in (select result from removed)
)
select * from final
    
-- source é o arquivo source.yml que é a referencia do DW redshift, o primeiro parametro é do - name: sources do arquivo source.yml e o segundo o nome da tabela. 
-- este arquivo irá gerar uma tabela sql que passará a ser uma ref.
--select * from {{source('sources','customers')}}