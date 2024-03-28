Use Project_Nikhil
Select * from Team1

Create table EmployeeDetails_1 (EmpID int, FullName varchar (max), ManagerId varchar (Max), DateOfJoining Date, City varchar (max))
Create Table EmployeeSalary (EmpId int, Project Varchar (Max), Salary Varchar (Max), Variable int)

Alter table EmployeeSalary
alter column Salary Int

Select * from EmployeeSalary
Select * from EmployeeDetails_1

-- Q1 --
Select EmployeeDetails_1.EmpID, EmployeeDetails_1.FullName from EmployeeDetails_1
where ManagerId=986

-- Q2--
Select distinct(Project) from EmployeeSalary

-- Q3--
Select COUNT(*) from EmployeeSalary
where EmployeeSalary.Project='P1'

-- Q4--
Select MAX(Salary), MIN(Salary), AVG(Salary) from EmployeeSalary
Select avg(salary) from EmployeeSalary

-- Q5--
Select EmployeeSalary.EmpId from EmployeeSalary
Where Salary between 9000 and 15000

-- Q6--
Select * from EmployeeDetails_1
Select FullName, City,ManagerId from EmployeeDetails_1
Where City='Toronto' and ManagerId=321

--Q7--
Select FullName, City,ManagerId from EmployeeDetails_1
Where City='california' or ManagerId=321

-- Q8--
Select * from EmployeeSalary
Select fullName from EmployeeDetails_1
inner join EmployeeSalary
on EmployeeDetails_1.EmpID=EmployeeSalary.EmpId
Where EmployeeSalary.Project<>'P1'




