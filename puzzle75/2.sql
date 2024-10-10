CREATE TABLE Absenteeism (
  emp_id INTEGER NOT NULL references Personnel(emp_id),
  absent_date DATE NOT NULL,
  reason_code CHAR (40) NOT NULL references ExcuseList(reason_code),
  severity_points INTEGER NOT NULL CHECK (
    severity_points BETWEEN 0
    AND 4
  ),
  PRIMARY KEY (emp_id, absent_date)
);

INSERT INTO
  Absenteeism
VALUES
  (1, '2007-05-01', 'ずる', 4);

INSERT INTO
  Absenteeism
VALUES
  (1, '2007-05-02', '病気', 2);

INSERT INTO
  Absenteeism
VALUES
  (1, '2007-05-03', '病気', 2);

INSERT INTO
  Absenteeism
VALUES
  (1, '2007-05-05', 'ケガ', 1);

INSERT INTO
  Absenteeism
VALUES
  (1, '2007-05-06', '病気', 3);

INSERT INTO
  Absenteeism
VALUES
  (2, '2007-05-01', 'ずる', 4);

INSERT INTO
  Absenteeism
VALUES
  (2, '2007-05-03', '病気', 2);

INSERT INTO
  Absenteeism
VALUES
  (2, '2007-05-05', 'サボリ', 2);

INSERT INTO
  Absenteeism
VALUES
  (2, '2007-05-06', 'サボリ', 2);

update
  Absenteeism as a1
set
  severity_points = 0,
  reason_code = 'long term illness'
where
  exists (
    select
      *
    from
      (
        select
          *
        from
          Absenteeism
      ) as a2
    where
      a1.emp_id = a2.emp_id
      and a1.absent_date = (a2.absent_date + interval 1 day)
  );

delete from
  Personnel
where
  severity_points;

select
  emp_id
from
  Absenteeism
where
  absent_date BETWEEN current_timestamp - interval 365 day
  and current_timestamp
group by
  emp_id
having
  sum(severity_points) >= 40;
