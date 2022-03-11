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
// memory[1] = 어떤 비트 로 전체 8비트에 공통적으로 할당하는 기존과 달리
// 결합 연산자를 이용하면 나눠서 할당할 수 있을거라 추측하였다.
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
// 먼저 위에 식은 mask로 정의되며 1비트로 32번 반복한 것에 쉬프트로 인해
// 1111...00000000로 되어있다. 단순<<는 0을 채우니
// 여기서 vector_i의 나머지 값을 유지하며 하위 8비트만 0으로 하려면 vector_i와 mask를 and로 연결한다
// 그러면 하위 8비트를 제외한 기존의 상위비트는 mask의 1111..로 인해 0이면 0을 1이면 1을 내보내는 버퍼역할을,
// 하위 8비트는 mask의 0으로 인해 and 하면 vector_o 또한 0으로 출력하기 때문이다.  
    wire [31:0] vector_o = vector_i & mask;
//-------------------------------------



//------------- problem 3 -------------
// - bit extension
// input으로 2개의 서로 다른 타입의 data가 들어온다고 하자.
    wire        [3:0] num_1 =  7;
    wire signed [3:0] num_2 = -4;
// num_1은 unsigned이니 0111이 되고 num_2는 signed이니 4 = 0100 -> 2보수로 1100이 된다.
// 2개의 input data들을 더하여 다음 변수에 저장하려 한다.
    wire signed [4:0] result = num_1 + num_2; // error code
// 위 code는 error code이다. 서로 다른 type의 변수를 더하기 때문에
// 올바른 계산결과과 도출되지 않는다.
// $signed() 문법을 사용하여 올바르게 고쳐보자.
// hint : $signed() 와 Combine operation을 모두 사용해야 한다.

// fill your code here
    wire signed [4:0] result = {1'b0, $signed(num_1)} + num2;
// 본래 bit extension은 자동으로 일어나고 unsigned면 0비트 상위 추가
// signed면 MSB가 상위비트로 자동 추가된다
// 하지만 num_1 같은 경우에는 $signed로 바꾸어 줬으니 수동으로 bit extension을 해야한다고 추측했다.
// 따라서 num_1의 MSB인 0을 결합 연산자로 추가해준다 .
//-------------------------------------
