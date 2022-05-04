clc,clear
%ajee10x
%The original code from 
%Golay code simulation-JC-4/15/06
% I made a new experments according to my editing and new methodology
%% Linear Block Code
% Golay code.
% parameters are Code(24,12,8)
% Set the code parameters.
n = 24                % Code length
k = 8                % Message length
%%
% Create a binary message having length |k|.
data = randi([0 1],k,1);data'
%%
% Create a cyclic generator polynomial. Then, create a parity-check matrix
% and convert it into a generator matrix.
pol = cyclpoly(n,k); pol
parmat = cyclgen(n,pol);
genmat = gen2par(parmat)
%%
% Encode the message sequence by using the generator matrix.
encData = encode(data,n,k,'linear/binary',genmat);

%%
% Introduce an error in the 3rd bit of the encoded sequence.
encData(1) = ~encData(1);
encData(2) = ~encData(2);
encData(5) = ~encData(5);
encData(10) = ~encData(10);

%%
% Decode the corrupted sequence. Observe that the decoder has correctly
% recovered the message.

decData = decode(encData,n,k,'linear/binary',genmat)

numerr = biterr(data,decData)
