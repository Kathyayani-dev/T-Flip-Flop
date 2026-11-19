# code for tff.v
  ...
     module  tff(tin,clk,rst,t,tb);
        input tin,clk,rst;
        output t;
        output tb;

        wire w;

        dff D1(.d(w),.clk(clk),.reset(rst),.q(t),.qb(tb));
       xor x1(w,t,tin);
       // assign w=t^tin;
                //  assign tb=~t;
        endmodule
...
