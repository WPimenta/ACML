function [ yes, no ] = GetNumYesNo( all_data, subOption, maxInfGainOption, all_results )
%GETNUMYESNO Summary of this function goes here
%   Detailed explanation goes here
yes = 1;
no = 1;
for record = 1:size(all_results)
    if (strcmp(all_data{record}{maxInfGainOption}, subOption) && strcmp(all_results{record}, 'Yes'))
        no = 0;
    end
    if (strcmp(all_data{record}{maxInfGainOption}, subOption) && strcmp(all_results{record}, 'No'))
        yes = 0;
    end
end
end

