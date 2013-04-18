function [fMin2visi,xMin2] = AdaptyvusMonteCarlo2(funkcija,a1,b1)
%Monte Carlo2 (Random Search) realizacija
%1. Sugeneruojame 100 atsitiktiniu tasku int [-10.10]
%2. Surandame, kuriame funkcija igyja didziausia (maziausia) reiksme
%a1=-10;% Pradine (pilna) sritis
%b1=10; % pradine sritis
%PALEIDIMAS; Pvz.
%a1 = -10; b1 = 10; funkcija = @sincos2;
%[fMin2,xMin2] = AdaptyvusisMonteCarlo2(funkcija,a1,b1)
fMin2visi=[];
for k=1:10 
n=2; %dimensija
k1=80;% pradiniu tasku skaicius (vektoriu skaicius)
x1=a1 + (b1-a1).*rand(k1,n);% generuoja n-macius vektorius
for i=1:k1
    f1(i)=funkcija(x1(i,:));
end
[fMin1,indMin1]=min(f1);
%[fMax1,indMax1]=max(f1);
xMin1=x1(indMin1,:);
%xMax1=x(indMax1,:);
fprintf('Surastas min=%6.4f taske x=(%6.4f )\n',fMin1,xMin1(1),xMin1(2));
%fprintf('Surastas max=%6.4f taske x=%6.4f \n',fMax1,xMax1(1),xMax1(2));
%hold on;
scatter(x1(:,1),x1(:,2),'b.');
scatter(xMin1(1),xMin1(2),'r*');
text(xMin1(1)+0.3,xMin1(2),num2str(fMin1));
rectangle('Position',[-10.0,-10.0,20.0,20.0],...
           'LineWidth',5,'Linestyle','--')

k2=50;% pradiniu tasku skaicius (vektoriu skaicius)
a2=xMin1(1)-2;% (pilna) sritis
b2=xMin1(1)+2; % pradine sritis
a3=xMin1(2)-2;
b3=xMin1(2)+2;
if (a2 < -10)
    a2 = -10; b2= -6;
end
if (a3 < -10) 
    a3 = 10; b3 = 6;
end
if (b2 > 10)
    b2 = 10; a2 = 6;
end
if (b3 > 10)
    b3 = 10; a3 = -6;
end
x2(:,1)=a2 + (b2-a2).*rand(k2,1);% generuoja n-macius vektorius
x2(:,2)=a3 + (b3-a3).*rand(k2,1);
f2=[];
hold on;
for i=1:k2
    f2(i)=funkcija(x2(i,:));
end
[fMin2,indMin2]=min(f2);
%[fMax2,indMax2]=max(f2);
xMin2=x2(indMin2,:);
%xMax2=x2(indMax2,:);
fprintf('Surastas min=%6.4f taske x=(%6.4f )\n',fMin2,xMin2(1),xMin2(2));
%fprintf('Surastas max=%6.4f taske x=%6.4f \n',fMax2,xMax2(1),xMax2(2));
scatter(x2(:,1),x2(:,2),'c.');
scatter(xMin2(1),xMin2(2),'g*');
rectangle('Position',[a2,a3,4.0,4.0],...
           'LineWidth',3,'Linestyle','--')
       fMin2visi=[fMin2visi;fMin2];
grafikas2
end
vidurkis = mean (fMin2visi);