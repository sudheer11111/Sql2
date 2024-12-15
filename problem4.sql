Select d.name as Department, e.name as Employee, e.salary as Salary
From (
    Select name, salary, departmentId, Dense_Rank() Over (Partition by departmentId Order by Salary DESC) as denseRank
    From Employee) AS e
Join Department d
On e.departmentId = d.id
Where e.denseRank <= 3