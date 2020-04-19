// (b+d)(a'+b'+c)
//=(aa'+b+cc'+d)(a'+b'+c"dd')
//=(a+b+c+d)(a+b+c'+d)(a'+b+c+d)(a'+b+c'+d)(a'+b'+c+d)(a'+b'+c+d')
//pos form

module pos(f, a, b, c, d);

input a, b, c, d;
output f;
wire inva, invb, invc, invd, ini_form, or_e, 
        or_f, or_g, or_h, or_i, or_j;

not not_1 (inva,a);
not not_2 (invb, b);
not not_3 (invc, c);
not not_4 (invd, d);
or or_1 (or_e, a, b, c, d);
or or_2 (or_f, a, b, invc, d);
or or_3 (or_g, inva, b, c, d);
or or_4 (or_h, inva, b, invc, d);
or or_5 (or_i, inva, invb, c, d);
or or_6 (or_j, inva, invb, c, invd);
and and_last (f, or_e, or_f, or_g, or_h, or_i, or_j);

endmodule


module pos_tb;

reg A, B, C, D;
wire F;
pos pos_1(F, A, B, C, D);

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