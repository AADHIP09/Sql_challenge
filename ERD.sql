-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/puVtU6
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "Dept_Num" VARCHAR(10)   NOT NULL,
    "Dept_Name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "Dept_Num"
     )
);

CREATE TABLE "employees" (
    "Employee_Num" INTEGER   NOT NULL,
    "Employee_Title" VARCHAR   NOT NULL,
    "Birth_date" VARCHAR(20)   NOT NULL,
    "First_Name" VARCHAR(20)   NOT NULL,
    "Last_Name" VARCHAR(20)   NOT NULL,
    "Sex" VARCHAR(2)   NOT NULL,
    "Hire_date" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "Employee_Num"
     )
);

CREATE TABLE "dept_emp" (
    "Dept_Num" VARCHAR(10)   NOT NULL,
    "Employee_Num" INTEGER   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "Employee_Num"
     )
);

CREATE TABLE "dept_managers" (
    "Dept_Num" VARCHAR(10)   NOT NULL,
    "Employee_Num" INTEGER   NOT NULL,
    CONSTRAINT "pk_dept_managers" PRIMARY KEY (
        "Employee_Num"
     )
);

CREATE TABLE "salaries" (
    "Employee_Num" INTEGER   NOT NULL,
    "Salary" FLOAT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "Employee_Num"
     )
);

CREATE TABLE "titles" (
    "Title_ID" INTEGER   NOT NULL,
    "Emp_Title" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "Title_ID"
     )
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_Dept_Num" FOREIGN KEY("Dept_Num")
REFERENCES "departments" ("Dept_Num");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_Employee_Num" FOREIGN KEY("Employee_Num")
REFERENCES "employees" ("Employee_Num");

ALTER TABLE "dept_managers" ADD CONSTRAINT "fk_dept_managers_Dept_Num" FOREIGN KEY("Dept_Num")
REFERENCES "departments" ("Dept_Num");

ALTER TABLE "dept_managers" ADD CONSTRAINT "fk_dept_managers_Employee_Num" FOREIGN KEY("Employee_Num")
REFERENCES "employees" ("Employee_Num");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_Employee_Num" FOREIGN KEY("Employee_Num")
REFERENCES "employees" ("Employee_Num");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_Title_ID" FOREIGN KEY("Title_ID")
REFERENCES "employees" ("Employee_Title");

