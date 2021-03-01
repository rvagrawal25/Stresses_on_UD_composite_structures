function [E1_eff, E2_eff, nu12_eff, G12_eff] = Eff
% syntax- [E1_eff, E2_eff, nu12_eff, G12_eff] = Eff
% Calculates Effective Composite Properties from the given properties. 
% Just import the data in 'Properties.xlsx' excel sheet provided, at
% relevant positions and then simply run the function.

%% Import Relevant Data from Spreadsheet
M = readmatrix('Properties.xlsx','Range','B3:C7');

% Fiber Properties
E1_fib = M(1,1);
E2_fib = M(2,1);
nu12_fib = M(3,1);
G12_fib = M(4,1);
vf = M(5,1);

% Matrix Properties
E_mat = M(1,2);
nu_mat = M(3,2);
G_mat = M(4,2);

%% Calculating Effective Properties

E1_eff = vf*E1_fib + (1-vf)*E_mat;
E2_eff = ((vf/E2_fib) + (1-vf)/E_mat)^(-1);
nu12_eff = vf*nu12_fib + (1-vf)*nu_mat;
G12_eff = ((vf/G12_fib) + (1-vf)/G_mat)^(-1);
end