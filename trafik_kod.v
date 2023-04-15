module Trafik_Sinyalizasyonu(input wire clk, output reg [2:0] led);
    reg [27:0] counter;
    reg [1:0] state;
    always @(posedge clk) begin
        counter <= counter + 1;
        case(state)
            2'b00: begin
                if (counter >= 240_000_000) begin
                    state <= 2'b01;
                    counter <= 0;
                end
                led <= 3'b110;
            end
            2'b01: begin
                if (counter >= 50_000_000) begin
                    state <= 2'b10;
                    counter <= 0;
                end
                led <= 3'b101;
            end
            2'b10: begin
                if (counter >= 120_000_000) begin
                    state <= 2'b00;
                    counter <= 0;
                end
                led <= 3'b011;
            end
            default: begin
                state <= 2'b00;
                led <= 3'b100;
            end
        endcase
    end
endmodule
