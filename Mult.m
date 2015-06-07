function [ product ] = Mult( number1, number2 )
%MULT Summary of this function goes here
%   Detailed explanation goes here

if (number1 == 0 || number2 == 0)
    product = 0;
else product = number1*number2;
end
end

