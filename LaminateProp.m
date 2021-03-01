function [A, B, D] = LaminateProp(Q)
%This function creates the A, B and D matrix which will be later used to
%calculate the strains and the stresses.
%Syntax - use [A, B, D] = LaminateProp(Q) to get A, B and D matrix as output.

M = readmatrix('Properties.xlsx','Range','B11:B12','OutputType','char');
t = str2double(M{1});
A = zeros(3);
B = zeros(3);
D = zeros(3);
theta = readangles(M{2});
n=length(theta);
if mod(n,2)==0
    z = t*[-n/2:1:-0.1, 0:1:n/2];
else
    z = t*[-n/2:1:0, 0.5:1:n/2];
end
for ii = 1:n
    Q_k = Q_transformed(Q,theta(ii));
    A = A + Q_k*(z(ii+1)-z(ii));
    B = B + Q_k*((z(ii+1)^2 - z(ii)^2))/2;
    D = D + Q_k*((z(ii+1)^3 - z(ii)^3))/3;
end

writematrix(n,'Properties.xlsx','FileType','spreadsheet','Range','B13');
end