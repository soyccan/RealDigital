`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2021 10:41:00 AM
// Design Name: 
// Module Name: digit_display
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


module digit_display(

input [3:0]sw,
output [6:0]C

    );
      
    //decoder
    reg [6:0]Y;
    
    always@(sw)
    begin
        case(sw)
            //numbers
            4'b0000:    Y <= 7'b0111111;
            4'b0001:    Y <= 7'b0000110;
            4'b0010:    Y <= 7'b1011011;
            4'b0011:    Y <= 7'b1001111;
            4'b0100:    Y <= 7'b1100110;
            4'b0101:    Y <= 7'b1101101;
            4'b0110:    Y <= 7'b1111101;
            4'b0111:    Y <= 7'b0100111;
            4'b1000:    Y <= 7'b1111111;
            4'b1001:    Y <= 7'b1100111;
            
            //Alphabets
            4'b1010:    Y <= 7'b1110111;
            4'b1011:    Y <= 7'b1111100;
            4'b1100:    Y <= 7'b0111001;
            4'b1101:    Y <= 7'b1011110;
            4'b1110:    Y <= 7'b1111001;
            4'b1111:    Y <= 7'b1110001;
            
            default: Y <= 7'b0000000;
        endcase
    end
    
    //cathodes output is inversed
    assign C = ~Y;
    
endmodule
