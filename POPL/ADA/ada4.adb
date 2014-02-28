with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Ada4 is 
	task type Reader;

	task type Writer;
	writing : boolean;
	buff : Array of Integer ()
	protected dataStructure is
		entry Write (Item : Integer);
		entry Read(out Item : Integer);
	private
		data : integer;

	task body Reader is  




