% INPUTNUMBER Prompts user to input a number
%
% Usage: num = inputNumber(prompt) Displays prompt and asks user to input a
% number. Repeats until user inputs a valid number.
%
% Original Author: Mikkel N. Schmidt, 2015
%

function num = inputNumber(prompt)

while true
    num = str2double(input(prompt, 's'));
    if ~isnan(num)
        break;
    end
end