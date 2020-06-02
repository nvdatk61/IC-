module majority_tb();
reg V1, V2, V3;
wire major;

majority M3(major, V1, V2, V3);

initial
begin
#5 V1=0;V2=0;V3=0;
#5 V1=0;V2=0;V3=1;
#5 V1=0;V2=1;V3=0;
#5 V1=0;V2=1;V3=1;
end
endmodule