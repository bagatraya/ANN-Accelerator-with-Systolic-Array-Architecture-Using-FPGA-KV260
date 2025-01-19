`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2024 13:53:21
// Design Name: 
// Module Name: sys1x6
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


module sys1x6(
    input clk, rst_n, en, clr,
    input signed [15:0] a,
    input [15:0] b0, b1, b2, b3, b4, b5, 
    input [15:0] y0_in, y1_in, y2_in, y3_in, y4_in, y5_in,
    output [15:0] q0, q1, q2, q3, q4, q5 
    );
    
    wire [16:0] a_sys1a_out;
    sys1x1 sys1_a(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .a(a), 
        .b(b0),
        .y_in(y0_in), 
        .a_out(a_sys1a_out), 
        .q(q0)
    );
    
    wire [16:0] a_sys1b_out;
    sys1x1 sys1_b(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .a(a_sys1a_out), 
        .b(b1),
        .y_in(y1_in), 
        .a_out(a_sys1b_out), 
        .q(q1)
    );
    
    wire [16:0] a_sys1c_out;
    sys1x1 sys1_c(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .a(a_sys1b_out), 
        .b(b2),
        .y_in(y2_in), 
        .a_out(a_sys1c_out), 
        .q(q2)
    );
    
    wire [16:0] a_sys1d_out;
    sys1x1 sys1_d(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .a(a_sys1c_out), 
        .b(b3),
        .y_in(y3_in), 
        .a_out(a_sys1d_out), 
        .q(q3)
    );
    
    wire [16:0] a_sys1e_out;
    sys1x1 sys1_e(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .a(a_sys1d_out), 
        .b(b4),
        .y_in(y4_in), 
        .a_out(a_sys1e_out), 
        .q(q4)
    );
    
    wire [16:0] a_sys1f_out;
    sys1x1 sys1_f(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .a(a_sys1e_out), 
        .b(b5),
        .y_in(y5_in), 
        .a_out(a_sys1f_out), 
        .q(q5)
    );
endmodule