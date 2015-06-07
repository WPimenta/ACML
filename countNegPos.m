function [ numNeg, numPos ] = countNegPos( results )
%COUNTNEG Summary of this function goes here
%   Detailed explanation goes here
numPos = 0;
numNeg = 0;
for k=1:size(results,1)
    if (strcmp(results{k}, 'Yes'))
        numPos = numPos + 1;
    else
        numNeg = numNeg + 1;
    end
end
end

