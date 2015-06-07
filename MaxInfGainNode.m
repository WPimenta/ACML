function [ maxInfGainNode, maxInfGain ] = MaxInfGainNode( all_data, all_results, options, usedOptions, HS )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
maxInfGain = 0;
maxInfGainNode = 0;
for optionNum=1:size(options)
    found = 0;
    for usedOption=1:size(usedOptions,1)
        if (optionNum == usedOptions{usedOption})
            found = 1;
        end
    end
    if (found == 0)
        infGain = InfGain(all_data, all_results, options, optionNum, HS);
        if (infGain > maxInfGain)
            maxInfGain = infGain;
            maxInfGainNode = optionNum;
        end
    end
end
end

