//================================================================================================
//                                  FIFO MODULE DEFINITION								  
//================================================================================================
module fifo
  (input wire clk,
   input wire reset,//active high asynchronous reset
   input wire wr_en, //write enable
   input wire rd_en, //read enable
   input  [7:0]data_in, //8bit input data
   output reg [7:0]data_out, //8bit output data
   output wire full, //fifo full
   output wire empty); //fifo empty
  
  parameter DEPTH=16; 
  reg[7:0] mem[0:DEPTH-1];
  reg[3:0] wr_ptr; //write pointer
  reg[3:0] rd_ptr; //read pointer 
  reg[4:0] count;
  
  always@(posedge clk or posedge reset)
    begin
      
      if(reset)begin
        data_out <= 8'b0000_0000;
        wr_ptr<=0;
        rd_ptr<=0;
        count<=0;
      end else begin
        
        if(wr_en&&(count<DEPTH))begin //writing the data_in in FIFO if FIFO is not full 
          mem[wr_ptr]<=data_in;
          wr_ptr<= wr_ptr+1;
          count<=count+1;
        end
        
        if(rd_en&&(count>0))begin //reading the data_out from FIFO if FIFO is not empty
          data_out<=mem[rd_ptr];
          rd_ptr<= rd_ptr+1;
          count<=count-1;
        end
        
      end
    end
  
  assign empty=(count==0);
  assign full=(count==DEPTH);
  
endmodule:fifo
             
