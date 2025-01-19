`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2024 13:40:30
// Design Name: 
// Module Name: sys1x1
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


module sys1x1(
    input clk, rst_n, en, clr,
    input signed [15:0] a,
    input [15:0] b,
    input [15:0] y_in,
    output [15:0] a_out, 
    output [15:0] q 
    );
    
    wire [15:0] areg_out;
    register a_reg(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(a), 
        .q(areg_out)
    );
    wire [15:0] ya_out;
    pe PEa(
        .a_in(areg_out), 
        .b(b), 
        .y_in(y_in), 
        .a_out(a_out), 
        .y_out(ya_out)
    );
    wire [15:0] y10_in;
    register b_reg(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(ya_out), 
        .q(q)
    );
endmodule