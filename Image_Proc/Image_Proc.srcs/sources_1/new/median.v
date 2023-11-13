`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.05.2023 10:09:11
// Design Name: 
// Module Name: median
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module MedianFilter (
  input wire clk,
  input wire reset,
  input wire [7:0] pixel_in,
  output reg [7:0] pixel_out
);

  // Create a buffer to store the input pixels
  reg [7:0] buffer [2:0];

  // Create a register to store the median pixel
  reg [7:0] median;

  // Register for swapping values during sorting
  reg [7:0] temp;

  // State registers
  reg [1:0] state;
  reg [1:0] next_state;

  always_comb initial begin
    next_state = state;

    // Determine the next state based on the current state
    case (state)
      2'b00: next_state = 2'b01;
      2'b01: next_state = 2'b10;
      2'b10: next_state = 2'b00;
    endcase
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      // Reset the state and buffer
      state <= 2'b00;
      buffer[0] <= 8'h00;
      buffer[1] <= 8'h00;
      buffer[2] <= 8'h00;
    end else begin
      state <= next_state;

      case (state)
        2'b00: begin
          // Shift pixels in the buffer
          buffer[0] <= buffer[1];
          buffer[1] <= buffer[2];
          buffer[2] <= pixel_in;
        end

        2'b01: begin
          // Sort the pixels in parallel
          if (buffer[0] > buffer[1]) begin
            temp = buffer[0];
            buffer[0] = buffer[1];
            buffer[1] = temp;
          end

          if (buffer[1] > buffer[2]) begin
            temp = buffer[1];
            buffer[1] = buffer[2];
            buffer[2] = temp;
          end
        end

        2'b10: begin
          // Output the median pixel
          median <= buffer[1];
        end
      endcase
    end
  end

  assign pixel_out = median;

endmodule




