with calc_employees as (
    select 
    date_part(year,current_date) - date_part(year,birth_date) as age,
    date_part(year,current_date) - date_part(year,hire_date) as lengthofservice ,
    first_name ||' '|| last_name as name, 
    employee_id,
    last_name,
    first_name,
    title,
    title_of_courtesy,
    birth_date,
    hire_date,
    address,
    city,
    region,
    postal_code,
    country,
    home_phone,
    extension,
    notes,
    reports_to,
    photo_path,
    salary
    from {{source('sources','employees')}}
)

select * from calc_employees