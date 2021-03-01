function [Q_trans] = Q_transformed(Q,theta)
% syntax- [Ex,Ey,Gxy,nuxy,exyx,exyy]=cordtrans(S,Q) or
% cordtrans(S,Q,theta)if theta is known input.
% Applying co-ordinate transformation to the S and Q matrix.
% Just input the rotation angle in degrees in the 'Properties.xlsx' spreadsheet.

if nargin<2
    theta = readmatrix('Properties.xlsx','Range','B8:B8');
end

c = cosd(theta);
s = sind(theta);
T_s = [c^2,s^2,2*c*s;s^2,c^2,-2*c*s;-c*s,c*s,c^2-s^2]; %Transformation Matrix
T_e = [c^2,s^2,c*s;s^2,c^2,-c*s;-2*c*s,2*c*s,c^2-s^2];
Q_trans = T_s\Q*T_e;

end