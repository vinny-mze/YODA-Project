`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Muzerengwa VI
// 
// Create Date: 09.05.2023 10:06:20
// Design Name: 
// Module Name: median_tb
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

module median_tb;

  // Define constants
  parameter WIDTH = 3;
  parameter HEIGHT = 3;
  parameter NUM_PIXELS = WIDTH*HEIGHT;

  // Define inputs and outputs
  reg clk;
  reg rst;
  reg [7:0] pixel_in;
  wire [7:0] pixel_out;

  // Instantiate DUT
  median dut(
    .clk(clk),
    .reset(rst),
    .pixel_in(pixel_in),
    .pixel_out(pixel_out)
  );

  // Define file input and output
  reg [7:0] img [0:WIDTH*HEIGHT-1];
  integer img_file;
  integer denoised_file;
  integer i;

  // Open input and output files
  initial begin
    img_file = $fopen("img.txt", "r");
    denoised_file = $fopen("denoised.txt", "w");
  end

  // Read input pixels from file
  initial begin
    for (i = 0; i < NUM_PIXELS; i = i + 1) begin
      $fscanf(img_file, "%b\n", img[i]);
    end
  end

  // Apply input pixels to DUT and write output pixels to file
  initial begin
    clk = 0;
    rst = 1;
    #10;
    rst = 0;
    for (i = 0; i < NUM_PIXELS; i = i + 1) begin
      pixel_in = img[i];
      #10;
      $fdisplay(denoised_file, "%b", pixel_out);
    end
    $fclose(img_file);
    $fclose(denoised_file);
    $finish;
  end

  // Generate clock signal
  always #5 clk = ~clk;

endmodule



