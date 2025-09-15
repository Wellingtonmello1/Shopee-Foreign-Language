WITH Base AS (
    SELECT 
        grass_date,
        item_id,
        shop_id,
        detected_language,
        name,
        description,
        level1_global_be_category,
        level2_global_be_category,
        Level3_global_be_category
    FROM dev_brbi_listings.foreign_language_items_br_v2
    WHERE date_parse(grass_date, '%Y-%m-%d') 
          BETWEEN DATE_ADD('day', -7, CURRENT_DATE) AND CURRENT_DATE
    AND
level1_global_be_category NOT IN ('Books & Magazine')
    AND 
level2_global_be_category NOT IN ('CD, DVD & Bluray','Vinyl Records','Toys')
    AND 
Level3_global_be_category NOT IN ('Remote Control Toys & Accessories','Dolls & Accessories','Doll Houses & Accessories','Stuffed Toys')

),

filtro_1 as(
        
SELECT 
    grass_date,
    item_id,
    shop_id,
    detected_language,
    name,
    description,
CASE 
    WHEN
         detected_language in ('zh','vi','ja','th') THEN 'Sim'
    WHEN 
        regexp_like(description,'(excelente|perfecto|maravilloso|fantástico|buen|buena|bueno|me gusta|me encanta|recomendable|top|fenomenal|increíble|impecable|súper|genial|me fascina|calidad|calidad precio|malo|mala|pésimo|horrible|defectuoso|problema|no funciona|decepcionante|insatisfecho|error|falla|lento|mal servicio|mal calidad|lo recomiendo|lo mejor|lo peor|envío rápido|atención al cliente|volvería a comprar|no me gustó|muy contento|muy satisfecho|totalmente recomendado|altamente recomendable|excelente servicio)') THEN 'Sim'
    ELSE 'Não'
        END as Action,
    Level1_global_be_category,
    level2_global_be_category,
    Level3_global_be_category
FROM base
)

select
    *
    FROM  filtro_1;
