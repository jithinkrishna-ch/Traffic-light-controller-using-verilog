module traffic_sys(
    output reg [2:0] north_light, 
    output reg [2:0] west_light, 
    output reg [2:0] south_light, 
    output reg [2:0] east_light,
    output reg [3:0] count,
    input clk,
    input reset,
    input t1, t2, t3, t4
);

    // State encoding
    parameter [2:0] 
        s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, 
        s4 = 3'b100, s5 = 3'b101, s6 = 3'b110, s7 = 3'b111;

    // State and counter
    reg [2:0] state;

    // State transition logic (sequential logic)
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= s0;
            count <= 4'b0000;
        end else begin
            case (state)
                s0: begin
                    if ((count == 4'b1111) || (t1 == 1'b0)) begin
                        count <= 4'b0000;
                        state <= s1;
                    end else begin
                        count <= count + 1;
                    end
                end

                s1: begin
                    if (count == 4'b0011) begin
                        count <= 4'b0000;
                        state <= s2;
                    end else begin
                        count <= count + 1;
                    end
                end

                s2: begin
                    if ((count == 4'b1111) || (t2 == 1'b0)) begin
                        count <= 4'b0000;
                        state <= s3;
                    end else begin
                        count <= count + 1;
                    end
                end

                s3: begin
                    if (count == 4'b0011) begin
                        count <= 4'b0000;
                        state <= s4;
                    end else begin
                        count <= count + 1;
                    end
                end

                s4: begin
                    if ((count == 4'b1111) || (t3 == 1'b0)) begin
                        count <= 4'b0000;
                        state <= s5;
                    end else begin
                        count <= count + 1;
                    end
                end

                s5: begin
                    if (count == 4'b0011) begin
                        count <= 4'b0000;
                        state <= s6;
                    end else begin
                        count <= count + 1;
                    end
                end

                s6: begin
                    if ((count == 4'b1111) || (t4 == 1'b0)) begin
                        count <= 4'b0000;
                        state <= s7;
                    end else begin
                        count <= count + 1;
                    end
                end

                s7: begin
                    if (count == 4'b0011) begin
                        count <= 4'b0000;
                        state <= s0;
                    end else begin
                        count <= count + 1;
                    end
                end

                default: begin
                    state <= s0;
                    count <= 4'b0000;
                end
            endcase
        end
    end

    // Output logic based on state (combinational logic)
    always @(*) begin
        // Default all RED
        north_light = 3'b100;
        west_light  = 3'b100;
        south_light = 3'b100;
        east_light  = 3'b100;

        case (state)
            s0: north_light = 3'b001; // Green
            s1: north_light = 3'b010; // Yellow
            s2: west_light  = 3'b001;
            s3: west_light  = 3'b010;
            s4: south_light = 3'b001;
            s5: south_light = 3'b010;
            s6: east_light  = 3'b001;
            s7: east_light  = 3'b010;
        endcase
    end

endmodule
