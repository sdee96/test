select *from usertbl;
select cast(avg(height)  as signed integer) from usertbl;
select cast('2024@05@08' as date);


select *, if(height>=170,'170이상','170이하') from usertbl;

set @var1='this is';
set @var2='concat test';
select concat(@var1,'=', @var2) as 'this is concattest';

select *from usertbl;
select cast(avg(height) as signed integer) from usertbl;
select concat_ws("|",@var1,@var2);  -- concat ws  삽입할 문자열 지정을 먼저

select curdate();
select replace(curdate(),'-','#');
select replace(curtime(),':','|');
select concat(replace(curdate(),'-','#'),'   ', replace(curtime(),':','|'));

set @sd = 3;
prepare sd01     -- prepare from 이 두개가 한 세트 execute 실행 using 
from 'select *from usertbl order by height limit ?' ;
execute sd01 using @sd;     -- select *from usertbl order by height limit3(@sd);

