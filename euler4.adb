with Ada.Text_IO, Ada.Strings.Fixed;
use Ada.Text_IO;

procedure Euler4 is
   function Is_Palindrome(S : String) return Boolean is
   begin
      for I in S'First .. S'Last / 2 loop
	 if S(I) /= S(S'Last - I + 1) then
	    return False;
	 end if;
      end loop;
      return True;
   end;
   
   function Is_Palindrome(N : Integer) return Boolean is
      Temp : Integer := N;
      Reversed : Integer := 0;
   begin
      while Temp > 0 loop
	 Reversed := Reversed * 10 + Temp mod 10;
	 Temp := Temp / 10;
      end loop;
      return N = Reversed;
   end;
   
   Max_P : Integer;
   P : Integer;
begin
   -- string
   Max_P := 0;
   for I in 100 .. 999 loop
      for J in I .. 999 loop
	 P := I * J;
	 if Is_Palindrome(Ada.Strings.Fixed.Trim(Integer'Image(P), Ada.Strings.Left)) and then P > Max_P then
	    Max_P := P;
	 end if;
      end loop;
   end loop;
   Put_Line(Integer'Image(Max_P));
   
   -- math
   Max_P := 0;
   for I in 100 .. 999 loop
      for J in I .. 999 loop
	 P := I * J;
	 if Is_Palindrome(P) and then P > Max_P then
	    Max_P := P;
	 end if;
      end loop;
   end loop;
   Put_Line(Integer'Image(Max_P));
end;
