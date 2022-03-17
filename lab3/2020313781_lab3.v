//------------- problem 1 -------------
// - Combine operation
// 다음과 같은 memory를 사용하고자 한다.
    reg [7:0] memory [0:15];
// memory의 1번째 word의 상위 2bit를 data로 변환하려한다.
    wire data = 2'b10;
    memory[1][7:6] = data  // error code
// 이전 강의를 통해 위와 같은 memory접근은 불가능하다는 사실을 알 수 있다.
// Combine opertaion을 활용하여 memory의 2번째 word의 상위 2bit에 접근하는
// code를 완성해보자.

// fill your code here
    memory[1] = {data, {6{1'b0}}};
    //뒤 4자리의 비트를 임의로 0으로 대체하였는데 어떻게 처리해야 하나요?
//-------------------------------------



//------------- problem 2 -------------
// - Bitwise operation
// 다음과 같은 vector가 input으로 선언되었다고 하자.
    wire [31:0] vector_i;
// 위 vector의 하위 8-bit를 0으로 할당하고, 나머지는 그대로 사용하고자 한다.
// 이를 Bitwise operation을 적절히 사용하여 나타내어 보자. 

// fill your code here
    parameter N = 8;
    wire [31:0] mask = {32{1'b1}} << N;

    wire [31:0] vector_o = vector_i & mask;
//-------------------------------------



//------------- problem 3 -------------
// - bit extension
// input으로 2개의 서로 다른 타입의 data가 들어온다고 하자.
    wire        [3:0] num_1 =  7;    //0111
    wire signed [3:0] num_2 = -4;    //1011
// 2개의 input data들을 더하여 다음 변수에 저장하려 한다.
    wire signed [4:0] result = num_1 + num_2; // error code
// 위 code는 error code이다. 서로 다른 type의 변수를 더하기 때문에
// 올바른 계산결과과 도출되지 않는다.
// $signed() 문법을 사용하여 올바르게 고쳐보자.
// hint : $signed() 와 Combine operation을 모두 사용해야 한다.

// fill your code here
    wire signed [4:0] result = {1'b0, $signed(num_1)+num_2};
//-------------------------------------
