a=[45 22 65 12 48 24];
a=sort(a);
b=issorted(a);
genislik=length(a);
vektor_toplami=sum(a);

matris1=[2 3 4; 5 4 3; 1 2 1];
matris1_tpl=sum(sum(matris1));

deger=matris1(1,3);

vektor_carpimi=prod(a);
matris_carpimi=prod(prod(matris1));

en_kucuk_deger=min(a);
en_kucuk_deger_matris=min(matris1);
en_kucuk_deger_matris1=min(min(matris1));

ebd=max(a);
ebd_matris=max(matris1);
ebd_matrs1=max(max(matris1));

b=[ 2 3 3 4 3 1 5 6];

b2=unique(b);

ort_v=mean(b);
ort_m=mean(matris1);
ort_m_tam=mean(mean(matris1));

ss=std(b);

arama1=find(b==6);
arama2=find(b>3);
arama3=find(b==7);
arama4=find(a==48);

[x,y]=find(matris1==5);


sifir_matrisi=zeros(2,3);
birler_matrisi=ones(3,2);

rasgele_matris=rand(2,2);

br_matris=eye(3);


c=[3 4 5];
dg_matris=diag(c);

det_matris1=det(matris1);

ters_matris1=inv(matris1);

x=sqrt(25);

karekok_b=sqrt(b);

yuvarla1=ceil(3.12);

vektor_f=[2.1 4.5 6.6 5.76];
vektor_tam=ceil(vektor_f)

vektor_alt_tam=floor(vektor_f);

matris_f=[2.1 4.5; 6.6 5.76 ];

matris_f2=ceil(matris_f);

matris_f3=floor(matris_f);

matris_f4=round(matris_f);

matris_mtlk=[-2 3 ; -5 -6];
matris_mtlk_sonuc=abs(matris_mtlk);

exp(4);
exp([ 3 4 5])
exp(matris1)

mod(5,3);
mod(b,3);
matris_mod=mod(matris1,5);

kok=nthroot(125,3);

factorial(5)
factorial(b)
factorial(matris1)

sind(30)
sind(b)
sind(matris1)%cos tan

j=1;
while j<5
    disp(j);
    j=j+1;
end

for i=1:5
    disp(i)
end

data2=data';
[egitim,test] = dividerand(data2, .7,.3);
egitim_c(1,:)=egitim(10,:)
