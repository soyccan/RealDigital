`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2021 09:59:39 AM
// Design Name: 
// Module Name: demux
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


module demux(

    input [2:0] I,
    input EN,
    output reg [7:0] Y
   
    );
    
       always @ (I, EN)
begin
       if (EN == 1) 
       begin
            case (I)
                3'd0:    Y <= 8'd1;
                3'd1:    Y <= 8'd2;
                3'd2:    Y <= 8'd4;
                3'd3:    Y <= 8'd8;
                3'd4:    Y <= 8'd16;
                3'd5:    Y <= 8'd32;
                3'd6:    Y <= 8'd64;
                3'd7:    Y <= 8'd128;
                default: Y <= 8'd0;
            endcase
        end
   else
        begin 
            Y <= 8'd0;
        end
end
    
endmodule
