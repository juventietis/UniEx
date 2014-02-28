with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Ada3 is

  task type Writers;

  task type Readers;

  W : array (1..10) of Writers;
  R : array (1..10) of Readers;

  Buffer_Size : constant := 5;
  type index is mod Buffer_Size;
  type Buff is array (index) of integer;

  protected Buffer is
    entry Place (Item : integer);
    entry Take (Item : out integer);
  private
    First : index := index'first;
    Last : index := index'last;
    Num : integer := 0;
    Buf : Buff;
  end Buffer;

  task body Writers is
  begin
    for I in 1..4 loop
      Buffer.Place(I);
    end loop;
  end Writers;

  task body Readers is
    J : integer;
  begin
    for I in 1 ..4 loop
      Buffer.Take(J);
      put(J); 
    end loop;
  end Readers;

  protected body Buffer is
    entry Place (Item : integer) when Num < Buffer_Size is
    begin
      Last := Last + 1;
      Buf(Last) := Item;
      Num := Num + 1;
    end Place;

    entry Take (Item : out integer) when Num > 0 is
    begin
      Item := Buf(First);
      First := First + 1;
      Num := Num - 1;
    end take;
  end Buffer;
begin
  null;
end Ada3;

