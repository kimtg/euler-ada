with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Euler16 is
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
   
   P : Unbounded_String := To_Unbounded_String("2");
   Sum : Natural := 0;
begin
   for I in 2 .. 1000 loop
      P := P * 2;
      Put_Line(To_String(I) & ": " & To_String(P));
   end loop;
   for I in 1 .. Length(P) loop
      Sum := Sum + Digit(P, I);
   end loop;
   Put_Line(To_String(Sum));
end Euler16;
