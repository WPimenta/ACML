function [ maxInfGainNode, maxInfGain ] = MaxInfGainNode( all_data, all_results, options, HS )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
maxInfGain = 0;
maxInfGainNode = 0;
for optionNum=1:size(options)
    infGain = InfGain(all_data, all_results, options, optionNum, HS);
    if (infGain > maxInfGain)
        maxInfGain = infGain;
        maxInfGainNode = optionNum;
    end
end
end

