function [ numNeg, numPos ] = countNegPos( data, results )
%COUNTNEG Summary of this function goes here
%   Detailed explanation goes here
numPos = 0;
numNeg = 0;
for k=1:size(data,1)
    if (strcmp(data{k}, 'Yes'))
        numPos = numPos + 1;
    else
        numNeg = numNeg + 1;
    end
end
end

