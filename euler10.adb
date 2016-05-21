with Ada.Text_IO; use Ada.Text_IO;

procedure Euler10 Is
   function Sum_Prime_Under(N: Integer) return Long_Long_Integer is
      Is_Prime : array (2 .. N - 1) of Boolean := (others => True);
      Sum : Long_Long_Integer := 0;
   begin
      for I in Is_Prime'Range loop
         if Is_Prime(I) then
            Sum := Sum + Long_Long_Integer(I);
            declare
               J : Integer := I * 2;
            begin
               while J <= Is_Prime'Last loop
                  Is_Prime(J) := False;
                  J := J + I;
               end loop;
            end;
         end if;
      end loop;
      return Sum;
   end;

begin
   Put_Line(Long_Long_Integer'Image(Sum_Prime_Under(2_000_000)));
end;
