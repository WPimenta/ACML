function [ informationGain ] = InfGain( inputSet, outputSet, options, optionNum, HS )
%INFGAIN Summary of this function goes here
%   inputSet - 
informationGain = HS;
for k=1:size(options{optionNum},2)
    [specificRecords, specificResults] = GetRecordsForSubOption(inputSet, optionNum, options{optionNum}{k}, outputSet)
    [numPositive, numNegative] = countNegPos(specificResults);
    PPositive = numPositive / (numPositive + numNegative);
    PNegative = numNegative / (numPositive + numNegative);
    PTotal = (numPositive + numNegative)/size(outputSet,1);
    informationGain = informationGain - Mult(PTotal, Mult(-PPositive, log2(PPositive)) - Mult(PNegative, log2(PNegative)));
end

end

