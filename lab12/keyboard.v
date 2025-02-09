module keyboard(
clk,
ps2_clk,
ps2_data,
assic,
en
);

input clk;
input ps2_clk;
input ps2_data;
output [7:0]assic;
output reg en;

reg nextdata_n;
reg [1:0]state;

wire [7:0]buttonword;
reg [7:0]code;
wire ready;
wire overflow;
reg clrn;
parameter S0 = 0, S1 = 1, S2 = 2;

initial
begin
nextdata_n=0;
clrn=0;
state=S0;
end


button_to_assic b_to_a(
.clk(clk),
.buttonword(code),
.assic(assic)
);


ps2_keyboard ps2keyboard(
.clk(clk),
.clrn(clrn),
.ps2_clk(ps2_clk),
.ps2_data(ps2_data),
.data(buttonword),
.ready(ready),
.nextdata_n(nextdata_n),
.overflow(overflow)
);


always@(posedge clk)
begin

	if(overflow==1)
		clrn<=0;
	else clrn<=1;

	if(ready==1) begin
		case(state)
			S0:
				if(buttonword!=8'hF0&&buttonword!=8'h00) begin 
					code<=buttonword; 
					state<=S1;
					en<=1;
				end
			S1:
				if(buttonword==8'hF0)begin 
					state<=S2;
					code<=0;
					en<=0;
				end
			S2: 
				state<=S0;
		endcase
		nextdata_n<=1;
	end

	else
		nextdata_n<=0;

end

endmodule

