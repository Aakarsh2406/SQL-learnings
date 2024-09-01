-- create or replace table icc_world_cup
-- (
-- Team_1 Varchar(20),
-- Team_2 Varchar(20),
-- Winner Varchar(20)
-- );
-- INSERT INTO icc_world_cup values('India','SL','India');
-- INSERT INTO icc_world_cup values('SL','Aus','Aus');
-- INSERT INTO icc_world_cup values('SA','Eng','Eng');
-- INSERT INTO icc_world_cup values('Eng','NZ','NZ');
-- INSERT INTO icc_world_cup values('Aus','India','India');



select a.teamname, count(1) as matches_played ,sum(win_flag) as wincount, count(1)- sum(win_flag) as lose_count from (

select team_1 as teamname, case when team_1 = winner then 1 else 0 end as win_flag from icc_world_cup
union all
select team_2 as teamname, case when team_2 = winner then 1 else 0 end as win_flag from icc_world_cup
)a
group by teamname;

