%Monte Carlo2 (Random Search) realizacija
%1. Sugeneruojame 100 atsitiktiniu tasku int [-10.10]
%2. Surandame, kuriame funkcija igyja didziausia (maziausia) reiksme
a1=-10;% Pradine (pilna) sritis
b1=10; % pradine sritis
n=2; %dimensija
k1=50;% pradiniu tasku skaicius (vektoriu skaicius)
x1=a1 + (b1-a1).*rand(k1,n);% generuoja n-macius vektorius
for i=1:k1
    f1(i)=sincos2(x1(i,:));
end
[fMin1,indMin1]=min(f1);
%[fMax1,indMax1]=max(f1);
xMin1=x1(indMin1,:);
%xMax1=x(indMax1,:);
fprintf('Surastas min=%6.4f taske x=(%6.4f )\n',fMin1,xMin1(1),xMin1(2));
%fprintf('Surastas max=%6.4f taske x=%6.4f \n',fMax1,xMax1(1),xMax1(2));
hold on;
scatter(x1(:,1),x1(:,2),'b.');
scatter(xMin1(1),xMin1(2),'r*');
text(xMin1(1)+0.3,xMin1(2),num2str(fMin1));
rectangle('Position',[-10.0,-10.0,20.0,20.0],...
           'LineWidth',5,'Linestyle','--')
%{
k2=50;% pradiniu tasku skaicius (vektoriu skaicius)
a2=;% (pilna) sritis
b2=; % pradine sritis
x2=a2 + (b2-a2).*rand(k2,n);% generuoja n-macius vektorius
f2=[];
for i=0:k2
    f2(i)=sincos2(x2(i,:));
end
[fMin2,indMin2]=min(f2);
%[fMax2,indMax2]=max(f2);
xMin2=x2(indMin2,:);
%xMax2=x2(indMax2,:);
fprintf('Surastas min=%6.4f taske x=(%6.4f )\n',fMin2,xMin2(1),xMin2(2));
%fprintf('Surastas max=%6.4f taske x=%6.4f \n',fMax2,xMax2(1),xMax2(2));
%}
grafikas2