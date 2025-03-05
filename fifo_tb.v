//================================================================================================
//					TESTBENCH																	  
//================================================================================================
//Signal Description : 
//						clk  -> 100MHZ
//						reset  -> active high
//						wr_en -> 1bit (write operation when it is high)
//						rd_en -> 1bit (read operation when it is high)
//						data_in -> 8bits 
//						data_out -> 8bits
//						full -> 1bit
//						empty -> 1bit
//						mem -> 8bits width and 16 depth 
//mem is used to store the expected data to compare with the actual data 
//================================================================================================
`timescale 1ns/1ns

module tb;
  
  //declaration with initial values
  reg clk=0,reset=0,wr_en=0,rd_en=0; 
  reg [7:0] data_in=0; 
  
  wire [7:0] data_out;
  wire full,empty;
  
  reg [7:0] mem[16]; 
  integer i = 0,j = 0; 
  integer count=0; //error count during mismatch 
  
  fifo dut (clk,reset,wr_en,rd_en,data_in,data_out,full,empty); //fifo instance
  
  always #5 clk = ~clk; //clock generation 
  
  //writing and reading from the fifo
  initial begin
    reset = 1;
    #10;
    reset = 0;
    repeat(10) begin
      @(posedge clk);
      data_in = $random;
      wr_en = 1;
      mem[i] = data_in;
      i++;
    end
    #5;
    wr_en = 0;
    repeat(11) begin
      @(posedge clk);
      rd_en = 1;
      if(data_out) begin
      	if(data_out == mem[j]) begin
          count = count;
      	end else begin
        	count = count+1;
      	end
      	j++;
      end
    end
    rd_en = 0;
    $finish;
  end
  //printing  TEST pass and failed statements
  final begin
    if(count == 0) begin
      $display("======================================");
      $display("\tTEST PASSED");
      $display("======================================");
    end else begin
      $display("======================================");
      $display("\tTEST FAILED");
      $display("======================================");
    end
  end
  //waveform dumping
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
