module lab04(clk,en,in_data,out_lock1,out_lock2);
input clk;
input en;
input in_data;
output reg out_lock1;
output reg out_lock2;
always@(posedge clk)
if(en)
begin
out_lock1=in_data;
out_lock2=out_lock1;
end
else
begin
out_lock1=out_lock1;
out_lock2=out_lock2;
end
endmodule
