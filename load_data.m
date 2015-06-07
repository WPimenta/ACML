clc;
clear all;
close all;
numHeaders = input(sprintf('Please enter the number of headers in the dataset:\n'));
headers = {};
for i = 1:numHeaders
    disp('Enter header name: ');
    headers{i} = input('','s');
    numOptions = input('How many options for this header? ');
    disp('Enter each option on a new line: ');
    for j = 1:numOptions
        options{i}{j} = input('','s');
    end;
end;

k = input('How many entries in data set? ');
for index = 1:k
    disp('Enter each value on a new line -------->')
    for index_ = 1:numHeaders
        all_data{index}{index_} = input('','s');
    end;
    all_results{index} = input('End result? ','s');
end;

disp('Done loading data');
disp('=====================================');
