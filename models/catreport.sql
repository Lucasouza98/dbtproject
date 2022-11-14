-- Aqui são feitos a configurações entre chaves pois não é executado como SQL
-- materialized: ephemeral não cria tabela nem view, somente como modelo pode-se usar como ref em outros modelos.
-- materialized: view criará uma view no banco
-- materialized: incremental será criado uma tabela e fará cargas incrementais.
-- materialized: table criará tabela no banco
{{
    config(
        materialized='incremental',
        unique_key='category_id'
    )
}}

select * from {{source('sources','categories')}}