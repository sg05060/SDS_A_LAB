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

    wire [DATA_WIDTH-1:0] a = 8'b0000_0101 ;    // 00000101
    wire [DATA_WIDTH-1:0] b = 8'haf        ;    // 10101111
// 연산 결과를 저장할 변수들을 parameter를 적절히 사용하여 선언하려고 한다.
// 각 연산 후 발생하는 overflow를 감안할 때, 연산 결과를 저장하는 각 변수는
// 몇 bit로 선언하는것이 알맞을까?

// fill your code here
    localparam ADD_WDITH =     8    ; //8비트로 표현됨
    localparam MUL_WDITH =     10   ; //최소 10비트로 나옴

    wire [ADD_WDITH-1:0] add_result = a + b   ;
    wire [MUL_WIDTH-1:0] mul_result = a * b   ;
 
//-------------------------------------



//------------- problem 2 -------------
// - Creating Memory
// data의 width가 32'b이며,data의 개수가 총 1024개인 메모리를 생성하고자 한다.
// parameter 변수를 적절히 사용하여 해당 코드를 완성시켜라.

// fill your code here
    parameter   DATA_WIDTH   =     32    ;  // data의 width 와 관련된 parameter- 주소와는 관련 없음
    parameter   MEM_DEPTH    =     1024  ;  // data의 총 개수와 관련된 parameter- Address width와 관련이 있음

    localparam  ADDR_WIDTH   = #clog2(MEM_DEPTH) ;  // fill blank ()

    reg [DATA_WIDTH-1:0] memory [0:MEMDEPTH-1]             ;    // memory 선언
	//32'b의 데이터 1024개 만든다는 코드를 의미
//-------------------------------------



//------------- problem 3 -------------
// - Indexed part-select ( Array vs Vector)
// 한 칸당 data의 크기가 8'b, 행은 4개, 열은 16개를 가지는 2차원 배열을 선언하여라.
    reg [7:0] array [0:3] [0:15]; // 하나의 이차원 배열 내부 칸에서의 데이터가 8비트이며 행과 열의 크기가 4, 16인 행렬을 의미한다

// 위에서 선언한 array를 Vector로 선언하여라.
    reg [511:0] vector;    // 위의 Array의 모든 비트 개수 512개이므로 벡터의 크기를 512로 연결한다
    
// 위에서 선언한 vector 변수를 통해 array "1행 3열"의 data에 접근하여라.
// 이때, localparam 을 활용한 Indexed part-select 문법을 사용하여라.
    localparam sel = 8; // 하나의 배열 항목에서 비트의 수가 8이므로 셀의 크기는 8을 입력한다
    vector [16+:sel]; // 위의 벡터에서 1행 3열의 값은 16~23의 비트이므로 이를 중심으로 탐색한다
//-------------------------------------
