module steer_en(clk,rst_n,lft_ld, rght_ld,ld_cell_diff,en_steer,rider_off);

  input clk;				// 50MHz clock
  input rst_n;				// Active low asynch reset
  input [11:0] lft_ld, rght_ld;		// coming from the A2D interface
  output [11:0] ld_cell_diff;
  output logic en_steer;	// enables steering (goes to balance_cntrl)
  output logic rider_off;	// pulses high for one clock on transition back to initial state
  
 // wires 
  
 logic  tmr_full;			// asserted when timer reaches 1.3 sec
 logic  sum_gt_min;			// asserted when left and right load cells together exceed min rider weight
 logic  sum_lt_min;			// asserted when left_and right load cells are less than min_rider_weight
 logic  diff_gt_1_4;		// asserted if load cell difference exceeds 1/4 sum (rider not situated)
 logic  diff_gt_15_16;		// asserted if load cell difference is great (rider stepping off)
 logic clr_tmr;		// clears the 1.3sec timer
  
reg [25:0] count;

localparam MIN_RIDER_WEIGHT = 100;	// to be updated - error

// code begins
//

assign sum_gt_min = ((lft_ld + rght_ld) > MIN_RIDER_WEIGHT) ? 1 : 0;

always @ (posedge clk, negedge rst_n) begin
	if(!rst_n) begin
		count <= 0;
	end
	else if (clr_tmr) count <=0;
	else if (&count) count <= 0;
	else count <= count + 1;
end

wire [11:0] rider_weight, rider_weight_abs;

assign rider_weight = lft_ld - rght_ld;
assign rider_wieght_abs = rider_weight[11] ? ((~rider_weight)+1) : rider_weight;

assign diff_gt_1_4 = (rider_weight_abs > (lft_ld + rght_ld)/4);

assign diff_gt_15_16 = (rider_weight_abs > 15*((lft_ld + rght_ld)/16));

assign ld_cell_diff = rider_weight_abs;


//
// code ends


 
 
 
 // timer implementation - which counts until 1.3 seconds
 
 
 // enumerated type to encode states to view properly in waves.
typedef enum reg[1:0] {IDLE, WAIT, STEER_EN} SM_state;
SM_state nxt_state, state;
  
  // sequential state logic - using non blocking assignment
always_ff @(posedge clk, negedge rst_n) begin
	if (!rst_n)
	state <= IDLE;
	else
	state <= nxt_state;
	
end




// combinational logic to generate the next state logic
always_comb begin
//assigning to reset values to avoid latches
nxt_state = IDLE;
clr_tmr = 0; 
rider_off = 0;
en_steer = 0; 
case (state)
	IDLE: if (sum_gt_min) begin  nxt_state = WAIT; clr_tmr = 1; end 
	      else nxt_state = IDLE;
	WAIT: begin
//		
		if (sum_lt_min) begin nxt_state = IDLE; rider_off = 1 ; end
	        else if (diff_gt_1_4) begin
			nxt_state = WAIT;
			clr_tmr = 1;
		end
		else if (tmr_full) begin
			nxt_state = STEER_EN;
			en_steer = 1;
		end
       		else nxt_state = WAIT;
	       end
	STEER_EN: begin
		  if (sum_lt_min) begin  nxt_state = IDLE; rider_off = 1; end
		  else if (diff_gt_15_16) begin nxt_state = WAIT; clr_tmr = 1; end 
		  else begin  nxt_state = STEER_EN; en_steer = 1; end
end
endcase
end


endmodule