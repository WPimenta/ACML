load_data;

numRecords = size(all_data,1);

numPositive = 0;
numNegative = 0;
for k=1:numRecords
    if (strcmp(all_results{k}, 'Yes'))
        numPositive = numPositive + 1;
    else
        numNegative = numNegative + 1;
    end
end

PPositive = numPositive / numRecords;
PNegative = numNegative / numRecords;

HS = Mult(-PPositive,log2(PPositive)) -Mult(PNegative,log2(PNegative));

disp('Information Gains');
maxInformationGain = 0;
maxInfGainOption = 0;
for optionNum=1:size(options)
    infGain = InfGain(all_data, all_results, options, optionNum, HS);
    disp([headers{optionNum} ' = ' num2str(infGain)]);
    if (infGain > maxInformationGain)
        maxInformationGain = infGain;
        maxInfGainOption = optionNum;
    end
end
disp('=====================================');

count = 1;
for optionNum=1:size(options)
    if (optionNum ~= maxInfGainOption)
        remainingOptions{count} = optionNum;
        count = count + 1;
    end
end

disp('Check for definite yes or no');
for option=1:size(options{maxInfGainOption}, 2)
    [yes, no] = GetNumYesNo(all_data, options{maxInfGainOption}{option}, maxInfGainOption, all_results);
    disp([options{maxInfGainOption}{option} ': Yes = ' num2str(yes) ', No = ' num2str(no)]);
    if (yes == 0 && no == 0)
        [specificRecords, specificResults] = GetRecordsForSubOption(all_data, maxInfGainOption, options{maxInfGainOption}{option}, all_results);
        numPositive = 0;
        numNegative = 0;
        for k=1:size(specificRecords)
            if (strcmp(specificResults{k}, 'Yes'))
                numPositive = numPositive + 1;
            else
                numNegative = numNegative + 1;
            end
        end
        
        PPositive = numPositive / size(specificResults,1);
        PNegative = numNegative / size(specificResults,1);
        
        HS = Mult(-PPositive,log2(PPositive)) -Mult(PNegative,log2(PNegative));
        
        disp('Information Gains');
        maxInformationGain2 = 0;
        maxInfGainOption2 = 0;
        for optionNum=1:size(remainingOptions,2)
            infGain = InfGain(specificRecords, specificResults, options, remainingOptions{optionNum}, HS);
            disp([headers{remainingOptions{optionNum}} ' = ' num2str(infGain)]);
            if (infGain > maxInformationGain2)
                maxInformationGain2 = infGain;
                maxInfGainOption2 = optionNum;
            end
        end
    end
end
disp('=====================================');