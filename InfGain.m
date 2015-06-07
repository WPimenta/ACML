function [ infGain ] = InfGain( inputSet, outputSet, options, optionNum, HS )
%INFGAIN Summary of this function goes here
%   Detailed explanation goes here
infGain = HS;
for k=1:size(options{optionNum},2)
    numPositive = 0;
    numNegative = 0;
    for j=1:size(outputSet)
        if (strcmp(options{optionNum}{k}, inputSet{j}{optionNum}))
            if (strcmp(outputSet{j}, 'Yes'))
                numPositive = numPositive + 1;
            else
                numNegative = numNegative + 1;
            end
        end
    end
    PPositive = numPositive / (numPositive + numNegative);
    PNegative = numNegative / (numPositive + numNegative);
    PTotal = (numPositive + numNegative)/size(outputSet,1);
    infGain = infGain - Mult(PTotal, Mult(-PPositive, log2(PPositive)) - Mult(PNegative, log2(PNegative)));
end

end

