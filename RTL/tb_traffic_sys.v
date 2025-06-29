`include "traffic_sys.v"

module tb_traffic_sys;

  reg clk, reset, t1, t2, t3, t4;
  wire [2:0] nl, wl, sl, el,count;

  // Instantiate DUT
  traffic_sys dut(
    .north_light(nl), .west_light(wl), .south_light(sl), .east_light(el),
    .clk(clk), .reset(reset), .t1(t1), .t2(t2), .t3(t3), .t4(t4), .count(count)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Stimulus block
  initial begin
    reset = 1;
    t1 = 1; t2 = 1; t3 = 1; t4 = 1;
    #10 reset = 0;

    repeat (10) begin
      // Proper 1-bit random values
      t1 = $random % 2;
      t2 = $random % 2;
      t3 = $random % 2;
      t4 = $random % 2;

      #40; // Wait long enough to observe FSM reaction
    end

    #100;
    $finish;
  end

  // Monitor & Dump
  initial begin
    $monitor($time, "\tt1=%0d\tt2=%0d\tt3=%0d\tt4=%0d\tnl=%0b\twl=%0b\tsl=%0b\tel=%0b\tcount=%0b", 
             t1, t2, t3, t4, nl, wl, sl, el,count);
    $fsdbDumpfile("traffic_sys.fsdb");
    $fsdbDumpvars(0, tb_traffic_sys);
  end

endmodule

