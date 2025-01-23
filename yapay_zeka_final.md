### Cevap 1: Bir yapay sinir ağının performansını doğrudan etkileyen 5 faktör

1. **Veri Kalitesi ve Miktarı**: YSA'nın eğitimi için kullanılan veri setinin boyutu ve kalitesi, modelin genelleme yeteneğini doğrudan etkiler. Gürültüsüz, dengeli ve yeterli sayıda örnek içeren bir veri seti önemlidir.
2. **Ağ Yapısı (Katman ve Nöron Sayısı)**: Gizli katmanların ve her bir katmandaki nöronların sayısı performansı etkiler. Fazla sayıda nöron aşırı öğrenmeye (overfitting), yetersiz sayıda nöron ise düşük öğrenme kapasitesine yol açabilir.
3. **Aktivasyon Fonksiyonları**: Katmanlar arasında kullanılan aktivasyon fonksiyonları (ör. `tansig`, `logsig`, `relu`), modelin doğrusal olmayan ilişkileri öğrenebilme kapasitesini belirler.
4. **Öğrenme Oranı ve Optimizasyon Algoritması**: YSA'nın eğitimi sırasında kullanılan öğrenme oranı (`lr`) ve optimizasyon algoritması (ör. `traingdm`, `trainbr`), modelin öğrenme hızı ve doğruluğunu etkiler.
5. **Aşırı Öğrenme Kontrolü**: Modelin overfitting olmasını önlemek için kullanılan düzenleme (regularization) yöntemleri ve erken durdurma gibi teknikler performansı etkiler.

---

### Cevap 2: Bulanık mantık yapısı ve açıklamaları

Bulanık mantık yapısı 4 ana adımdan oluşur:

1. **Girdi Üyelik Fonksiyonları (Fuzzification)**: Sayısal girdiler, üyelik fonksiyonlarına göre düşük, orta veya yüksek gibi bulanık değerlere dönüştürülür.
2. **Kural Tabanı (Inference Engine)**: "Eğer... ise..." şeklinde kurallar tanımlanır ve girdilere göre sonuç değerleri hesaplanır.
3. **Kural Değerlendirme (Aggregation)**: Her bir kuralın çıkışı birleştirilir ve tek bir sonuç bulanık olarak ifade edilir.
4. **Sonuç Üretimi (Defuzzification)**: Bulanık sonuç, tekrar sayısal bir değere dönüştürülerek çıktı üretilir.

---

### Cevap 3: MATLAB soruları

#### Verilen matris:

```matlab
matris = [2,3,4:5,4,3:1,2,1];
```
#### Çözümler:

1.  `prod(matris)`: Verilen matrisin tüm elemanlarının çarpımıdır.
2.  `diag(matris)`: Kare matris olmadığı için `diag(matris)` fonksiyonu bir hata verecektir. Kare matris için kullanılır.
3.  `find(matris == 5)`: Matris içinde `5` değerinin bulunduğu indisleri döner.
4.  `matris(:,3)`: Matrisin 3. sütununu döndürür. Ancak bu ifade tek boyutlu bir vektör olduğu için çalışmaz.

```matlab
prod(matris) = 2*3*4*5*4*3*2*1 = 2880;
find(matris == 5) = [4]; % 5 değeri 4. pozisyonda bulunur.
```

### Cevap 4: MATLAB kodları

#### (a) Bulanık mantık oluşturma

```matlab
% Bulanık sistem oluşturma
fuzzySistem = mamfis('Name', 'Basit FIS');

% Giriş değişkenlerini ekleme
fuzzySistem = addInput(fuzzySistem, [50 80], 'Name', 'Girdi1');
fuzzySistem = addInput(fuzzySistem, [0 20], 'Name', 'Girdi2');
fuzzySistem = addInput(fuzzySistem, [0 30], 'Name', 'Girdi3');

% Çıkış değişkeni
fuzzySistem = addOutput(fuzzySistem, [10 50], 'Name', 'Cikis');

% Üyelik fonksiyonlarını ekleme
fuzzySistem = addMF(fuzzySistem, 'Girdi1', 'trimf', [50 50 60], 'Name', 'Dusuk');
fuzzySistem = addMF(fuzzySistem, 'Girdi1', 'trimf', [55 65 75], 'Name', 'Orta');
fuzzySistem = addMF(fuzzySistem, 'Girdi1', 'trimf', [70 80 80], 'Name', 'Yuksek');

% Benzer şekilde diğer değişkenlere üyelik fonksiyonları eklenir...

% Çıkış değişkenine üyelik fonksiyonları ekleme
fuzzySistem = addMF(fuzzySistem, 'Cikis', 'trimf', [10 20 30], 'Name', 'Dusuk');
fuzzySistem = addMF(fuzzySistem, 'Cikis', 'trimf', [20 30 40], 'Name', 'Orta');
fuzzySistem = addMF(fuzzySistem, 'Cikis', 'trimf', [30 40 50], 'Name', 'Yuksek');

% Kural tablosu
ruleList = [
    1 1 1 1 1 1; % Kural 1
    2 2 2 2 1 1; % Kural 2
    3 3 3 3 1 1; % Kural 3
];

% Kuralları sisteme ekleme
fuzzySistem = addRule(fuzzySistem, ruleList);

% Sistemi göster
figure;
plotfis(fuzzySistem);
```

#### (b) MSE hesaplama
```matlab
gercekDegerler = [52; 74; 62; 57; 76]; % Gerçek çıktılar
tahminDegerler = evalfis(fuzzySistem, [52 4 8; 74 6 14; 62 6 11; 57 11 29; 76 20 12]);

% Hata hesaplama
hata = gercekDegerler - tahminDegerler;
mse = mean(hata.^2);
disp(['MSE: ', num2str(mse)]);
```

#### (c) Gerçek ve tahmin değerlerini çizme
```matlab
figure;
hold on;
plot(gercekDegerler, 'b-o', 'LineWidth', 1.5, 'DisplayName', 'Gerçek Değerler');
plot(tahminDegerler, 'r--x', 'LineWidth', 1.5, 'DisplayName', 'Tahmin Değerler');
xlabel('Örnek Numarası');
ylabel('Çıkış Değeri');
title('Gerçek vs Tahmin Değerleri');
legend show;
grid on;
hold off;
```
