// 337 TA Provided Lab 2 Testbench
// This code serves as a test bench for the 1 bit adder design 

`timescale 1ns / 100ps

module tb_adder_16bit
();
	// Define local parameters used by the test bench
	localparam NUM_INPUT_BITS			= 16;
	localparam NUM_OUTPUT_BITS		= NUM_INPUT_BITS + 1;
	localparam MAX_OUTPUT_BIT			= NUM_OUTPUT_BITS - 1;
	localparam NUM_TEST_BITS 			= (NUM_INPUT_BITS * 2) + 1;
	localparam MAX_TEST_BIT				= NUM_TEST_BITS - 1;
	localparam NUM_TEST_CASES 		= 2 ** NUM_TEST_BITS;
	localparam MAX_TEST_VALUE 		= NUM_TEST_CASES - 1;
	localparam TEST_A_BIT					= 0;
	localparam TEST_B_BIT					= NUM_INPUT_BITS;
	localparam TEST_CARRY_IN_BIT	= MAX_TEST_BIT;
	localparam TEST_SUM_BIT				= 0;
	localparam TEST_CARRY_OUT_BIT	= MAX_OUTPUT_BIT;
	localparam TEST_DELAY					= 10;
	
	// Declare Design Under Test (DUT) portmap signals
	reg	[15:0]tb_a;
	reg	[15:0]tb_b;
	reg	tb_carry_in;
	wire	[15:0]tb_sum;
	wire	tb_carry_out;
   //wire 	     tb_carrys;
   
	// Declare test bench signals
	integer tb_test_case;
	reg [MAX_TEST_BIT:0] tb_test_inputs;
	reg [MAX_OUTPUT_BIT:0] tb_expected_outputs;
	
	// DUT port map
        adder_16bit DUT(.a(tb_a), .b(tb_b), .carry_in(tb_carry_in), .sum(tb_sum), .overflow(tb_carry_out));
	// Test bench process
	initial
	begin
	   // Send test input to the design
	   
	   //test case1
	   tb_a=16'b0101010101010101;
	   tb_b=16'b0101010101010101;
	   tb_carry_in=1'b1;
	   #1;
	   tb_expected_outputs = tb_a + tb_b + tb_carry_in;
	   // Wait for DUT to process the inputs
	   #(TEST_DELAY - 1);
	   // Check the DUT's Sum output value
	   if(tb_expected_outputs[15:0] == tb_sum)
	     begin
		$info("Correct Sum value for test case %d!", tb_test_case);
	     end
	   else
	     begin
		$error("Incorrect Sum value for test case %d!", tb_test_case);
	     end
	   // Check the DUT's Carry Out output value
	   if(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
	     begin
		$info("Correct Carry Out value for test case %d!", tb_test_case);
	     end
	   else
	     begin
		$error("Incorrect Carry Out value for test case %d!", tb_test_case);
	     end

	   //test case2
	   tb_a=16'b1010101010101010;
	   tb_b=16'b1010101010101010;
	   tb_carry_in=1'b1;
	   #1;
	   tb_expected_outputs = tb_a + tb_b + tb_carry_in;
	   // Wait for DUT to process the inputs
	   #(TEST_DELAY - 1);
	   // Check the DUT's Sum output value
	   if(tb_expected_outputs[15:0] == tb_sum)
	     begin
		$info("Correct Sum value for test case %d!", tb_test_case);
	     end
	   else
	     begin
		$error("Incorrect Sum value for test case %d!", tb_test_case);
	     end
	   // Check the DUT's Carry Out output value
	   if(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
	     begin
		$info("Correct Carry Out value for test case %d!", tb_test_case);
	     end
	   else
	     begin
		$error("Incorrect Carry Out value for test case %d!", tb_test_case);
	     end

	    //test case3
	   tb_a=16'b0101010101010101;
	   tb_b=16'b1010101010101010;
	   tb_carry_in=1'b1;
	   #1;
	   tb_expected_outputs = tb_a + tb_b + tb_carry_in;
	   // Wait for DUT to process the inputs
	   #(TEST_DELAY - 1);
	   // Check the DUT's Sum output value
	   if(tb_expected_outputs[15:0] == tb_sum)
	     begin
		$info("Correct Sum value for test case %d!", tb_test_case);
	     end
	   else
	     begin
		$error("Incorrect Sum value for test case %d!", tb_test_case);
	     end
	   // Check the DUT's Carry Out output value
	   if(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
	     begin
		$info("Correct Carry Out value for test case %d!", tb_test_case);
	     end
	   else
	     begin
		$error("Incorrect Carry Out value for test case %d!", tb_test_case);
	     end

	     //test case4
	   tb_b=16'b0101010101010101;
	   tb_a=16'b1010101010101010;
	   tb_carry_in=1'b1;
	   #1;
	   tb_expected_outputs = tb_a + tb_b + tb_carry_in;
	   // Wait for DUT to process the inputs
	   #(TEST_DELAY - 1);
	   // Check the DUT's Sum output value
	   if(tb_expected_outputs[15:0] == tb_sum)
	     begin
		$info("Correct Sum value for test case %d!", tb_test_case);
	     end
	   else
	     begin
		$error("Incorrect Sum value for test case %d!", tb_test_case);
	     end
	   // Check the DUT's Carry Out output value
	   if(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
	     begin
		$info("Correct Carry Out value for test case %d!", tb_test_case);
	     end
	   else
	     begin
		$error("Incorrect Carry Out value for test case %d!", tb_test_case);
	     end

	    //test case5
	   tb_a=16'b0101010101010101;
	   tb_b=16'b0101010101010101;
	   tb_carry_in=1'b0;
	   #1;
	   tb_expected_outputs = tb_a + tb_b + tb_carry_in;
	   // Wait for DUT to process the inputs
	   #(TEST_DELAY - 1);
	   // Check the DUT's Sum output value
	   if(tb_expected_outputs[15:0] == tb_sum)
	     begin
		$info("Correct Sum value for test case %d!", tb_test_case);
	     end
	   else
	     begin
		$error("Incorrect Sum value for test case %d!", tb_test_case);
	     end
	   // Check the DUT's Carry Out output value
	   if(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
	     begin
		$info("Correct Carry Out value for test case %d!", tb_test_case);
	     end
	   else
	     begin
		$error("Incorrect Carry Out value for test case %d!", tb_test_case);
	     end

	   //test case6
	   tb_a=16'b1010101010101010;
	   tb_b=16'b1010101010101010;
	   tb_carry_in=1'b0;
	   #1;
	   tb_expected_outputs = tb_a + tb_b + tb_carry_in;
	   // Wait for DUT to process the inputs
	   #(TEST_DELAY - 1);
	   // Check the DUT's Sum output value
	   if(tb_expected_outputs[15:0] == tb_sum)
	     begin
		$info("Correct Sum value for test case %d!", tb_test_case);
	     end
	   else
	     begin
		$error("Incorrect Sum value for test case %d!", tb_test_case);
	     end
	   // Check the DUT's Carry Out output value
	   if(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
	     begin
		$info("Correct Carry Out value for test case %d!", tb_test_case);
	     end
	   else
	     begin
		$error("Incorrect Carry Out value for test case %d!", tb_test_case);
	     end

	    //test case7
	   tb_a=16'b0101010101010101;
	   tb_b=16'b1010101010101010;
	   tb_carry_in=1'b0;
	   #1;
	   tb_expected_outputs = tb_a + tb_b + tb_carry_in;
	   // Wait for DUT to process the inputs
	   #(TEST_DELAY - 1);
	   // Check the DUT's Sum output value
	   if(tb_expected_outputs[15:0] == tb_sum)
	     begin
		$info("Correct Sum value for test case %d!", tb_test_case);
	     end
	   else
	     begin
		$error("Incorrect Sum value for test case %d!", tb_test_case);
	     end
	   // Check the DUT's Carry Out output value
	   if(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
	     begin
		$info("Correct Carry Out value for test case %d!", tb_test_case);
	     end
	   else
	     begin
		$error("Incorrect Carry Out value for test case %d!", tb_test_case);
	     end

	     //test case8
	   tb_b=16'b0101010101010101;
	   tb_a=16'b1010101010101010;
	   tb_carry_in=1'b0;
	   #1;
	   tb_expected_outputs = tb_a + tb_b + tb_carry_in;
	   // Wait for DUT to process the inputs
	   #(TEST_DELAY - 1);
	   // Check the DUT's Sum output value
	   if(tb_expected_outputs[15:0] == tb_sum)
	     begin
		$info("Correct Sum value for test case %d!", tb_test_case);
	     end
	   else
	     begin
		$error("Incorrect Sum value for test case %d!", tb_test_case);
	     end
	   // Check the DUT's Carry Out output value
	   if(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
	     begin
		$info("Correct Carry Out value for test case %d!", tb_test_case);
	     end
	   else
	     begin
		$error("Incorrect Carry Out value for test case %d!", tb_test_case);
	     end

	   //test case9
	     //test case8
	   tb_a=8'hffff;
	   tb_b=8'hffff;
	   tb_carry_in=1'b0;
	   #1;
	   tb_expected_outputs = tb_a + tb_b + tb_carry_in;
	   // Wait for DUT to process the inputs
	   #(TEST_DELAY - 1);
	   // Check the DUT's Sum output value
	   if(tb_expected_outputs[15:0] == tb_sum)
	     begin
		$info("Correct Sum value for test case %d!", tb_test_case);
	     end
	   else
	     begin
		$error("Incorrect Sum value for test case %d!", tb_test_case);
	     end
	   // Check the DUT's Carry Out output value
	   if(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
	     begin
		$info("Correct Carry Out value for test case %d!", tb_test_case);
	     end
	   else
	     begin
		$error("Incorrect Carry Out value for test case %d!", tb_test_case);
	     end
	end
	
	// Wrap-up process
	final
	begin
		if(NUM_TEST_CASES != tb_test_case)
		begin
			// Didn't run the test bench through all test cases
			$display("This test bench was not run long enough to execute all test cases. Please run this test bench for at least a total of %d ns", (NUM_TEST_CASES * TEST_DELAY));
		end
		else
		begin
			// Test bench was run to completion
			$display("This test bench has run to completion");
		end
	end
endmodule
