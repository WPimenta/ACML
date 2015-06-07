function [ HS ] = H( numNegative, numPositive, numRecords )
%H Summary of this function goes here
%   Detailed explanation goes here
PPositive = numPositive / numRecords;
PNegative = numNegative / numRecords;
HS = Mult(-PPositive,log2(PPositive)) -Mult(PNegative,log2(PNegative));
end

