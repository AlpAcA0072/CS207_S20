module commutative(and_lhs, and_rhs, or_lhs, or_rhs, A, B);
input A, B;
output and_lhs, and_rhs, or_lhs, or_rhs;

and and_1 (and_lhs, A, B);
and and_2 (and_rhs, B, A);
or or_1 (or_lhs, A, B);
or or_2 (or_rhs, B, A);

endmodule

module commutative_tb;
reg A, B;
wire AL, AR, OL, OR;

commutative com_1(AL, AR, OL, OR, A, B);

initial begin
    $monitor("%3t: A is %b, B is %b, LHS of AND is %b, RHS of AND is %b, LHS of OR is %b, RHS of OR is %b.", $time, A, B, AL, AR, OL, OR);
    # 5 A = 0; B = 0;
    # 5 A = 1; B = 0;
    # 5 A = 0; B = 1;
    # 5 A = 1; B = 1;
    # 10 $finish;
end
endmodule