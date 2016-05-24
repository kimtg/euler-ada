with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Ordered_Maps;

procedure Euler14 is
   package Length_Map is new Ada.Containers.Ordered_Maps
     (Long_Long_Integer,Integer);
   
   Lengths : Length_Map.Map;
   
   function Chain_Length(Value : Long_Long_Integer) return Integer is
      Count : Natural := 0;
      V : Long_Long_Integer := Value;
   begin
      loop
	 if V = 1 then
	    Lengths.Insert(Value, Count + 1);
	    return Count + 1;
	 end if;
	 if Lengths.Contains(V) then
	    Lengths.Insert(Value, Count + Lengths.Element(V));
	    return Count + Lengths.Element(V);
	 end if;
	 if V mod 2 = 0 then
	    V := V / 2;
	 else
	    V := 3 * V + 1;
	 end if;
	 Count := Count + 1;
      end loop;
   end Chain_Length;
   
   Max_Length : Natural := 0;
   Result : Natural := 0;
   C : Natural;
begin
   for I in 1 .. 1_000_000 loop
      C := Chain_Length(Long_Long_Integer(I));
      if C > Max_Length then
	 Max_Length := C;
	 Result := I;
      end if;
   end loop;
   Put_Line(Natural'Image(Result) & Natural'Image(Max_Length));
end Euler14;
