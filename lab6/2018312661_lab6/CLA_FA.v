// 해당 모듈은 input값들과 carry를 받아서 propagate, generate,
// sum을 연산해서 출력하는 모듈이다.
module GP_FULL_ADDER
#(
    // No use any parameter
)
(
    // Declare input, output port
    input                       a_i,        // input x
    input                       b_i,        // input y
    input                       c_i,        // Carry In
    
    output  wire                g_o,        // Generate
    output  wire                p_o,        // Propagate
    output  wire                s_o         // Sum
)
    
    // assign g_o = a_i & b_i;
    // assign p_o = a_i ^ b_i;
    // assign s_o = p_i ^ c_i;
    // 우선 generate는 무조건 캐리가 발생하는 1+1 일 경우이니 and
    // propagate는 1+0 이거나 0+1일 경우이니 xor
    // sum은 a_i xor b_i xor ^ c_i이다.
    
endmodule