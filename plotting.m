[E1,E2,nu,G] = Eff;
[S,Q] = SandQ(E1,E2,G,nu);

theta=[0:0.1:90];

for ii = 1:length(theta)
    [Ex(ii),Ey(ii),Gxy(ii),nuxy(ii),exyx(ii),exyy(ii)] = cordtrans(S,Q,theta(ii));
end

yyaxis left
plot(theta,Gxy./G,'b',theta,Ex./E2,'g',theta,exyx,'k',theta,exyy,'m');
xlabel('\theta');
ylabel('properties');
title('Properties as a function of \theta');

yyaxis right
plot(theta,nuxy,'r');
ylabel('\nu_{xy}');
legend('G_{xy}/G','E_x/E_2','\eta_{xy_x}','\eta_{xy_y}','\nu_{xy}');