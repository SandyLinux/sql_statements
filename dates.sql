-- get the first day of certain month

set @intervalss = dayofmonth(current_date()) - 1;
-- select @intervalss;

select date_sub(current_date(), interval @intervalss day );