with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;

procedure Main is

   can_stop : boolean := false;
   pragma Atomic(can_stop);
   count: Integer := 5;
   task_id: Integer := 0;
   terms: Long_Integer := 0;
   step: Integer := 2;
   --type Delay_Array is array(1..count) of Integer;
   --Delays : Delay_Array := (1, 5, 10);

   task type Stop_Task;
   task type Sum_Task;

   task body Stop_Task is
   begin
      delay 2.0;
      can_stop := true;
   end Stop_Task;

   task body Sum_Task is
      sum : Long_Long_Integer := 0;
   begin
      loop
         exit when can_stop;
         sum := sum + Long_Long_Integer(step);
         terms := terms + 1;
      end loop;
      delay 1.0;
      task_id := task_id + 1;
      Put_Line("Task" & task_id'Img & ": " & "Sum:" & sum'Img & "; " & "Terms:" & terms'Img);
   end Sum_Task;

   stop: Stop_Task;
   threads: array(1..count) of Sum_Task;

begin
   null;
end Main;
