// Lab4 assignments
`timescale 1ns / 1ps

// TestBench skeleton code
module tb_BLACK_BOX ();
    parameter DATA_WIDTH = 8;
    
    // *********************************
    // testbench signal 
    // fill signal type code here
        reg clk;
        reg rst;
        reg run_i;
        reg [DATA_WIDTH - 1 : 0 ] data_in;
        wire [DATA_WIDTH - 1 : 0 ] data_out;
        wire [1:0] state;

    // testbench에서는 input을 reg로, output을 wire로 선언한다.
    // *********************************


    // *********************************
    // DUT Instance
    // fill DUT Instance port here
        BLACK_BOX #(    8
            
        ) BLACK_BOX_INST ( clk, rst, run_i, data_in,
                         data_out, state
            
        );
    
    // 인스턴스를 불러올 때 #을 사용하여 parameter를 수정할 수 있다.
    // 또한 감지신호들을 순서에 맞게 입력하거나 .clk(clk)와 같이 입력할 수 있다.
    // *********************************



    // *********************************
    // make clock signal here
        always #10 clk = ~clk;
    // 10을 주기로 clk값이 반전되는 신호이다.
    // *********************************


    initial begin
        // initialize signals
        clk         = 0;
        rst         = 0;
        run_i       = 0;
        data_in     = {DATA_WIDTH[1'b0]};

        
        // turn on rst signal
        #50
             rst = 1;
        //우선 초기상태에서 50후에 rst = 1이되어 ready상태가 된다.
        #10
            data_in = 2'b011;
        //10이란 시간 지난 후 3을 입력한다.
        #100
            $display("data_out = %d",data_out);
        // 우선 출력이 얼마나 지나고 나오는지 모르니
        // 여유롭게 100이란 시간 이후 data_out의 값을 보여주도록 하였다.
        // 만약 언제 나오는지 확인하려면 시뮬레이션을 돌리면 확인이 가능하다.
        
        error code // Remove here!!

        $stop;

        // fill your test plane here


    end

endmodule





// DUT module
// ****Do not modify this code.****

module BLACK_BOX #(
    parameter DATA_WIDTH = 8
    ) 
    ( 
        input   wire                        clk,
        input   wire                        rst,
        input   wire                        run_i,
        input   wire    [DATA_WIDTH-1:0]    data_in,
        output  reg     [DATA_WIDTH-1:0]    data_out,
        output  wire    [1:0]               state
    );
    
        localparam S_IDLE	= 2'b00;
        localparam S_READY	= 2'b01;
        localparam S_RUN	= 2'b10;
        localparam S_DONE  	= 2'b11;
        localparam DELAY = 5;
         

        reg     [1:0]               c_state;
        reg     [1:0]               n_state;

        wire                        rst_n;
        reg     [2:0]               rst_delay_buffer;
        reg     [DELAY-1:0]         delay_buffer;
        reg     [DATA_WIDTH-1:0]    delay_data_in_buffer [DELAY-1:0];

        reg is_done;

        always @(posedge clk) begin
            if(!rst) begin
                c_state <= S_IDLE;
            end else begin
                c_state <= n_state;
            end
        end

        always @(*) 
            begin
                n_state = S_IDLE; 
                case(c_state)
                S_IDLE : if(rst_n)
                            n_state = S_READY;
                S_READY: if(run_i)
                            n_state = S_RUN;
                         else
                            n_state = S_READY;
                S_RUN  : if(is_done)
                            n_state = S_DONE;
                         else 
                            n_state = S_RUN;
                S_DONE: n_state = S_IDLE;
                endcase
        end

        always @(posedge clk) begin
            rst_delay_buffer[0]                 <= rst;
            rst_delay_buffer[1]                 <= rst_delay_buffer[0];
            rst_delay_buffer[2]                 <= rst_delay_buffer[1];
        end
        
        assign rst_n = (rst == 0)? 0 : rst_delay_buffer[2]; 

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            data_out                            <= {DATA_WIDTH{1'b0}};
            delay_buffer[0]                     <= 1'b0;
            delay_data_in_buffer[0]             <= 1'b0;
        end else if(run_i) begin
            delay_buffer[0]                     <= 1'b1;
            delay_data_in_buffer[0]             <= data_in;
        end 
            // else, keep state
    end

    genvar i;
    generate   
        for (i = 0; i < DELAY-1 ; i = i + 1) begin
            always @(posedge clk) begin
                if(!rst_n) begin
                    delay_buffer[i+1]           <= 1'b0;
                    delay_data_in_buffer[i+1]   <= 1'b0;
                end else begin
                    delay_buffer[i+1]           <= delay_buffer[i];
                    delay_data_in_buffer[i+1]   <= delay_data_in_buffer[i];
                end
            end
        end
    endgenerate


    always @(*) begin
        if(delay_buffer[DELAY-1] == 1'b1) begin
            data_out = delay_data_in_buffer[DELAY-1] * 3;
        end else begin
            data_out = 0;
        end

        if(delay_buffer[DELAY-2] == 1'b1) begin
            is_done = 1;
        end else begin
            is_done = 0;
        end
    end

    assign state = c_state;

endmodule
