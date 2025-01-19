`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2024 14:22:12
// Design Name: 
// Module Name: systolic_6x6
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


module systolic(
    input wire clk, rst_n, en, clr, in_valid,
    input wire signed [15:0] a0, a1, a2, a3, a4, a5,
    input wire signed [15:0] b00, b01, b02, b03, b04, b05, 
    input wire signed [15:0] b10, b11, b12, b13, b14, b15, 
    input wire signed [15:0] b20, b21, b22, b23, b24, b25, 
    input wire signed [15:0] b30, b31, b32, b33, b34, b35, 
    input wire signed [15:0] b40, b41, b42, b43, b44, b45,
    input wire signed [15:0] b50, b51, b52, b53, b54, b55,  
    output wire signed [15:0] y0, y1, y2, y3, y4, y5,
    output wire out_valid
    );
    
    wire signed [15:0] y0_in, y1_in, y2_in, y3_in, y4_in, y5_in;
    
    assign y0_in = 16'b0000000000000000; //0 
    assign y1_in = 16'b0000000000000000; //0 
    assign y2_in = 16'b0000000000000000; //0 
    assign y3_in = 16'b0000000000000000; //0 
    assign y4_in = 16'b0000000000000000; //0 
    assign y5_in = 16'b0000000000000000; //0 
        
    // baris 0
    wire signed [15:0] q00, q01, q02, q03, q04, q05;
    sys1x6 sys6_0(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .a(a0), 
        .b0(b00),
        .b1(b01),
        .b2(b02),
        .b3(b03),
        .b4(b04),
        .b5(b05),        
        .y0_in(y0_in),
        .y1_in(y1_in), 
        .y2_in(y2_in), 
        .y3_in(y3_in), 
        .y4_in(y4_in), 
        .y5_in(y5_in),  
        .q0(q00),
        .q1(q01),
        .q2(q02),
        .q3(q03),
        .q4(q04),
        .q5(q05)
    );
    
    //baris 1
    wire signed [15:0] a1_reg0_out;
    register a1_reg0(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(a1), 
        .q(a1_reg0_out)
    );
    wire signed [15:0] q10, q11, q12, q13, q14, q15;
    sys1x6 sys6_1(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .a(a1_reg0_out), 
        .b0(b10),
        .b1(b11),
        .b2(b12),
        .b3(b13),
        .b4(b14),
        .b5(b15),        
        .y0_in(q00),
        .y1_in(q01), 
        .y2_in(q02), 
        .y3_in(q03), 
        .y4_in(q04), 
        .y5_in(q05),  
        .q0(q10),
        .q1(q11),
        .q2(q12),
        .q3(q13),
        .q4(q14),
        .q5(q15)
    );
    
    //baris 2
    wire signed [15:0] a2_reg0_out;
    register a2_reg0(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(a2), 
        .q(a2_reg0_out)
    );
    
    wire signed [15:0] a2_reg1_out;
    register a2_reg1(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(a2_reg0_out), 
        .q(a2_reg1_out)
    );
    
    wire signed [15:0] q20, q21, q22, q23, q24, q25;
    sys1x6 sys6_2(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .a(a2_reg1_out), 
        .b0(b20),
        .b1(b21),
        .b2(b22),
        .b3(b23),
        .b4(b24),
        .b5(b25),        
        .y0_in(q10),
        .y1_in(q11), 
        .y2_in(q12), 
        .y3_in(q13), 
        .y4_in(q14), 
        .y5_in(q15),  
        .q0(q20),
        .q1(q21),
        .q2(q22),
        .q3(q23),
        .q4(q24),
        .q5(q25)
    );
    
    //baris 3
    wire signed [15:0] a3_reg0_out;
    register a3_reg0(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(a3), 
        .q(a3_reg0_out)
    );
    
    wire signed [15:0] a3_reg1_out;
    register a3_reg1(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(a3_reg0_out), 
        .q(a3_reg1_out)
    );
    
    wire signed [15:0] a3_reg2_out;
    register a3_reg2(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(a3_reg1_out), 
        .q(a3_reg2_out)
    );
    
    wire signed [15:0] q30, q31, q32, q33, q34, q35;
    sys1x6 sys6_3(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .a(a3_reg2_out), 
        .b0(b30),
        .b1(b31),
        .b2(b32),
        .b3(b33),
        .b4(b34),
        .b5(b35),        
        .y0_in(q20),
        .y1_in(q21), 
        .y2_in(q22), 
        .y3_in(q23), 
        .y4_in(q24), 
        .y5_in(q25),  
        .q0(q30),
        .q1(q31),
        .q2(q32),
        .q3(q33),
        .q4(q34),
        .q5(q35)
    );
    
    //baris 4
    wire signed [15:0] a4_reg0_out;
    register a4_reg0(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(a4), 
        .q(a4_reg0_out)
    );
    
    wire signed [15:0] a4_reg1_out;
    register a4_reg1(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(a4_reg0_out), 
        .q(a4_reg1_out)
    );
    
    wire signed [15:0] a4_reg2_out;
    register a4_reg2(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(a4_reg1_out), 
        .q(a4_reg2_out)
    );
    
    wire signed [15:0] a4_reg3_out;
    register a4_reg3(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(a4_reg2_out), 
        .q(a4_reg3_out)
    );
    
    wire signed [15:0] q40, q41, q42, q43, q44, q45;
    sys1x6 sys6_4(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .a(a4_reg3_out), 
        .b0(b40),
        .b1(b41),
        .b2(b42),
        .b3(b43),
        .b4(b44),
        .b5(b45),        
        .y0_in(q30),
        .y1_in(q31), 
        .y2_in(q32), 
        .y3_in(q33), 
        .y4_in(q34), 
        .y5_in(q35),  
        .q0(q40),
        .q1(q41),
        .q2(q42),
        .q3(q43),
        .q4(q44),
        .q5(q45)
    );
    
    //baris 5
    wire signed [15:0] a5_reg0_out;
    register a5_reg0(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(a5), 
        .q(a5_reg0_out)
    );
    
    wire signed [15:0] a5_reg1_out;
    register a5_reg1(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(a5_reg0_out), 
        .q(a5_reg1_out)
    );
    
    wire signed [15:0] a5_reg2_out;
    register a5_reg2(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(a5_reg1_out), 
        .q(a5_reg2_out)
    );
    
    wire signed [15:0] a5_reg3_out;
    register a5_reg3(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(a5_reg2_out), 
        .q(a5_reg3_out)
    );
    
    wire signed [15:0] a5_reg4_out;
    register a5_reg4(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(a5_reg3_out), 
        .q(a5_reg4_out)
    );
    
    // y5 output
    wire signed [15:0] y5_temp;
    wire signed [15:0] q50, q51, q52, q53, q54;
    sys1x6 sys6_5(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .a(a5_reg4_out), 
        .b0(b50),
        .b1(b51),
        .b2(b52),
        .b3(b53),
        .b4(b54),
        .b5(b55),        
        .y0_in(q40),
        .y1_in(q41), 
        .y2_in(q42), 
        .y3_in(q43), 
        .y4_in(q44), 
        .y5_in(q45),  
        .q0(q50),
        .q1(q51),
        .q2(q52),
        .q3(q53),
        .q4(q54),
        .q5(y5_temp)
    );
    //y0 output
    wire signed [15:0] y0_temp;
    wire signed [15:0] y0_reg0_out;
    register y0_reg0(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(q50), 
        .q(y0_reg0_out)
    );
    
    wire signed [15:0] y0_reg1_out;
    register y0_reg1(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(y0_reg0_out), 
        .q(y0_reg1_out)
    );
    
    wire signed [15:0] y0_reg2_out;
    register y0_reg2(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(y0_reg1_out), 
        .q(y0_reg2_out)
    );
    
    wire signed [15:0] y0_reg3_out;
    register y0_reg3(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(y0_reg2_out), 
        .q(y0_reg3_out)
    );
    
    wire signed [15:0] y0_reg4_out;
    register y0_reg4(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(y0_reg3_out), 
        .q(y0_temp)
    );
    
    //y1 output
    wire signed [15:0] y1_temp;
    wire signed [15:0] y1_reg0_out;
    register y1_reg0(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(q51), 
        .q(y1_reg0_out)
    );
    
    wire signed [15:0] y1_reg1_out;
    register y1_reg1(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(y1_reg0_out), 
        .q(y1_reg1_out)
    );
    
    wire signed [15:0] y1_reg2_out;
    register y1_reg2(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(y1_reg1_out), 
        .q(y1_reg2_out)
    );
    
    wire signed [15:0] y1_reg3_out;
    register y1_reg3(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(y1_reg2_out), 
        .q(y1_temp)
    );
    
    //y2 output
    wire signed [15:0] y2_temp;
    wire signed [15:0] y2_reg0_out;
    register y2_reg0(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(q52), 
        .q(y2_reg0_out)
    );
    
    wire signed [15:0] y2_reg1_out;
    register y2_reg1(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(y2_reg0_out), 
        .q(y2_reg1_out)
    );
    
    wire signed [15:0] y2_reg2_out;
    register y2_reg2(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(y2_reg1_out), 
        .q(y2_temp)
    );
    
    //y3 output
    wire signed [15:0] y3_temp;
    wire signed [15:0] y3_reg0_out;
    register y3_reg0(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(q53), 
        .q(y3_reg0_out)
    );
    
    wire signed [15:0] y3_reg1_out;
    register y3_reg1(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(y3_reg0_out), 
        .q(y3_temp)
    );
    
    //y4 output
    wire signed [15:0] y4_temp;
    wire signed [15:0] y4_reg0_out;
    register y4_reg0(
        .clk(clk), 
        .rst_n(rst_n), 
        .en(en), 
        .clr(clr), 
        .d(q54), 
        .q(y4_temp)
    );
    
    // y register
    
    register  y0_reg(clk, rst_n, en, clr, y0_temp,      y0);
    register  y1_reg(clk, rst_n, en, clr, y1_temp,      y1);
    register  y2_reg(clk, rst_n, en, clr, y2_temp,      y2);
    register  y3_reg(clk, rst_n, en, clr, y3_temp,      y3);
    register  y4_reg(clk, rst_n, en, clr, y4_temp,      y4);
    register  y5_reg(clk, rst_n, en, clr, y5_temp,      y5);
    
    
       // *** Valid registers ***
    wire in_valid_reg0, in_valid_reg1, in_valid_reg2, in_valid_reg3, in_valid_reg4, 
    in_valid_reg5,in_valid_reg6, in_valid_reg7, in_valid_reg8, in_valid_reg9, 
    in_valid_reg10, in_valid_reg11, in_valid_reg12;

    register #(1) reg_valid_0(clk, rst_n, en, clr, in_valid,      in_valid_reg0); 
    register #(1) reg_valid_1(clk, rst_n, en, clr, in_valid_reg0, in_valid_reg1);
    register #(1) reg_valid_2(clk, rst_n, en, clr, in_valid_reg1, in_valid_reg2);
    register #(1) reg_valid_3(clk, rst_n, en, clr, in_valid_reg2, in_valid_reg3);
    register #(1) reg_valid_4(clk, rst_n, en, clr, in_valid_reg3, in_valid_reg4);
    register #(1) reg_valid_5(clk, rst_n, en, clr, in_valid_reg4, in_valid_reg5);
    register #(1) reg_valid_6(clk, rst_n, en, clr, in_valid_reg5, in_valid_reg6);
    register #(1) reg_valid_7(clk, rst_n, en, clr, in_valid_reg6, in_valid_reg7);
    register #(1) reg_valid_8(clk, rst_n, en, clr, in_valid_reg7, in_valid_reg8);
    register #(1) reg_valid_9(clk, rst_n, en, clr, in_valid_reg8, in_valid_reg9);
    register #(1) reg_valid_10(clk, rst_n, en, clr, in_valid_reg9, in_valid_reg10);
    register #(1) reg_valid_11(clk, rst_n, en, clr, in_valid_reg10, in_valid_reg11);
    register #(1) reg_valid_12(clk, rst_n, en, clr, in_valid_reg11, in_valid_reg12);
    assign out_valid = in_valid_reg12;

endmodule