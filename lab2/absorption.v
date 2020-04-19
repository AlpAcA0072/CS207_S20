module absorption(and_lhs, and_rhs, or_lhs, or_rhs, x, y);
input x, y;
output and_lhs, and_rhs, or_lhs, or_rhs;
wire and_xy, or_x_plus_y;

and and_1 (and_xy, x, y);// xy
or or_1 (and_lhs, x, and_xy);// x + xy
buf buf_1 (and_rhs, x);
or or_2 (or_x_plus_y, x, y);// x + y
and and_2 (or_lhs, x, or_x_plus_y);// x(x + y)
buf buf_2 (or_rhs, x);

endmodule


module absorption_tb;
reg X, Y;
wire AL, AR, OL, OR;

absorption absorp_1(AL, AR, OL, OR, X, Y);

initial begin
    $monitor("time: %3t: X is %b, Y is %b, x + xy is %b, x is %b, x(x + y) is %b, x is %b.", $time, X, Y, OL, AR, AL, OR);
    #5 X = 0; Y = 0;
    #5 X = 1; Y = 0;
    #5 X = 0; Y = 1;
    #5 X = 1; Y = 1;
    #10 $finish;
end

endmodule