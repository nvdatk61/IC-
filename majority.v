
module majority (major, V1, V2, V3);

output major;
input V1, V2, V3;

wire N1, N2, N3;

and A0(N1, V1, V2),
    A1(N2, V2, V3),
    A2(N3, V1, V3);

or OrO(major,N1,N2,N3);

endmodule