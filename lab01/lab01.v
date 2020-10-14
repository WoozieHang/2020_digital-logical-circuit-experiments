module lab01(a,b,c,d,s,y);
		input [1:0]a;//2位第一个变量
		input [1:0]b;//2位第二个变量
		input [1:0]c;//2位第三个变量
		input [1:0]d;//2位第四个变量
		input	[1:0]s;//2位选择控制变量
		output reg[1:0]y;//输出寄存器变量

		
		always @ (a or b or c or d or s)
		case (s)
		0:y=a;
		1:y=b;
		2:y=c;
		3:y=d;
		default: y=2'b00;
		endcase
		
endmodule