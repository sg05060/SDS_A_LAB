module FULL_ADDER
#(
    // No use any parameter
)
(
    // Declare input, output port
    input   wire    a,      // input a
    input   wire    b,      // input b
    input   wire    cin,    // input carry in
    
    output  wire    s,      // output sum
    output  wire    cout    // output carry out
);
    // Logic
    // assign s = a^b^cin  //  -> full adder의 논리표를 보고 gate 수준에서 logic을 서술하라.(sum)
    // assign cout = (a&b)|(a&cin)|(b&cin)    //  -> full adder의 논리표를 보고 gate 수준에서 logic을 서술하라.(cout)

endmodule