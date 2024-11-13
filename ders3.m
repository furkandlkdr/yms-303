

data=table2array(veriy);
veri=data';
[egitim,test]=dividerand(veri,.7,.3)

egitim_sonuc=0;
test_sonuc=0;

load("ysa_veri")