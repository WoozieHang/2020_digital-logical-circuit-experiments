module keyboard_lab_test(buttonword,clk,ps2_clk,ps2_data);
input clk,ps2_clk,ps2_data;
reg clrn;
reg nextdata_n;
output [7:0]buttonword;
wire ready;
wire overflow;

initial 
begin
nextdata_n=0;
clrn=0;
end

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

if(ready==1)
nextdata_n<=1;
else nextdata_n<=0;

end
endmodule
