function sigma_12 = stresses(A,B,D,Q)

R = readmatrix('Properties.xlsx','Range','B17:B22','OutputType','double');
N = [R(1);R(2);R(3)];
M = [R(4);R(5);R(6)];
T = [A,B;B,D];
e0_k = T\[N;M];
e0 = e0_k(1:3);
k = e0_k(4:6);

Th = readmatrix('Properties.xlsx','Range','B11:B12','OutputType','char');
t = str2double(Th{1});
theta = readangles(Th{2});
sigma_xy = [];
sigma_12 = [];
n=length(theta);
if mod(n,2)==0
    z = t*[-n/2:1:-0.1, 0:1:n/2];
else
    z = t*[-n/2:1:0, 0.5:1:n/2];
end

for ii = 1:n
    c = cosd(theta(ii));
    s = sind(theta(ii));
    T_s = [c^2,s^2,2*c*s;s^2,c^2,-2*c*s;-c*s,c*s,c^2-s^2];
    Q_k = Q_transformed(Q, theta(ii));
    ek = e0 + z(ii).*k;
    sigma_xy = [sigma_xy, Q_k*ek];
    sigma_12 = [sigma_12, T_s*sigma_xy(:,ii)];
end
end