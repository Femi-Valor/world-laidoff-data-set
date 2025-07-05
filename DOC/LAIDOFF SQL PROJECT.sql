create table layoffs_duplicate
like layoffs;

select *
from layoffs_duplicate;

insert into layoffs_duplicate
select *
from layoffs;

select *, row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) as row_num
from layoffs_duplicate;

with cte_duplicate as
(select *, row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) as row_num
from layoffs_duplicate)
select *
from cte_duplicate
where row_num > 1;

CREATE TABLE `layoffs_duplicate2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs_duplicate2
where row_num > 1;

insert into layoffs_duplicate2
select *, row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) as row_num
from layoffs_duplicate;

delete
from layoffs_duplicate2
where row_num > 1;

select *
from layoffs_duplicate2;
 
select *
from layoffs_duplicate2
where row_num > 1;

select *
from layoffs_duplicate2;

SELECT company, trim(company)
from layoffs_duplicate2;

update layoffs_duplicate2
set company = trim(company);

select location, trim(location)
from layoffs_duplicate2;

update layoffs_duplicate2
set location = trim(location);

select industry
from layoffs_duplicate2
where industry like 'crypto%';

update layoffs_duplicate2
set industry = 'crypto'
where industry like 'Crypto%';

SELECT distinct stage
FROM layoffs_duplicate2;

SELECT distinct country
FROM layoffs_duplicate2;


SELECT distinct country
FROM layoffs_duplicate2
WHERE country LIKE 'united sta%';

update layoffs_duplicate2
set country = 'united states'
where country LIKE 'united sta%';

select `date`
FROM layoffs_duplicate2;

select `date`, 
str_to_date(`date`, '%m/%d/%Y')
FROM layoffs_duplicate2;

update layoffs_duplicate2
set `date` = str_to_date(`date`, '%m/%d/%Y');

alter table layoffs_duplicate2
modify column `date` date;

select *
FROM layoffs_duplicate2
where industry is null or industry = '';

update layoffs_duplicate2
set industry = null
where industry = '';

select t1.industry, t2.industry
from layoffs_duplicate2 t1
join layoffs_duplicate2 t2
on t1.company = t2.company
where t1.industry is null and t2.industry is not null;

update layoffs_duplicate2 t1
join layoffs_duplicate2 t2
on t1.company = t2.company
set t1.industry = t2.industry
where t1.industry is null and t2.industry is not null;

select *
from layoffs_duplicate2
where percentage_laid_off is null and total_laid_off is null;

delete
from layoffs_duplicate2
where percentage_laid_off is null and total_laid_off is null;

select *
from layoffs_duplicate2;

alter table layoffs_duplicate2
drop column row_num;


select year(`date`), sum(total_laid_off)
from layoffs_duplicate2
where year(`date`) is not null
group by year(`date`);

select substring(`date`, 1, 7) as month, sum(total_laid_off) as total_off
from layoffs_duplicate2
where substring(`date`, 1, 7) is not null
group by month
order by 1;

with rolling_data as
(select substring(`date`, 1, 7) as month, sum(total_laid_off) as total_off
from layoffs_duplicate2
where substring(`date`, 1, 7) is not null
group by month
)
select month, total_off, sum(total_off) over(order by month) 
from rolling_data;



select company, substring(`date`, 1, 4) as year, sum(total_laid_off) as total_off
from layoffs_duplicate2
where substring(`date`, 1, 4) is not null
group by company, year
order by 3 desc;

with company_year as
(select company, year(`date`) as years, sum(total_laid_off) as total_off
from layoffs_duplicate2
where year(`date`)   is not null
group by company, year(`date`)),
company_year_rank as
(select *, dense_rank() over (partition by years order by total_off desc) as ranking
from company_year
where years is not null)
select *
from company_year_rank
where ranking <= 5;




