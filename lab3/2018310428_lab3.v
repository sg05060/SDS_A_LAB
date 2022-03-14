//------------- problem 1 -------------
// - Combine operation
// 다음과 같은 memory를 사용하고자 한다.
    reg [7:0] memory [0:15];
// memory의 1번째 word의 상위 2bit를 data로 변환하려한다.
    wire data = 2'b10;
    memory[1][7:6] = data  // *error code
// 이전 강의를 통해 위와 같은 memory접근은 불가능하다는 사실을 알 수 있다.
// Combine opertaion(or 다른 방법을 활용해도 괜찮다!)을 활용하여 memory의 2번째 word의 상위 2bit에 접근하는
// code를 완성해보자.

// fill your code here
    memory[1] = ((memory[1] & 8'b00111111)|({data, 6'b000000}));
    //// 먼저 8비트의 binary 00111111과 and 시켜서 memory[1]의 첫 두 비트를 00으로 만들어주고 나머지는 그대로.
    //// 그 후 이 값을 {data, 6'b000000} = 8'b10000000과 or시켜서 첫 두 비트를 10으로 만들어주고 나머지는 그대로 유지한다.
//-------------------------------------


//------------- problem 2 -------------
// - Bitwise operation
// 다음과 같은 vector가 input으로 선언되었다고 하자.
    wire [31:0] vector_i;
// 위 vector의 하위 8-bit를 0으로 할당하고, 나머지는 그대로 사용하고자 한다.
// 이를 mask 변수와 Bitwise operation을 적절히 사용하여 나타내어 보자. 

// fill your code here
    parameter N = 8;
    wire [31:0] mask = {32{1'b1}} << N; ////(11111111_11111111_11111111_00000000) mask랑 vector_i 각 성분끼리 곱하면 되겠다.
                                        //// 근데 kocw 강의에선 {32{1'b1}} 가 아니라 {{32{1'b1}}}여야만 concatenation이 된댔는데 교수님이 착각하신 걸까요?
    wire [31:0] vector_o = vector_i & mask;
//-------------------------------------



//------------- problem 3 -------------
// - bit extension
// input으로 2개의 서로 다른 타입의 data가 들어온다고 하자.
    wire        [3:0] num_1 =  7; ////7=0111 7+(-4) 00111 ->signed로 바꾸기
    wire signed [3:0] num_2 = -4; ////-4=1100       11100 이렇게 더하면 되긴 함. signed+signed 하면 자동으로 앞에 1 extension됨!!
// 2개의 input data들을 더하여 다음 변수에 저장하려 한다.
    wire signed [4:0] result = num_1 + num_2; // error code
// 위 code는 error code이다. 서로 다른 type의 변수를 더하기 때문에
// 올바른 계산결과과 도출되지 않는다.
// $signed() 문법을 사용하여 올바르게 고쳐보자.
// hint : $signed() 와 Combine operation을 모두 사용해야 한다.

// fill your code here
    wire signed [4:0] result = $signed(num_1) + num_2;
//-------------------------------------
