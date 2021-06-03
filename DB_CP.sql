use CP;

#1
select * from Subscriber where street = 'Tatarska';

#2
select * from Worker where post = 'postman';

#3
select s.SubSurname, s.Name, s.IndexPO, s.Street, s.House, s.Flat, s.NumSB 
	from Subscriber s, Catalog c, SignedEdition se
		where c.SurnameSub = s.SubSurname and se.SEIndex = c.IndexSE;
        
#4
select s.SubSurname, s.Name, s.IndexPO, s.Street, s.House, s.Flat, s.NumSB 
	from Subscriber s, SubBox sb
		where sb.SBNum = s.NumSB;
        
#5
select avg(se.SESignTime) as SignTime, avg(se.ReleasePerYear) as ReleasePY
	from Catalog c, SignedEdition se
		where (se.Cost between 50 and 350) and se.SEIndex = c.IndexSE;
        
#6
SELECT w.Name AS 'Name', po.POIndex
FROM postoffice po, worker w
WHERE po.POIndex = w.IndexPO and (w.Salary+w.Commission) > 7500       
UNION 
SELECT w.Name AS 'Name', po.POIndex
FROM postoffice po, worker w
WHERE po.POIndex = w.IndexPO and (w.Salary+w.Commission) < 5500       
ORDER BY Name; 

#7
select count(se.SEIndex) as CIndex, avg(ReleasePerYear) as ReleaseAVG from signededition se
where se.Cost > (select min(se.Cost) from catalog c, signededition se where se.SEIndex = c.IndexSE);

#8
select w1.IndexPO as IndexPO, w1.name as 'Boss', w1.CardNum, 
w.Chief, w.Name AS Subord, w.Post, w.CardNum as SubCard
	from worker w, worker w1
		where w1.CardNum = w.Chief and (w.Hiredate between '1999-10-01' AND '2015-12-31') 
			order by IndexPO, Boss;
            
#9
SELECT Name FROM Worker
WHERE Salary + Commission > (SELECT (Salary + Commission) / 2 
FROM Worker WHERE Name like 'Skalova');

#10
select w.Name as Name
from worker w
join postoffice po on po.POIndex = w.IndexPO
join postoffice p on p.POIndex = w.IndexPO and p.POIndex in('4107', '4119')
group by Name;










