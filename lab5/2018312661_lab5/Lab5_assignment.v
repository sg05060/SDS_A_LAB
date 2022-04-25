//------------- problem 1 -------------
// - Sensitivity list
// always combination logic에서 sensitivity list에 변수명을 나열하는대신,
// (*)를 사용함으로 always 구문에 사용되는 모든 변수명들을 대체할 수 있다. 
// 하지만 본인이 선언한 combination logic이 어떤 변수들에 의해서 작동하는지 명확하게 인지할 필요가 있다. 
// 다음 선언된 always구문에서 sensitivity list에 들어갈 변수명을 아래에 적으시요.
module Sensitivity_Study 
#(
    // No use any parameter
) 
(
    input   wire    a,
    input   wire    b,
    input   wire    en,    
    output  reg     x,
    output  reg     y,
    output  reg     z
);

    wire    [1:0]   mux;
    assign  mux = {x, y};   // 중괄호는 Concatonation(결합연산자)로 6주차에 나오는데
                            // 미리 알고싶으면 구글링해보기.
    always @(*) begin
        x = a & b;
            if (en) begin
                y = a | b;
            end 
            case (mux)
                2'b00: z = 0;
                2'b01: z = 1;
            endcase
    end    
endmodule    
// answer: 현재 always구문 내에서 a,b,en의 변화에 따라 x와y값이 결정 되고 결정된 x,y로 mux를 만들어z를 정하니 감지신호는 a,b,en이다. //

//-------------------------------------



//------------- problem 2 -------------
// - Instantiation
// 아래에 full adder module이 선언되어있다. 
// 해당 full adder 4개를 instance해서 4bit ripple carry adder를 만들려고 한다.
// ppt에 있는 그림의 변수명대로 4bit ripple carry adder를 설계하라.
module full_adder
#(
    // No use any parameter
)
(
    input   wire    a,      // input a
    input   wire    b,      // input b
    input   wire    cin,    // input carry in
    output  wire    s,      // output sum
    output  wire    cout    // output carry out
);
    assign s = a ^ b ^ cin;
    assign cout = ((a ^ b) & cin) | (a & b);
endmodule


module full_adder_4bit
#(
    parameter       ADD_BIT
)
(
    input   wire    [ADD_BIT-1:0]   a,
    input   wire    [ADD_BIT-1:0]   b,
    input   wire                    c0,
    output  wire                    c4,
    output  wire    [ADD_BIT-1:0]   s,
)

            wire    [ADD_BIT-1:1]   c;      // c1 = c[1], c2 = c[2], c3 = c[3]            

    // FA int_1(.a(a[0]),.b(b[0]),.cin(c0),.s(s[0]),cout(c[1]));       // 
    // FA int_2(.a(a[1]),.b(b[1]),.cin(c[1]),.s(s[1]),cout(c[2]));    // ==> explicit, implict 둘다 상관x
    // FA int_3(.a(a[2]),.b(b[2]),.cin(c[2]),.s(s[2]),cout(c[3]));       //
    // FA int_4(.a(a[3]),.b(b[3]),.cin(c[3]),.s(s[3]),cout(c4));        //

endmodule
//-------------------------------------




//------------- problem 3 -------------
// - always vs assign
// 다음 선언된 and3 gate 모듈0을 always 구문으로 설계해보시오. 
// hint : assign이 아니라 always구문을 쓰기 위해서 type을 바꿔야는 변수도 있음!
module and3
#(
    // No use any parameter
)
(
    input   wire    a, 
    input   wire    b, 
    input   wire    c,
    output  wire    y
    )

    assign  y = (a & b & c);
endmodule

module and3_yours
#(
    // No use any parameter
)
(
    // input   wire    a,        //
    // input   wire    b, //
    // input   wire    c,      //
    // output  reg     y        //
)

    always @(/*a,b,c*/) begin
        // y = a & b & c;//
    end
endmodule
//-------------------------------------