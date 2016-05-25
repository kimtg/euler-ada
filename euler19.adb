with Ada.Text_IO;
with Ada.Calendar.Formatting; use Ada.Calendar.Formatting;

procedure Euler19 is
   Count : Natural := 0;
begin
   for Year in 1901 .. 2000 loop
      for Month in 1 .. 12 loop
	 if Day_Of_Week(Time_Of(Year, Month, 1)) = Sunday then
	    Count := Count + 1;
	 end if;
      end loop;
   end loop;
   Ada.Text_IO.Put_Line(Integer'Image(Count));
end;
