`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2021 12:19:47 PM
// Design Name: 
// Module Name: digit_displaying
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


module digit_displaying(

input [3:0]sw,
output [6:0]C,
output [3:0]A

    );
    reg [6:0]Y;
    
    always@(sw)
    begin
        case(sw)
            //numbers
            4'b0000:    Y <= 7'b0111111; //0
            4'b0001:    Y <= 7'b0000110; //1
            4'b0010:    Y <= 7'b1011011; //2
            4'b0011:    Y <= 7'b1001111; //3
            4'b0100:    Y <= 7'b1100110; //4
            4'b0101:    Y <= 7'b1101101; //5
            4'b0110:    Y <= 7'b1111101; //6
            4'b0111:    Y <= 7'b0100111; //7
            4'b1000:    Y <= 7'b1111111; //8
            4'b1001:    Y <= 7'b1100111; //9
            
//            //Alphabets
//            4'b1010:    Y <= 7'b1110111;
//            4'b1011:    Y <= 7'b1111100;
//            4'b1100:    Y <= 7'b0111001;
//            4'b1101:    Y <= 7'b1011110;
//            4'b1110:    Y <= 7'b1111001;
//            4'b1111:    Y <= 7'b1110001;
            
            default: Y <= 7'b0000000;
        endcase
    end
    
    assign C = ~Y;
    
    assign A[0] = 0;
    assign A[1] = 0;
//    assign A[2] = 1;
//    assign A[3] = 1;
    
endmodule
