//------------- problem 3 -------------
// - Carry Look Ahead adder
// 해당 skeleton code를 바탕으로 4bit CLA adder를 설계하시오.

// Variable name 뒤에 i는 input, o는 output, w는 wire를 의미한다.
// 기본구조는 ppt에 첨부된 그림을 참고하면된다. 
// logic 1개에 gp adder 4개로 총 5개의 module을 instantiation해서 설계한다. 

// This moudle is ref from below book ch4
// I modify it for matching with picture in ppt.
// BOOK NAME: Digital Systems Design Using Verilog(1st Ed)

module CLA_TOP
#(
    parameter   ADD_BIT = 4;
)
(
    // Declare input, output port
    input   [ADD_BIT-1:0]       a_i,    // a 4bit,          a0~a3
    input   [ADD_BIT-1:0]       b_i,    // b 4bit,          b0~b3
    input                       c_i,    // carry in,        c0
    
    output  [ADD_BIT-1:0]       s_o,    // sum out,         s0~s3
    output                      c_o,    // carry out,       c4
    output                      pg_o,   // progen out
    output                      gg_o;   // gengen out
);
    // Declare internal variable
    wire    [ADD_BIT-1:0]       g_w;    // generate wire    g0~g3
    wire    [ADD_BIT-1:0]       p_w;    // propagate wire   p0~p3
    wire    [ADD_BIT-1:1]       c_w;    // carry wire,      c1~c3

    // Instantiation
    // CLA_LOGIC (g_w, p_w, c_i, c_w, pg_o, gg_o );
    // GP_FULL_ADDER u0 : (a_i[0], b_i[0], c_i, g_w[0], p_w[0], s_o[0]);
    // GP_FULL_ADDER u1 : (a_i[1], b_i[1], c_w[1], g_w[1], p_w[1], s_o[1]);
    // GP_FULL_ADDER u2 : (a_i[2], b_i[2], c_w[2], g_w[2], p_w[2], s_o[2]);
    // GP_FULL_ADDER u3 : (a_i[3], b_i[3], c_w[3], g_w[3], p_w[3], s_o[3]);

    // FILL HERE with your logic - instance 1 cla logic and 4 cla fa
    
endmodule