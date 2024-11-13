 aktivasyon_fonk={'tansig' 'logsig' 'hardlim' 'hardlims' 'radbas' 'purelin'};
 
 ogrenme_fonk={'trainbfg' 'trainbr' 'traincgb' 'traincgf' 'traincgp' 'traingd'...
 'traingda' 'traingdm' 'traingdx' 'trainoss' 'trainrp' 'trainscg'...
 'trainb' 'trainc' 'trainr '};
 
clc; clear all;close all;

 net=newff(minmax(egitim),[3 5 6 1],{'purelin' 'purelin' 'purelin' 'purelin'},'traingdm');
 net=init(net);
 net.trainParam.epochs=1000;
 net.trainParam.show = 5;
 net.trainParam.goal = 1e-5;
 net.trainParam.lr=0.30;
 net.trainParam.mc=0.7;
 net.trainparam.min_grad = 1e-10;

 % Modelin Eğitilmesi
 net=train (net, egitim, egitim_sonuc);
 
 % Test
 Tahmin=net(test);
 
 mse_tahmin=Tahmin';
 
 mse_gercek=test_sonuc';
 
 fark=mse_gercek-mse_tahmin;
 
 fark_kare=fark.*fark;
 
 toplam=sum(fark_kare);
 
 mse=toplam/45;
 %mse yi bilicez r^2 bilicez
 
  bias{1,1} = net.b;
    iw{1,1} = net.iw;
    lw{1,1} = net.lw;
 
    

