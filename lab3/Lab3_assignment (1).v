//------------- problem 1 -------------
// - Combine operation
// 다음과 같은 memory를 사용하고자 한다.
    reg [7:0] memory [0:15];
// memory의 1번째 word의 상위 2bit를 data로 변환하려한다.
    wire data = 2'b10;
    memory[1][7:6] = data  // *error code
// 이전 강의를 통해 위와 같은 memory접근은 불가능하다는 사실을 알 수 있다.
// Combine operation(or 다른 방법을 활용해도 괜찮다!)을 활용하여 memory의 2번째 word의 상위 2bit에 접근하는
// code를 완성해보자.

// fill your code here
    memory[1] = {data,6'b000000};
// memory[1]의 [7:6]bit에 접근해야 하므로, concatenation을 이용하여 상위 2bit에 data를 할당하고, 아래를 0으로 주어 8'b10000000을 만들었다.
// 의문점은 기존 메모리의 0~5bit 값이 0으로 바뀌었는데, 이를 건드리지 않고 상위 2bit만 바꾸려면 어떻게 써야하는지(상위 2bit만 바꾸는 방법)
//-------------------------------------


//------------- problem 2 -------------
// - Bitwise operation
// 다음과 같은 vector가 input으로 선언되었다고 하자.
    wire [31:0] vector_i;
// 위 vector의 하위 8-bit를 0으로 할당하고, 나머지는 그대로 사용하고자 한다.
// 이를 mask 변수와 Bitwise operation을 적절히 사용하여 나타내어 보자. 

// fill your code here
    parameter N = 8; 
    wire [31:0] mask = {32{1'b1}} << N; //1이 32-bit인데 8-bit shift이므로 11111111.....100000000인 상태

    wire [31:0] vector_o = vector_i & mask;
// bitwise operation은 각 bit별로 비교한다. mask는 하위 8-bit가 0이므로, vector_i의 값에 관계없이 and operation을 했을시에 하위 8-bit를 0으로 할당하고, 
// 나머지 상위 bit들은 vector_i의 value를 따라간다.
//-------------------------------------



//------------- problem 3 -------------
// - bit extension
// input으로 2개의 서로 다른 타입의 data가 들어온다고 하자.
    wire        [3:0] num_1 =  7;
    wire signed [3:0] num_2 = -4;
// 2개의 input data들을 더하여 다음 변수에 저장하려 한다.
    wire signed [4:0] result = num_1 + num_2; // error code
// 위 code는 error code이다. 서로 다른 type의 변수를 더하기 때문에
// 올바른 계산결과과 도출되지 않는다.
// $signed() 문법을 사용하여 올바르게 고쳐보자.
// hint : $signed() 와 Combine operation을 모두 사용해야 한다.

// fill your code here

    wire signed [4:0] result = $signed({1'b0,num_1)) + num_2;

// signed 문법을 사용한다는 것은 num_1을 signed로 바꾸겠다는 의미이다. Signed는 빈 자리를 MSB로 채우는데, unsigned는 0으로 extension 해야한다.
// 따라서 먼저 1-bit 0을 MSB에 붙여서 5-bit짜리를 만든 후에 sign으로 바꾸어주면 값의 변화 없이 extension이 되었다.
//-------------------------------------
