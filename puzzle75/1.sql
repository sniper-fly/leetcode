create table FiscalYearTable1 (
  fiscal_year INTEGER,
  start_date DATE,
  end_date DATE
);

ALTER TABLE
  FiscalYearTable1
add
  constraint valid_end_date check (
    (
      extract(
        year
        from
          end_date
      ) = fiscal_year
    )
    and (
      extract(
        month
        from
          end_date
      ) = 09
    )
    and (
      extract(
        day
        from
          end_date
      ) = 30
    )
  );

ALTER TABLE
  FiscalYearTable1
add
  constraint valid_start_end check (start_date <= end_date);
