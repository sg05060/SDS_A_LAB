// Lab4 assignments
`timescale 1ns / 1ps

// TestBench skeleton code
module tb_BLACK_BOX ();
    parameter DATA_WIDTH = 8;
    
    // *********************************
    // testbench signal 
    // fill signal type code here

    //type 기입함
        reg clk;
        reg rst;
        reg run_i;
        reg data_in;
        wire data_out;
        wire state;
    // *********************************


    // *********************************
    // DUT Instance
    // fill DUT Instance port here
        BLACK_BOX #(
            



        ) BLACK_BOX_INST ( 
            
        );
    // *********************************



    // *********************************
    // make clock signal here
        always #5 clk = ~clk;
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
        
        //여기바꿨음
        @(posedge clk);
        state=1;
        #10
            run_i = 1;
        @(posedge clk);
        

        //how to control done part ?? 
        @(state==2'b10);   


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
