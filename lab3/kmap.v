//F = ABC'D + B'D' + CD'
module kmap(F, A, B, C, D);
input A, B, C, D;
output F;
wire and_ABNotCD, and_NotBNotD, and_CNotD, 
        notA, notB, notC, notD;

not not_1 (notA, A);
not not_2 (notB, B);
not not_3 (notC, C);
not not_4 (notD, D);
and and_1 (and_ABNotCD, A, B, notC, D);
and and_2 (and_NotBNotD, notB, notD);
and and_3 (and_CNotD, C, notD);
or result (F, and_ABNotCD, and_CNotD, and_NotBNotD);

endmodule


module kmap_tb;
reg A, B, C, D;
wire F;

kmap kmap_1(F, A, B, C, D);

initial begin

        $monitor("current time is: %3t: A is %B, B is %B, C is %B, D is %B, F is %B.", $time, A, B, C, D,F);
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