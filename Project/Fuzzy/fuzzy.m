data = readtable('winequality-red.csv');

%Girişler: fixed acidity, volatile acidity, citric acid, residual sugar, chlorides
girdiler = data{:, {'fixedAcidity', 'volatileAcidity', 'citricAcid', 'residualSugar', 'chlorides'}}';
hedefler = data{:, 'quality'}';

[egitim, test] = dividerand(girdiler, 0.7, 0.3);
[egitim_sonuc, test_sonuc] = dividerand(hedefler, 0.7, 0.3);
%%
fuzzySistem = mamfis('Name', 'Wine Quality FIS');

fuzzySistem = addInput(fuzzySistem, [4.6 15.6], 'Name', 'FixedAcidity');
fuzzySistem = addInput(fuzzySistem, [0.12 1.58], 'Name', 'VolatileAcidity');
fuzzySistem = addInput(fuzzySistem, [0 1], 'Name', 'CitricAcid');
fuzzySistem = addInput(fuzzySistem, [0.9 15.5], 'Name', 'ResidualSugar');
fuzzySistem = addInput(fuzzySistem, [0.01 0.61], 'Name', 'Chlorides');
fuzzySistem = addOutput(fuzzySistem, [0 10], 'Name', 'Quality');

fuzzySistem = addMF(fuzzySistem, 'FixedAcidity', 'trimf', [4.6 6 8], 'Name', 'Du');
fuzzySistem = addMF(fuzzySistem, 'FixedAcidity', 'trimf', [7 10 12], 'Name', 'Or');
fuzzySistem = addMF(fuzzySistem, 'FixedAcidity', 'trimf', [10 13 15.6], 'Name', 'Yu');

fuzzySistem = addMF(fuzzySistem, 'VolatileAcidity', 'trimf', [0.12 0.2 0.5], 'Name', 'Du');
fuzzySistem = addMF(fuzzySistem, 'VolatileAcidity', 'trimf', [0.4 0.8 1.2], 'Name', 'Or');
fuzzySistem = addMF(fuzzySistem, 'VolatileAcidity', 'trimf', [1 1.3 1.58], 'Name', 'Yu');

fuzzySistem = addMF(fuzzySistem, 'CitricAcid', 'trimf', [0 0.1 0.4], 'Name', 'Du');
fuzzySistem = addMF(fuzzySistem, 'CitricAcid', 'trimf', [0.3 0.5 0.7], 'Name', 'Or');
fuzzySistem = addMF(fuzzySistem, 'CitricAcid', 'trimf', [0.6 0.8 1], 'Name', 'Yu');

fuzzySistem = addMF(fuzzySistem, 'ResidualSugar', 'trimf', [0.9 2 5], 'Name', 'Du');
fuzzySistem = addMF(fuzzySistem, 'ResidualSugar', 'trimf', [4 7 10], 'Name', 'Or');
fuzzySistem = addMF(fuzzySistem, 'ResidualSugar', 'trimf', [8 12 15.5], 'Name', 'Yu');

fuzzySistem = addMF(fuzzySistem, 'Chlorides', 'trimf', [0.01 0.05 0.1], 'Name', 'Du');
fuzzySistem = addMF(fuzzySistem, 'Chlorides', 'trimf', [0.08 0.2 0.4], 'Name', 'Or');
fuzzySistem = addMF(fuzzySistem, 'Chlorides', 'trimf', [0.3 0.45 0.61], 'Name', 'Yu');

fuzzySistem = addMF(fuzzySistem, 'Quality', 'trimf', [0 2 4], 'Name', 'Du');
fuzzySistem = addMF(fuzzySistem, 'Quality', 'trimf', [3 5 7], 'Name', 'Or');
fuzzySistem = addMF(fuzzySistem, 'Quality', 'trimf', [6 8 10], 'Name', 'Yu');

%%
inputs = {'FixedAcidity', 'VolatileAcidity', 'CitricAcid', 'ResidualSugar', 'Chlorides'};
levels = {'Du', 'Or', 'Yu'};
ruleList = [];

for fa = 1:3
    for va = 1:3
        for ca = 1:3
            for rs = 1:3
                for ch = 1:3
                    orCount = sum([fa, va, ca, rs, ch] == 2);
                    yuCount = sum([fa, va, ca, rs, ch] == 3);
                    
                    if yuCount >= 3
                        quality = 3;
                    elseif orCount >= 3
                        quality = 2;
                    else
                        quality = 1;
                    end
                    
                    rule = [fa, va, ca, rs, ch, quality, 1, 1];
                    ruleList = [ruleList; rule];
                end
            end
        end
    end
end

fuzzySistem = addRule(fuzzySistem, ruleList);


%%
tahminler = evalfis(fuzzySistem, test);

disp('Tahmin Edilen Kaliteler:');
disp(tahminler);

fark = test_sonuc - tahminler;
mse = mean(fark.^2);
disp(['MSE: ', num2str(mean(mse))]);
%%
figure;
subplot(5, 1, 1);
plotmf(fuzzySistem, 'input', 1);
title('Fixed Acidity Üyelik Fonksiyonları');
subplot(5, 1, 2);
plotmf(fuzzySistem, 'input', 2);
title('Volatile Acidity Üyelik Fonksiyonları');
subplot(5, 1, 3);
plotmf(fuzzySistem, 'input', 3);
title('Citric Acid Üyelik Fonksiyonları');
subplot(5, 1, 4);
plotmf(fuzzySistem, 'input', 4);
title('Residual Sugar Üyelik Fonksiyonları');
subplot(5, 1, 5);
plotmf(fuzzySistem, 'input', 5);
title('Chlorides Üyelik Fonksiyonları');
