function [Ex,Ey,Gxy,nuxy,exyx,exyy] = cordtrans(S,Q,theta)
% syntax- [Ex,Ey,Gxy,nuxy,exyx,exyy]=cordtrans(S,Q) or
% cordtrans(S,Q,theta)if theta is known input.
% Applying co-ordinate transformation to the S and Q matrix.
% Just input the rotation angle in degrees in the 'Properties.xlsx' spreadsheet.

if nargin<3
    theta = readmatrix('Properties.xlsx','Range','B8:B8');
end

c = cosd(theta);
s = sind(theta);
T_e = [c^2,s^2,2*c*s;s^2,c^2,-2*c*s;-c*s,c*s,c^2-s^2]; %Transformation Matrix
T_s = [c^2,s^2,c*s;s^2,c^2,-c*s;-2*c*s,2*c*s,c^2-s^2];
Q_trans = T_e\Q*T_s;
S_trans = T_s\S*T_e;

Ex = S_trans(1,1)^(-1);
Ey = S_trans(2,2)^(-1);
Gxy = S_trans(3,3)^(-1);
nuxy = -S_trans(2,1)*Ex;
exyx = S_trans(1,3)/S_trans(1,1);
exyy = S_trans(2,3)/S_trans(2,2);
end