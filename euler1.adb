with Ada.Text_IO;

procedure euler1 is
   sum: Integer := 0;
begin
   for i in 1 .. 999 loop
      if i mod 3 = 0 or else i mod 5 = 0 then
         sum := sum + i;
      end if;
   end loop;
   Ada.Text_IO.Put_Line(Integer'Image(sum));
end euler1;