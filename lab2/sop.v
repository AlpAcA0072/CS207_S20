// (b+d)(a'+b'+c)
//=a'b'c'd+a'b'cd+a'bc'd'+a'bc'd+a'bcd'+a'bcd+ab'c'd+ab'cd
//      +abcd'+abcd
//sop form

module sop(f, a, b, c, d);

input a, b, c, d;
output f;
wire inva, invb, invc, invd, and1, and2, and3, and4,
        and5, and6, and7, and8, and9, and10;

not not_1 (inva,a);
not not_2 (invb, b);
not not_3 (invc, c);
not not_4 (invd, d);
and and_1 (and1, inva, invb, invc, d);
and and_2 (and2, inva, invb, c, d);
and and_3 (and3, inva, b, invc, invd);
and and_4 (and4, inva, b, invc, d);
and and_5 (and5, inva, b, c, invd);
and and_6 (and6, inva, b, c, d);
and and_7 (and7, a, invb, invc, d);
and and_8 (and8, a, invb, c, d);
and and_9 (and9, a, b, c, invd);
and and_10 (and10, a, b, c, d);
or re (f, and1, and2, and3, and4, 
        and5, and6, and7, and8, and9, and10);

endmodule


module sop_tb;

reg A, B, C, D;
wire F;
sop sop_1(F, A, B, C, D);

initial begin

    $monitor("time: %3t: A is %b, B is %b, C is %b, D is %b, F is %b.", $time, A, B, C, D, F);
    # 5 A = 0; B = 0; C = 0; D = 0;
    # 5 A = 0; B = 0; C = 0; D = 1;
    # 5 A = 0; B = 0; C = 1; D = 0;
    # 5 A = 0; B = 0; C = 1; D = 1;
    # 5 A = 0; B = 1; C = 0; D = 0;
    # 5 A = 0; B = 1; C = 0; D = 1;
    # 5 A = 0; B = 1; C = 1; D = 0;
    # 5 A = 0; B = 1; C = 1; D = 1;
    # 5 A = 1; B = 0; C = 0; D = 0;
    # 5 A = 1; B = 0; C = 0; D = 1;
    # 5 A = 1; B = 0; C = 1; D = 0;
    # 5 A = 1; B = 0; C = 1; D = 1;
    # 5 A = 1; B = 1; C = 0; D = 0;
    # 5 A = 1; B = 1; C = 0; D = 1;
    # 5 A = 1; B = 1; C = 1; D = 0;
    # 5 A = 1; B = 1; C = 1; D = 1;
    #10 $finish;
    end

endmodule