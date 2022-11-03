module Test2(Y,X,Clk,Clr);
input X,Clk,Clr;
output reg Y;
localparam [2:0]
s0=0,s1=1,s2=2,s3=3,s4=4;
reg [2:0] State;

always@(posedge Clk or posedge Clr)
if(Clr)
State <= s0;
else
begin
case(State)
s0:
begin
if(X == 1'b0)
	State <= s1;
else
	State <= s2;
end

s1:
begin
if(X == 1'b0)
	State <= s1;
else
	State <= s4;
end

s2:
begin
if(X == 1'b0)
	State <= s3;
else
	State <= s2;
end

s3:
begin
if(X == 1'b0)
	State <= s1;
else
	State <= s4;
end

s4:
begin
if(X == 1'b0)
	State <= s3;
else
	State <= s2;
end

endcase

end

always@(*)
if(State == s3 || State == s4)
Y <= 1'b1;
else
Y <= 1'b0;

endmodule
