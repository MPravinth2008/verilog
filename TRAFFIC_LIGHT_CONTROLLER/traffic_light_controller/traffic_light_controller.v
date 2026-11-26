`timescale 1ns/1ps

module traffic_light_controller #(
    parameter GREEN_TICKS   = 5,
    parameter YELLOW_TICKS  = 2,
    parameter ALL_RED_TICKS = 1,
    parameter WALK_TICKS    = 3
) (
    input  wire       clk,
    input  wire       rst,
    input  wire       pedestrian_req,
    input  wire       emergency,
    output reg        ns_red,
    output reg        ns_yellow,
    output reg        ns_green,
    output reg        ew_red,
    output reg        ew_yellow,
    output reg        ew_green,
    output reg        walk,
    output wire [2:0] state_dbg
);
    localparam [2:0] S_NS_GREEN  = 3'd0;
    localparam [2:0] S_NS_YELLOW = 3'd1;
    localparam [2:0] S_ALL_RED   = 3'd2;
    localparam [2:0] S_EW_GREEN  = 3'd3;
    localparam [2:0] S_EW_YELLOW = 3'd4;
    localparam [2:0] S_WALK      = 3'd5;

    reg [2:0] state_q;
    reg [2:0] state_d;
    reg [31:0] timer_q;
    reg [31:0] timer_d;
    reg ped_pending_q;
    reg ped_pending_d;
    reg all_red_to_ns_q;
    reg all_red_to_ns_d;

    assign state_dbg = state_q;

    always @* begin

        ns_red = 1'b1;
        ns_yellow = 1'b0;
        ns_green  = 1'b0;

        ew_red = 1'b1;
        ew_yellow = 1'b0;
        ew_green  = 1'b0;

        walk = 1'b0;

        case (state_q)

            S_NS_GREEN: begin
                ns_red   = 1'b0;
                ns_green = 1'b1;
            end

            S_NS_YELLOW: begin
                ns_red    = 1'b0;
                ns_yellow = 1'b1;
            end

            S_ALL_RED: begin
               
            end

            S_EW_GREEN: begin
                ew_red   = 1'b0;
                ew_green = 1'b1;
            end

            S_EW_YELLOW: begin
                ew_red    = 1'b0;
                ew_yellow = 1'b1;
            end

            S_WALK: begin
                
                walk = 1'b1;
            end

            default: begin
                
            end

        endcase
    end

    reg [31:0] duration_raw;

    always @* begin
        case (state_q)

            S_NS_GREEN,
            S_EW_GREEN:
                duration_raw = GREEN_TICKS;

            S_NS_YELLOW,
            S_EW_YELLOW:
                duration_raw = YELLOW_TICKS;

            S_ALL_RED:
                duration_raw = ALL_RED_TICKS;

            S_WALK:
                duration_raw = WALK_TICKS;

            default:
                duration_raw = 32'd1;

        endcase
    end

    
    wire [31:0] duration =
        (duration_raw == 32'd0) ? 32'd1 : duration_raw;

    wire timer_done = (timer_q >= (duration - 32'd1));

    always @* begin
     
        state_d         = state_q;
        timer_d         = timer_q;
        ped_pending_d   = ped_pending_q;
        all_red_to_ns_d = all_red_to_ns_q;
     
        if (state_q != S_WALK && pedestrian_req)
            ped_pending_d = 1'b1;
     
        if (emergency) begin

            state_d = S_ALL_RED;
            timer_d = 32'd0;
            all_red_to_ns_d = 1'b1;
        end    
        else if (timer_done) begin

            case (state_q)

                S_NS_GREEN: begin
                    state_d = S_NS_YELLOW;
                    timer_d = 32'd0;
                    all_red_to_ns_d = 1'b0;
                end

                S_NS_YELLOW: begin
                    state_d = S_ALL_RED;
                    timer_d = 32'd0;
                    all_red_to_ns_d = 1'b0;
                end

                S_ALL_RED: begin

                    if (ped_pending_q || pedestrian_req) begin
                        state_d = S_WALK;
                        timer_d = 32'd0;
                        all_red_to_ns_d = 1'b1;
                    end

                    else if (all_red_to_ns_q) begin
                        state_d = S_NS_GREEN;
                        timer_d = 32'd0;
                        all_red_to_ns_d = 1'b0;
                    end

                    else begin
                        state_d = S_EW_GREEN;
                        timer_d = 32'd0;
                        all_red_to_ns_d = 1'b1;
                    end
                end

                S_EW_GREEN: begin
                    state_d = S_EW_YELLOW;
                    timer_d = 32'd0;
                    all_red_to_ns_d = 1'b1;
                end

                S_EW_YELLOW: begin
                    state_d= S_ALL_RED;
                    timer_d= 32'd0;
                    all_red_to_ns_d = 1'b1;
                end

                S_WALK: begin
                    state_d= S_NS_GREEN;
                    timer_d= 32'd0;
                    all_red_to_ns_d = 1'b0;
                end

                default: begin
                    state_d= S_NS_GREEN;
                    timer_d= 32'd0;
                    all_red_to_ns_d = 1'b0;
                end

            endcase
        end

        else begin
            timer_d = timer_q + 32'd1;
        end

        if (state_d == S_WALK)
            ped_pending_d = 1'b0;

    end

    always @(posedge clk) begin

        if (rst) begin

            state_q<= S_NS_GREEN;
            timer_q<= 32'd0;
            ped_pending_q<= 1'b0;
            all_red_to_ns_q <= 1'b0;

        end

        else begin

            state_q <= state_d;
            timer_q <= timer_d;
            ped_pending_q <= ped_pending_d;
            all_red_to_ns_q <= all_red_to_ns_d;

        end

    end

endmodule