# Yapay Zeka - Vize Soruları ve Cevapları

**Tarih:** 12.11.2024  
**Konu:** Yapay Zeka Vize Soruları

---

### Soru 1
**Makine öğrenmesinin bileşenleri nelerdir?**

**Cevap:**  
- Hedef
- Model
- Öğrenme kuralları

---

### Soru 2
**Denetimli öğrenme nedir? Kısaca açıklayınız.**

**Cevap:**  
Denetimli öğrenme, makinenin verilerden öğrenmek için harici denetime ihtiyaç duyduğu bir tür Makine öğrenimidir. Denetimli öğrenme modelleri, etiketli veri kümesi kullanılarak eğitilir. Regresyon ve Sınıflandırma, denetimli makine öğrenimi modelleridir. Regresyon, matematiksel ifadelerin katsayılarının belirlenmesine dayanır.

---

### Soru 3
**Yapay sinir ağlarını yapılarına, öğrenme algoritmalarına ve öğrenme zamanına göre sınıflandırınız.**

**Cevap:**
- Yapılarına Göre Yapay Sinir Ağları
- Öğrenme Algoritmalarına Göre Yapay Sinir Ağları
- Öğrenme Zamanına Göre Yapay Sinir Ağları

---

### Soru 4
Verilen `Matrix` için aşağıdaki işlemlerin çıktıları nedir?

Matrix = [4,5,6; 7,6,5; 3,4,3]

| Kod          | Çıktı       |
|--------------|-------------|
| issorted(mtr) | 0           |
| Max(mtr)     | [7,6,6]     |
| Min(mtr)     | [3,4,3]     |
| Mean(mtr)    | [4.6,5,4.6] |

---

### Soru 5
Verilen `egtm` ve `cevap` verileri kullanılarak soruları yanıtlayınız.

**egtm Verisi**

| x  | y  |
|----|----|
| 3  | 2  |
| 2  | 1  |
| 4  | 3  |
| 3  | 2  |

**cevap Verisi**

| Çıktı |
|-------|
| 6     |
| 12    |
| 12    |
| 3     |


#### a) Yukarıda verilen `egtm` verileri için 2 hidden layer'dan oluşan ve `purelin` ile `trainbr` kullanan bir yapay sinir ağını MATLAB kodları ile oluşturun.

**Cevap:**  
```
egtm = egtm’;
ag = newff(minmax(egtm), [3 2 1], {'purelin' 'purelin' 'purelin'}, 'trainbr');
ag = init(net);
```

#### b) Aşağıda verilen Bias ve ağırlık değerlerine göre çıktıları hesaplayın.

| Girdi | Çıktı  |
|-------|--------|
| 2     | 0.816  |
| 3     | 1.033  |
| 4     | 1.312  |
| 1     | 0.568  |

#### c) Bulduğunuz sonuçlar ile MSE (Mean Squared Error) hesaplayın.

| Gerçek | Tahmin | Fark   | Fark Karesi |
|--------|--------|--------|-------------|
| 6      | 0.816  | 5.184  | 26.874      |
| 6      | 1.033  | 4.967  | 24.671      |
| 12     | 1.312  | 10.688 | 114.233     |
| 3      | 0.568  | 2.432  | 5.915       |

Toplam: 171.693  
MSE: 42.923
