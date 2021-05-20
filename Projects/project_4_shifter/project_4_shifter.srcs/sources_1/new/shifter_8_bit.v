`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2021 12:36:53 PM
// Design Name: 
// Module Name: shifter_8_bit
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


module shifter_8_bit(

    input [7:0] sw,
    input [1:0] Shift_A,
    input R,				//rotate bit switch
    input D,				//direction bit 0 for Lelf 1 for Right
    input F,				//fill bit button
    output [7:0] led


    );
    
    reg [7:0] Z;				//what happens if you don't use this?
   
    always @ (sw, Shift_A,R,D,F)	//Why are these signals included?
    begin
        //if (~Shift_A)			//You need to rewrite this code
            //Z = sw;
        //else
         //begin    				//begin and end blocks are need for if,else, always if the 
					//block has more than 1 line
         //Writing code for a 1 bit shift
           if(Shift_A[0])           //shifting by 1 bit, 2'b defines a 2 bit binary number
           begin
                if(R)   //if rotate is on execute this code, Why?
                    Z = (~D) ? {sw[6:0], sw[7]} : {sw[0], sw[7:1]};      //What happens here? 
                else //shift, why is the F(fill bit) needed here?
                    Z = (~D) ? {sw[6:0], F} : {F, sw[7:1]};
            end
            
            else if(Shift_A[1])           //shifting by 2 bit, 2'b defines a 2 bit binary number
            begin
                if(R)   //if rotate is on execute this code, Why?
                    Z = (~D) ? {sw[5:0], sw[7:6]} : {sw[1:0], sw[7:2]};      //What happens here? 
                else //shift, why is the F(fill bit) needed here?
                    Z = (~D) ? {sw[5:0], F} : {F, sw[7:2]};
            end
            
            else if(Shift_A[0] && Shift_A[1])           //shifting by 3 bit, 2'b defines a 2 bit binary number
            begin
                if(R)   //if rotate is on execute this code, Why?
                    Z = (~D) ? {sw[4:0], sw[7:5]} : {sw[2:0], sw[7:3]};      //What happens here? 
                else //shift, why is the F(fill bit) needed here?
                    Z = (~D) ? {sw[4:0], F} : {F, sw[7:3]};
            end
         end
    //end
   
    assign led = Z;		//assign the output leds to value of Z 
    
endmodule
