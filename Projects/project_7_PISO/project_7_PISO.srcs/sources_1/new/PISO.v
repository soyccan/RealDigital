`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2021 01:21:07 PM
// Design Name: 
// Module Name: PISO
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


module PISO(

input [7:0]D,
input [1:0]btn, 
input clk,
output [7:0]led,
output [7:0]RGB

    );
    
    reg [7:0]Q1;
    reg [7:0]Q2;
    reg [25:0] cntr;

 always @ (posedge(clk))
    cntr <= cntr + 1;
    
    //upper register
//    always@(posedge(cntr[25]), posedge(rst))
//    begin
//        if(btn[0] == 1)
//            begin
//                if(rst == 0)
//                    begin
//                        Q1 <= 8'b00000000;
//                    end
//                else
//                    begin
//                        Q1 <= { D[6:0], D[7] };
//                    end
//                end
//        else
//            begin
//                Q1 <= D;
//            end
//    end
    
    always@(posedge(cntr[25]))
    begin
        if(btn[0] == 1)
            begin
               Q1 <= { D[6:0], 1'b1 }; 
            end
        else
            begin
                Q1 <= D;
            end
    end
 
    //lower register
//    always@(posedge(cntr[25]), posedge(rst))
//    begin
//            if(btn[1]== 1)
//                begin
//                    if(rst == 0)
//                        begin
//                            Q2 <= 8'b00000000;
//                        end
//                    else
//                        begin
//                            Q2 <= { D[6:0], D[7] };
//                        end
//                end
//            else
//                begin
//                    Q2 <= D;
//                end        
//    end

always@(posedge(cntr[25]))
    begin
        if(btn[1] == 1)
            begin
                Q2 <= { D[6:0], 1'b1 }; 
            end
        else
            begin
                Q2 <= D;
            end
    end
    
    assign led = Q1;
    assign RGB = Q2;
    
endmodule
