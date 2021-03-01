function [S,Q] = SandQ(E1,E2,G,nu)
% syntax- [S,Q] = SandQ(E1,E2,G,nu)
% This function calculates the S and Q matrix in Generalized Hooke's Law.
% sigma = Q*epsilon and eplison = S*sigma

% Calculating S and Q Matrix
S = zeros(3);
S(1,1) = 1/E1;
S(1,2) = -nu/E1;
S(2,1) = -nu/E1;
S(2,2) = 1/E2;
S(3,3) = 1/G;

% Calculating inverse of the S matrix
Q = inv(S);
end