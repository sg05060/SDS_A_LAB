//------------- problem 1 -------------
// - latch 방지
// 다음은 지난 과제인 senstivity_study module이다.
// 여기에는 사실 합성시 latch를 발생시키는 부분이 존재하는데(2곳),
// 이를 방지하기 위해서 코드를 추가해야한다.
// latch를 발생시키는 변수들이 latch가 아니라 
// 모두 0으로 초기화 구문을 추가시켜서 코드를 완성시켜라.
module sensitivity_study_latch
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
    assign  mux = {x, y};

    always @(*) begin
        x = a & b;
            if (en) begin
                y = a | b;
            else
                y = 1'b0;
            end 
            case (mux)
                2'b00: z = 0;
                2'b01: z = 1;
                default: z = 0;
            endcase
    end    
endmodule    
//-------------------------------------

//------------- problem 2 -------------
// - Concatonation(결합연산자)
// a = 1'b1, b = 1'b0, c = 2'b111일때
// 해당 구문에서 res0와 res1을 2진수 형태로 어떤 값을 나타내는지 아래에 적으시오.
module concatonation_study #(
    // No use any parameter
) (
    input   a;
    input   b;
    output  [1:0]   res0;
    output  [2:0]   res1;

);
    
    wire            a;
    wire            b;

    wire    [1:0]   res0;
    assign  res0 = {a, b};

    wire    [2:0]   c;
    wire    [7:0]   res1;

    assign  res1 = {b, a, c[1:0], 2'b00, c[2]};
    
endmodule

// res0: 2'b10;
// res1: 7'b0111001;
//-------------------------------------


