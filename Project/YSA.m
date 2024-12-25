% import sonrası eğitim ve test verileri oluşturma.

% data = table2array(ConcreteCompressiveStrength);
% veri = data';

% [egitim, test] = dividerand(veri, 0.7, 0.3);

% egitim_sonuc = egitim(9,:);
% test_sonuc   = test(9,:);

% egitim = egitim(1:8,:);
% test = test(1:8,:);

net = newff(minmax(egitim), [10 1], {'tansig', 'purelin'}, 'trainlm');
net = init(net);

net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-5;
net.trainParam.lr = 0.01;
net.trainParam.mc = 0.9;

net = train(net, egitim, egitim_sonuc);

tahmin = net(test);
mse = mean((test_sonuc - tahmin).^2);
R2 = 1 - sum((test_sonuc - tahmin).^2)/sum((test_sonuc - mean(test_sonuc)).^2);

disp(['MSE: ', num2str(mse)]);
disp(['R^2: ', num2str(R2)]);