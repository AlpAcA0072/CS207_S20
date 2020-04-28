primitive udp(f, a, b, c, d);

    output f;
    input a, b, c, d;

//  table for (b + d)(a' + b' + c)
    table
//      a   b   c   d   :   f
        0   0   0   0   :   0;
        0   0   0   1   :   1;
        0   0   1   0   :   0;
        0   0   1   1   :   1;
        0   1   0   0   :   1;
        0   1   0   1   :   1;
        0   1   1   0   :   1;
        0   1   1   1   :   1;
        1   0   0   0   :   0;
        1   0   0   1   :   1;
        1   0   1   0   :   0;
        1   0   1   1   :   1;
        1   1   0   0   :   0;
        1   1   0   1   :   0;
        1   1   1   0   :   1;
        1   1   1   1   :   1;
    endtable

endprimitive

// module udp_m(f, a, b, c, d);
// input a, b, c, d;
// output f;

// udp udp_2(f, a, b, c, d);

// endmodule

// module udp_tb;
// wire f;
// reg a, b, c, d;

// udp udp_1 (f, a, b, c, d);

//     initial begin

//         $monitor("current time is: %3t: a is %b, b is %b, c is %b, d is %b, f is %b.", $time, a, b, c, d, f);
//         # 5 a = 0; b = 0; c = 0; d = 0;
//         # 5 a = 0; b = 0; c = 0; d = 1;
//         # 5 a = 0; b = 0; c = 1; d = 0;
//         # 5 a = 0; b = 0; c = 1; d = 1;
//         # 5 a = 0; b = 1; c = 0; d = 0;
//         # 5 a = 0; b = 1; c = 0; d = 1;
//         # 5 a = 0; b = 1; c = 1; d = 0;
//         # 5 a = 0; b = 1; c = 1; d = 1;
//         # 5 a = 1; b = 0; c = 0; d = 0;
//         # 5 a = 1; b = 0; c = 0; d = 1;
//         # 5 a = 1; b = 0; c = 1; d = 0;
//         # 5 a = 1; b = 0; c = 1; d = 1;
//         # 5 a = 1; b = 1; c = 0; d = 0;
//         # 5 a = 1; b = 1; c = 0; d = 1;
//         # 5 a = 1; b = 1; c = 1; d = 0;
//         # 5 a = 1; b = 1; c = 1; d = 1;
//         #10 $finish;

//     end
// endmodule