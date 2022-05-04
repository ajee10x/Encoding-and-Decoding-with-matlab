clc,clear
%ajee10x
%The original code from 
%Parity code simulation-JC-4/15/06
% I made a new experments according to my editing and new methodology
%% Encoding and Decoding with Linear Block Codes
% Encode and decode corrupted data using three types of linear block codes. 
%% Parity Bit Code
% Set the code parameters.
m = 6;                % Message length
n = m+3;              % Code length

%%
% Create a binary message having length |k|.
data = randi([0 1],m,1);data'
%%

% Calculate paritty bit
sumdata= sum (data);
parity = sumdata - 2*floor(sumdata/2)

% Add the parity bit.
encData = [data; parity]; encData'
%%
% Introduce an error in the 4th bit of the encoded sequence.
%encData(4) = ~encData(4);
encData(6) = ~encData(6);
encData(5) = ~encData(5);
encData'
%%
% Recalculate parity
% recovered the message.
sumencData= sum (encData(3:6));
parity_check = sumencData - 2*floor(sumencData/2)
if parity == parity_check 
    disp('No errors.Everything is correct');
else
    disp('An error somewhere! A danger! Resend the data at once!');
    
end;
