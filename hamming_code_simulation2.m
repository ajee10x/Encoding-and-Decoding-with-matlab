clc,clear
%ajee10x
%The original code from 
%Hamming code simulation-JC-4/15/06
% I made a new experments according to my editing and new methodology
%% Encoding and Decoding with Linear Block Codes
% Encode and decode corrupted data using three types of linear block codes. 
%% Hamming Code
% Set the code parameters.
n = 15;                % Code length
s = 11;                % Message length
%%
% Create a binary message having length |s|.
data = randi([0 1],s,1);data'
%%
% Encode the message.
encData = encode(data,n,s,'hamming/binary'); encData'
%%
% Introduce an error in the 6th bit of the encoded sequence.
encData(6) = ~encData(6);
encData(5) = ~encData(5);
encData(4) = ~encData(4);
encData(3) = ~encData(3);
encData(2) = ~encData(2);
encData'
%%
% Decode the corrupted sequence. Observe that the decoder has correctly
% recovered the message.
decData = decode(encData,n,s,'hamming/binary');decData'

numerr = biterr(data,decData)
