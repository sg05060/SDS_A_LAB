///////////////////////////////////////
// Design name : lab2
// date        : 2022-03-04
// Author      : Park-Sang-Hyun
// Team name   : SDS
// Description : Basic Verilog syntax
//
///////////////////////////////////////

//------------- problem 1 -------------
// - Constant and Overflow
// 다음 선언된 두 자료형(a,b)을 다양한 연산에 사용하려고 한다.
    parameter DATA_WIDTH = 8; 

    wire [DATA_WIDTH-1:0] a = 8'b0000_0101 ;
    wire [DATA_WIDTH-1:0] b = 8'haf        ;
// 연산 결과를 저장할 변수들을 parameter를 적절히 사용하여 선언하려고 한다.
// 각 연산 후 발생하는 overflow를 감안할 때, 연산 결과를 저장하는 각 변수는
// 몇 bit로 선언하는것이 알맞을까?

// fill your code here
    // 8bit를 2의 거듭제곱으로 바꿔서 제일 큰 값들만을 이용해서 덧셈을 해보면 2^8 + 2^8 = 2^9 이므로
    // 9bit만 있으면 덧셈 연산을 하는데 충분하다.
    localparam ADD_WDITH = 9'b0_0000_0000; 
    // 위와 같은 방식으로 곱셈을 해보면 2^8 * 2^8 = 2^16 이므로
    // 16bit만 있으면 곱셈 연산을 하는데 충분하다.
    localparam MUL_WDITH = 16'b0000_0000_0000_0000; 

    wire [ADD_WDITH:0] add_result = a + b   ;
    wire [MUL_WDITH:0] mul_result = a * b   ;
 
//-------------------------------------



//------------- problem 2 -------------
// - Creating Memory
// data의 width가 32'b이며,data의 개수가 총 1024개인 메모리를 생성하고자 한다.
// parameter 변수를 적절히 사용하여 해당 코드를 완성시켜라.

// fill your code here
    parameter   DATA_WIDTH   =  32'b 0000_0000_0000_0000_0000_0000_0000_0000;  // data의 width 와 관련된 parameter
    parameter   MEM_DEPTH    =  1024'h 000;  // data의 총 개수와 관련된 parameter

    localparam  ADDR_WIDTH   = #clog2(MEM_DEPTH) ;  // fill blank ( )

    reg [DATA_WIDTH - 1:0] memory [2**ADDR_WIDTH:0]             ;    // memory 선언
//-------------------------------------



//------------- problem 3 -------------
// - Indexed part-select ( Array vs Vector)
// 한 칸당 data의 크기가 8'b, 행은 4개, 열은 16개를 가지는 2차원 배열을 선언하여라.
    reg [7:0] array [0:3] [0:15];

// 위에서 선언한 array를 Vector로 선언하여라.
    reg [511:0] vector;    
    
// 위에서 선언한 vector 변수를 통해 array "1행 3열"의 data에 접근하여라.
// 이때, localparam 을 활용한 Indexed part-select 문법을 사용하여라.
    localparam sel = 8;
    vector [sel*2 +:sel];
//-------------------------------------
