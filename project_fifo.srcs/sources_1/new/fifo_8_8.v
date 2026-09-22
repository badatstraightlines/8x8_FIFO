`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2026 16:59:13
// Design Name: 
// Module Name: fifo_8_8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fifo_8_8(
    input clk,rst,wr_en,rd_en,
    input [7:0] data_in,output reg [7:0] data_out,
    output full,empty
    );
    
    reg [2:0] rd_ptr,wr_ptr;
    
    reg [7:0] mem [0:7];
    
    integer i;
    
    always@(posedge clk)
        begin
            if (rst)
                begin
                    for (i=0;i<7;i=i+1)
                        mem[i] <= 0; 
                end  
            else if(wr_en && full == 0)               
                begin
                    mem[wr_ptr] <= data_in;
                    wr_ptr <= wr_ptr + 1'b1;
                end
            else if(rd_en && empty == 0)
                begin
                    data_out <= mem[rd_ptr];
                    rd_ptr <= rd_ptr + 1'b1;
                end
        end   
        assign full = ((wr_ptr + 1'b1) == rd_ptr) ? 1'b1 : 1'b0;
        assign empty = (wr_ptr == rd_ptr);  
endmodule
