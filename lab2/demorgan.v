module demorgan(and_lhs, and_rhs, or_lhs, or_rhs, x, y);
input x, y;
output and_lhs, and_rhs, or_lhs, or_rhs;
wire w1, x_not, y_not, and_xy;

or or_1 (w1, x, y);//x + y
not or_not (or_lhs, w1);//(x + y)'
not not_x (x_not, x);//x'
not not_y (y_not, y);//y'
and not_and (and_rhs, x_not, y_not);//x'y'
and and_1 (and_xy, x, y);//xy
not not_and (and_lhs, and_xy);//(xy)'
or not_or (or_rhs, x_not, y_not);//x' + y'

endmodule


module demorgan_tb;
reg X, Y;
wire AL, AR, OL, OR;

demorgan demor_1(AL, AR, OL, OR, X, Y);

initial begin
    $monitor("time: %3t: X is %b, Y is %b, (x + y)' is %b, x'y' is %b, (xy)' is %b, x' + y' is %b.", $time, X, Y, OL, AR, AL, OR);
    # 5 X = 0; Y = 0;
    # 5 X = 1; Y = 0;
    # 5 X = 0; Y = 1;
    # 5 X = 1; Y = 1;
    #10 $finish;
end

endmodule