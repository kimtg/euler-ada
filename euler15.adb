with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Euler15 is
   function To_Integer(C : Character) return Integer is (Character'Pos(C) - Character'Pos('0'));
   
   function To_String(I : Integer) return String is
      S : String := Integer'Image(I);
   begin
      if I >= 0 then
	 return S(2 .. S'Length);
      else
	 return S(1 .. S'Length);
      end if;
   end;
   
   function Digit(A : Unbounded_String; D : Positive) return Natural is
   begin
      if D in 1 .. Length(A) then
	 return To_Integer(Element(A, Length(A) - D + 1));
      else
	 return 0;
      end if;
   end Digit;
   
   function "*"(A : Unbounded_String; B : Natural) return Unbounded_String is
      R : Unbounded_String;
      Carry : Natural := 0;
      S : Natural;
   begin
      for D in 1 .. Length(A) loop
	 S := Carry + Digit(A, D) * B;
	 R := To_String(S mod 10) & R;
	 Carry := S / 10;
      end loop;
      if Carry > 0 then
	 R := To_String(Carry) & R;
      end if;
      return R;
   end "*";
   
   function "/"(A : Unbounded_String; B : Natural) return Unbounded_String is
      R : Unbounded_String;
      Carry : Natural := 0;
      S : Natural;
   begin
      for D in 1 .. Length(A) loop
	 S := Digit(A, Length(A) - D + 1) + Carry * 10;
	 Carry := S mod B;
	 S := S / B;
	 if Length(R) > 0 or else S /= 0 then
	    R := R & To_String(S);
	 end if;
      end loop;
      return R;
   end "/";
   
   P : Unbounded_String := To_Unbounded_String("1");
begin
   -- 40! / 20! / 20!
   -- = 40(39)..21 / 20!
   for I in 21 .. 40 loop
      P := P * I;
      Put_Line("*" & Integer'Image(I) & " => " & To_String(P));
   end loop;
   for I in 1 .. 20 loop
      P := P / I;
      Put_Line("/" & Integer'Image(I) & " => " & To_String(P));
   end loop;
   Put_Line(To_String(P));
end Euler15;
