// 이 모듈은 각각의 adder로부터 propagate, generate, carry를 input으로 받아서
// 다음 carry와 pg out, gg out을 output으로 출력하는 모듈이다.
module CLA_LOGIC
#(
    parameter   ADD_BIT = 4;
)
(
    // Declare input, output port
    input   wire    [ADD_BIT-1:0]   g_i,        // generate in,     g0 ~ g3 in picture
    input           [ADD_BIT-1:0]   p_i,        // propagate in,    p0 ~ p3 in picture
    input                           c_i,        // carry in,        c0 in picture
    
    output  wire    [ADD_BIT:1]     c_o,        // carry,           c1 ~ c4 in picture
    output  wire                    pg_o,       // progen out
    output  wire                    gg_o        // gengen out
)
    // assign c_o[1] = g_i[0] ｜ (p_i[0] & c_i); 
    // assign c_o[2] = g_i[1] ｜ (p_i[1] & g_i[0]) ｜ (p_i[1] & p_i[0] & c_i);
    // assign c_o[3] = g_i[2] ｜ (p_i[2] & g_i[1]) ｜ (p_i[2] & p_i[1] & g_i[0]) ｜ (p_i[2] & p_i[1] & p_i[0] & c_i);
    // assign c_o[4] = g_i[3] ｜ (p_i[3] & g_i[2]) ｜ (p_i[3] & p_i[2] & g_i[1]) ｜ (p_i[3] & p_i[2] & p_i[1] & g_i[0]) ｜ (p_i[3] & p_i[2] & p_i[1] & p_i[0] & c_i);
    // assign pg_o = p_i[3] & p_i[2] & p_i[1] & p_i[0];                 
    // assign gg_o = g_i[3] ｜ (p_i[3] & g_i[2]) ｜ (p_i[3] & p_i[2] & g_i[1]) ｜ (p_i[3] & p_i[2] & p_i[1] & g_i[0]);

    // 기본 원리는 carry가 발생하려면 현재 입력 a,b 가 1+1 이거나(or) 이전 입력이 propagate이고 현재 이전 carry가 존재해야한다
    // 이걸 수식으로 표현하면 c(i+1) = g(i) or (c(i) and p(i)) 이다.  

endmodule