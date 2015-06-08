function [ informationGain ] = InfGain( inputSet, outputSet, options, optionNum, HS )
%INFGAIN Summary of this function goes here
%   inputSet -
informationGain = HS;
for k=1:size(options{optionNum},2)
    [specificRecords, specificResults] = GetRecordsForSubOption(inputSet, optionNum, options{optionNum}{k}, outputSet);
    if (size(specificRecords,1) ~= 0)
        [numNegative, numPositive] = CountNegPos(specificResults);
        PPositive = numPositive / (numPositive + numNegative);
        PNegative = numNegative / (numPositive + numNegative);
        PTotal = (numPositive + numNegative)/size(outputSet,1);
        informationGain = informationGain - Mult(PTotal, Mult(-PPositive, log2(PPositive)) - Mult(PNegative, log2(PNegative)));
    else
        informationGain = 0;
    end
end

end

