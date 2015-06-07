function [ specificRecords, specificResults ] = GetRecordsForSubOption( all_data, headerNum, suboption, all_results )
%GETRECORDSFORSUBOPTION Summary of this function goes here
%   Detailed explanation goes here

specificRecords = cell.empty;
specificResults = cell.empty;
count = 1;
for record=1:size(all_results);
    if (strcmp(all_data{record}{headerNum}, suboption))
        specificRecords{count} = all_data{record};
        specificResults{count} = all_results{record};
        count = count + 1;
    end
end
specificRecords = specificRecords';
specificResults = specificResults';
end

