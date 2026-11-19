# code for tbff_t.v
  ...
      module tbff_t();

   //Testbench global variables
   reg clk,rst,tin;
   wire t,tb;

   //Step1 : Define a parameter with name "CYCLE" which is equal to 10
        parameter CYCLE=10;
   //Step2 : Instantiate the design
        tff DUT(tin,clk,rst,t,tb);
   //Understand the clock generation logic
   always
      begin
         #(CYCLE/2);
         clk = 1'b0;
         #(CYCLE/2);
         clk=~clk;
      end

   //Initializing task
      task initialize();
              begin
                      {tin}=0;
              end
      endtask

   //Reset task
   task rst_dut();
      begin
         @(negedge clk);
         rst=1'b1;
         @(negedge clk);
         rst=1'b0;
      end
   endtask

   //Data task
   task ta(input i);
      begin
         @(negedge clk);
         tin=i;
 end
   endtask

   //Process that generates stimulus by call by value method
   initial
   begin
        //ta(0);
         initialize;
         rst_dut;
         ta(0);
         ta(1);
         ta(0);
         ta(1);
         ta(1);
         rst_dut;
         ta(0);
         ta(1);
         #10;
         $finish;
      end

   //Step3 : Use $monitor to display the various inputs and outputs
   initial
           $monitor("values of clk=%b     rst=%b,tin=%b    t=%b,tb=%b",clk,rst,tin,t,tb);

   //Waveform dump
     /*initial
    begin
     $fsdbDumpvars(0,dff_tb);
    end*/


  endmodule
...
