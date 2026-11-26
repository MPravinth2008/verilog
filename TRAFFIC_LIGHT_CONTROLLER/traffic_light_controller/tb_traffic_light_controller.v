`timescale 1ns/1ps

module tb_traffic_light_controller;

    // FSM state encoding (must match RTL)
    localparam [2:0] S_NS_GREEN  = 3'd0;
    localparam [2:0] S_NS_YELLOW = 3'd1;
    localparam [2:0] S_ALL_RED   = 3'd2;
    localparam [2:0] S_EW_GREEN  = 3'd3;
    localparam [2:0] S_EW_YELLOW = 3'd4;
    localparam [2:0] S_WALK      = 3'd5;
    reg clk;
    reg rst;
    reg pedestrian_req;
    reg emergency;

    wire ns_red;
    wire ns_yellow;
    wire ns_green;

    wire ew_red;
    wire ew_yellow;
    wire ew_green;

    wire walk;
    wire [2:0] state_dbg;

    
    traffic_light_controller #(
        .GREEN_TICKS(5),
        .YELLOW_TICKS(2),
        .ALL_RED_TICKS(1),
        .WALK_TICKS(3)
    ) dut (
        .clk(clk),
        .rst(rst),
        .pedestrian_req(pedestrian_req),
        .emergency(emergency),

        .ns_red(ns_red),
        .ns_yellow(ns_yellow),
        .ns_green(ns_green),

        .ew_red(ew_red),
        .ew_yellow(ew_yellow),
        .ew_green(ew_green),

        .walk(walk),
        .state_dbg(state_dbg)
    );

    initial begin
        $dumpfile("wave_traffic_light_controller.vcd");
        $dumpvars(0, tb_traffic_light_controller);
    end

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    integer pass_count;
    integer fail_count;

    reg ok;
    reg ok_em_force;
    reg ok_em_release;
    reg em_all_red_ok;

    task check;
        input cond;
        input [255:0] msg;

        begin
            if (cond) begin
                pass_count = pass_count + 1;
                $display("CHECK PASS: %s", msg);
            end

            else begin
                fail_count = fail_count + 1;
                $display("CHECK FAIL: %s", msg);
            end
        end
    endtask

    task wait_state;
        input [2:0] target;
        input [31:0] timeout;
        output ok_out;

        integer count;
        begin
            count  = timeout;
            ok_out = 1'b0;

            while ((state_dbg !== target) && (count > 0)) begin
                @(posedge clk);
                #1;
                count = count - 1;
            end

            if (state_dbg === target)
                ok_out = 1'b1;
        end
    endtask

    initial begin

        pass_count = 0;
        fail_count = 0;

        rst            = 1'b1;
        pedestrian_req = 1'b0;
        emergency      = 1'b0;
    
        repeat (3) @(posedge clk);
        #1;
    
        check(
            ((state_dbg === S_NS_GREEN) &&
             (ns_green === 1'b1) &&
             (ns_red === 1'b0) &&
             (ns_yellow === 1'b0) &&
             (ew_red === 1'b1) &&
             (ew_green === 1'b0) &&
             (ew_yellow === 1'b0) &&
             (walk === 1'b0)),
            "Reset starts NS green and EW red"
        );
   
        @(negedge clk);
        rst = 1'b0;
  
        wait_state(S_NS_YELLOW, 32'd20, ok);
        #1;

        check(
            (ok &&
             (state_dbg === S_NS_YELLOW) &&
             (ns_yellow === 1'b1) &&
             (ew_red === 1'b1) &&
             (ns_green === 1'b0) &&
             (ew_green === 1'b0) &&
             (walk === 1'b0)),
            "NS green times out to NS yellow"
        );

        wait_state(S_ALL_RED, 32'd20, ok);
        #1;

        check(
            (ok &&
             (state_dbg === S_ALL_RED) &&
             (ns_red === 1'b1) &&
             (ew_red === 1'b1) &&
             (ns_yellow === 1'b0) &&
             (ew_yellow === 1'b0) &&
             (walk === 1'b0)),
            "NS yellow goes to all red"
        );

        wait_state(S_EW_GREEN, 32'd20, ok);
        #1;

        check(
            (ok &&
             (state_dbg === S_EW_GREEN) &&
             (ew_green === 1'b1) &&
             (ns_red === 1'b1) &&
             (ns_yellow === 1'b0) &&
             (ew_yellow === 1'b0) &&
             (walk === 1'b0)),
            "All red goes to EW green"
        );

        wait_state(S_EW_YELLOW, 32'd20, ok);
        #1;

        check(
            (ok &&
             (state_dbg === S_EW_YELLOW) &&
             (ew_yellow === 1'b1) &&
             (ns_red === 1'b1) &&
             (ew_green === 1'b0) &&
             (walk === 1'b0)),
            "EW green times out to EW yellow"
        );

        wait_state(S_ALL_RED, 32'd20, ok);
        #1;

        check(
            (ok &&
             (state_dbg === S_ALL_RED) &&
             (ns_red === 1'b1) &&
             (ew_red === 1'b1) &&
             (ns_yellow === 1'b0) &&
             (ew_yellow === 1'b0) &&
             (walk === 1'b0)),
            "EW yellow goes to all red"
        );

        wait_state(S_NS_GREEN, 32'd20, ok);
        #1;

        check(
            (ok &&
             (state_dbg === S_NS_GREEN) &&
             (ns_green === 1'b1) &&
             (ew_red === 1'b1) &&
             (walk === 1'b0)),
            "All red returns to NS green"
        );

        @(negedge clk);
        pedestrian_req = 1'b1;

        repeat (2) @(posedge clk);
        #1;

        pedestrian_req = 1'b0;

        wait_state(S_WALK, 32'd30, ok);
        #1;

        check(
            (ok &&
             (state_dbg === S_WALK) &&
             (walk === 1'b1) &&
             (ns_red === 1'b1) &&
             (ew_red === 1'b1) &&
             (ns_green === 1'b0) &&
             (ew_green === 1'b0)),
            "Latched pedestrian request reaches walk with all vehicles red"
        );
        wait_state(S_NS_GREEN, 32'd30, ok);
        #1;

        check(
            (ok &&
             (state_dbg === S_NS_GREEN) &&
             (ns_green === 1'b1) &&
             (ew_red === 1'b1) &&
             (walk === 1'b0)),
            "Walk completes and returns to NS green"
        );

        @(negedge clk);
        emergency = 1'b1;

        wait_state(S_ALL_RED, 32'd10, ok_em_force);
        #1;

        em_all_red_ok =
            ok_em_force &&
            (state_dbg === S_ALL_RED) &&
            (ns_red === 1'b1) &&
            (ew_red === 1'b1) &&
            (ns_green === 1'b0) &&
            (ew_green === 1'b0) &&
            (ns_yellow === 1'b0) &&
            (ew_yellow === 1'b0) &&
            (walk === 1'b0);

        repeat (2) @(posedge clk);

        @(negedge clk);
        emergency = 1'b0;

        wait_state(S_NS_GREEN, 32'd20, ok_em_release);
        #1;

        check(
            (em_all_red_ok &&
             ok_em_release &&
             (state_dbg === S_NS_GREEN) &&
             (ns_green === 1'b1) &&
             (ew_red === 1'b1)),
            "Emergency forces all red and releases safely to NS green"
        );

        if (fail_count == 0 && pass_count == 10) begin
            $display("");
            $display("========================================");
            $display("SUMMARY: traffic_light_controller PASS(%0d checks)", pass_count);
            $display("========================================");
        end

        else begin
            $display("");
            $display("========================================");
            $display("SUMMARY: traffic_light_controller FAIL(pass=%0d, fail=%0d)",
                     pass_count, fail_count);
            $display("========================================");
        end
        $finish;
    end
    initial begin
        #100000;
        $display("SUMMARY: traffic_light_controller FAIL(timeout)");
        $finish;
    end
endmodule