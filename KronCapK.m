
n=1; %liczba niewiadomych
m=1; %liczba rownan
n=input('Wprowadü ilosc zmiennych ');
m=input('Wprowadü ilosc rÛwnan ');
%mats=[2,1,1,-1,3;2,1,-1,1,4;1,1,1,1,10;-1,2,-1,1,3];
mats=zeros(n,m);
for i=1:m
    for j=1:n+1
         if j~=n+1
        mats(i,j)=input(['X' num2str(j) '= ']);
         else
        mats(i,j)=input(['b' num2str(i) '= ']);
         end
    end
end
mat=(mats(1:end,1:end-1));
% disp(mats)
% disp(mat)
r=rank(mat);
s=rank(mats);
if r==n && n==s
    disp('Uklad oznaczony - istnieje jedno rozwiazanie')
elseif r==s && s<n
    disp(['Uklad nie oznaczony - istnieje nieskonczenie wiele rozwiazan zaleznych od ' num2str(n-r) ' parametrow'])
else 
    disp('Uklad nie ma rozwiazan')
end
%x1=1 x2=2 x3=3 x4=4