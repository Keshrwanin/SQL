-- Assingment --

Create Table EmployeeDetails (EmployeeID int primary Key, FirstName Varchar(Max), LastName Varchar (Max), Salary int, Department Varchar(10), Gender varchar (3))

Create Table ProjectDetails (ProjectDetailID int Primary Key, EmployeeDetailID int, ProjectName Varchar(max))

--- Question 1 ---

Select EmployeeDetails.FirstName, EmployeeDetails.LastName,ProjectDetails.ProjectName from EmployeeDetails
inner join ProjectDetails
on EmployeeDetails.EmployeeID=ProjectDetails.EmployeeDetailID
Order by EmployeeDetails.FirstName

--- Question 2 ---

Select EmployeeDetails.FirstName, EmployeeDetails.LastName,ProjectDetails.ProjectName from EmployeeDetails
inner join ProjectDetails
on EmployeeDetails.EmployeeID=ProjectDetails.EmployeeDetailID
Order by FirstName

--- Question 3 ---

Select ProjectDetails.ProjectName, EmployeeDetails.EmployeeID,EmployeeDetails.FirstName from ProjectDetails
left join EmployeeDetails
On ProjectDetails.EmployeeDetailID=EmployeeDetails.EmployeeID
Order by FirstName

--- Question 4 ---

Select (EmployeeDetails.FirstName +' '+ EmployeeDetails.LastName) as EmpName, ProjectDetails.ProjectName from EmployeeDetails
full join ProjectDetails
On EmployeeDetails.EmployeeID=ProjectDetails.EmployeeDetailID



