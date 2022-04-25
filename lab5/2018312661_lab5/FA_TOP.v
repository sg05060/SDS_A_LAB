//------------- problem 2 -------------
// - Instantiation
// full adder module이 선언되어있다. 
// 해당 full adder 4개를 instance해서 4bit ripple carry adder를 만들려고 한다.
// ppt에 있는 그림의 변수명대로 4bit ripple carry adder를 설계하라.

module FA_4bit_TOP
#(
    parameter       ADD_BIT = 4;
)
(
    input           [ADD_BIT-1:0]   a,      // 4bit add input
    input           [ADD_BIT-1:0]   b,      // 4bit add input
    input                           c0,     // Carry in
    output                          c4,     // Carry out
    output          [ADD_BIT-1:0]   s,      // 4bit sum
);

    // Declare internal variable
    wire    [ADD_BIT-1:1]   c;      // c1 = c[1], c2 = c[2], c3 = c[3]

    // Instantiation

    // FA int_1(.a(a[0]),.b(b[0]),.cin(c0),.s(s[0]),cout(c[1]));    // -> intantiation  full adder module and porting properly
    // FA int_2(.a(a[1]),.b(b[1]),.cin(c[1]),.s(s[1]),cout(c[2]));    // -> intantiation  full adder module and porting properly
    // FA int_3(.a(a[2]),.b(b[2]),.cin(c[2]),.s(s[2]),cout(c[3]));    // -> intantiation  full adder module and porting properly
    // FA int_4(.a(a[3]),.b(b[3]),.cin(c[3]),.s(s[3]),cout(c4));    // -> intantiation  full adder module and porting properly
    

endmodule
