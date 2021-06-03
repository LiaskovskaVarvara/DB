use db_lab3;

#1
SELECT Name, Hiredate-(Salary/Commission) AS Expression
FROM TEACHER;

#2
SELECT d.Name, l.RomNoFK
	FROM Department d, Lecture l, Teacher t
		WHERE d.DepNoPK = t.DepNoFK AND t.TchNoPK = l.TchNoFK 
			AND(l.Type = 'lecture')AND(l.Day = 'Mon')AND(l.Week = 1);
        
#3       
SELECT DISTINCT f.Name
	FROM Faculty f, Department d, Teacher t
		WHERE f.FacNoPK = d.FacNoFK AND d.DepNoPK = t.TchNoPK 
			AND t.DepNoFK = d.Name = 'Engineering Software';        

#4       
SELECT d.Name
	FROM Faculty f, Department d, Teacher t
		WHERE f.Name = 'FCCSE' AND d.HeadFK = t.TchNoPK and t.ChiefFK = t.TchNoPK
			AND (t.Hiredate BETWEEN '2001-10-01' AND '2010-12-31');
        
#5       
SELECT f.Name, t.Name
	FROM Faculty f, Department d, Teacher t
		WHERE (f.FacNoPK = d.FacNoFK AND d.DepNoPK = t.DepNoFK 
			AND t.Hiredate IN('2000-02-01','2000-03-01','2000-04-01','2000-05-01'))
			OR (t.Salary BETWEEN 500.00 AND 800.00);
            
#6           
SELECT f1.Name AS Fund1, f1.Fund, f2.Name AS Fund2, f2.Fund
	FROM Faculty f1
		LEFT JOIN Faculty f2
			ON f1.Fund > f2.Fund + 1000;
        		       
#7             
SELECT DISTINCT sg.GrpNoPK, sg.Rating
	FROM SGroup sg, Faculty f
		WHERE NOT((f.Name = 'FCCSE' AND sg.Course != 5)
		OR ((f.Fund BETWEEN 150000 AND 300000) AND sg.Rating > 40)
		OR (f.Fund > 200000 AND (sg.Rating BETWEEN 20 AND 50))
		);
        
#1a
select concat('На курсі',course,'Є група',num,'У якій рейтинг',Quantity)as 'Відомості про групу 'from sgroup;

#1b
select 
  'На курсі' as 'Константа 1',
    course as 'курс',
    'Є група' as 'Константа 2',
    num as  'група',
    'У якій рейтинг' as 'Константа 3',
    Quantity as 'Рейтинг' 
    from sgroup;
    
#2
SELECT s.Num as 'Номер групи', r.Num as 'Номер аудиторії', r.Building as 'Корпус', t.Name 'Назви викладачів' 
  FROM sgroup s, room r, teacher t, lecture l
    WHERE t.TchNoPK = l.TchNoFK and s.GrpNoPK = l.GrpNoFK and r.RomNoPK = l.RomNoFK and
        l.SbjNoFK = 1 and t.DepNoFK = 1;
                
                
#3 
SELECT t1.name as 'Декан'
  FROM teacher t1, teacher t2, department d
    WHERE UPPER (t2.name) like 'Pisarchuk%' and t1.post = 'professor'
      and d.HeadFK = t1.TchNoPK;
          
#4
select d.name'Кафедри'
  FROM department d,teacher t ,faculty f
    where f.name = 'FCCSE' and t.DepNoFK = d.DepNoPK and t.post = 'docent' 
		and ((t.Salary+t.Commission) between 2500 and 3000);

#5
select distinct d.name'Кафедри'
  from department d, teacher t, faculty f, sgroup s
    where t.DepNoFK = d.DepNoPK and t.TchNoPK in 
    (select t.TchNoPK 
		from teacher t, sgroup s 
			where s.Curator = t.TchNoPK and UPPER (s.Num) like '3%');
    

#6
SELECT f1.Name AS Fund1, f1.Fund, f2.Name AS Fund2, f2.Fund
  FROM Faculty f1
    LEFT JOIN Faculty f2
      ON f1.Fund > f2.Fund + 1000;
      
#7
SELECT distinct sj.name 
	FROM Subject sj, Teacher t, Lecture l, Department d, Room r 
		WHERE NOT ((t.depnofk = d.depnopk AND (d.depnopk = 1 OR d.depnopk = 2)) 
        AND ((r.num = 313 and r.building = 6) or (r.num = 202 and r.building = 5))
			AND ((l.day = 'mon' and l.week = 1) or l.day = 'wed' and l.week = 2));











