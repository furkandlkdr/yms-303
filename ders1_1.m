clc; % Command windows'u temizler
clear all; % Workspace'i temizler
close all; % Açıktaki tüm programları kapatır.
vector = [1 3 5 7];
% Eğer sonuna noktalı virgül eklersen, derlendikten sonra command 
% window'da değişkenin değeri gözükmez.

matris = [1 2 3 4 ; 5 6 7 8];
% araya koyduğumuz noktalı virgül 2. satıra indirir, 
% satır çalıştırmak için F9 kullan
% String istersen ' kullanabilirsin, bu derste kullanmayacağız

vector = [vector, 9]; % Oluşturulan bir vektörün sonuna eleman ekle
eleman = matris(2,3); % Matris elemanlarına parantez ile erişebilirsin.
% Matrislerin üzerinde işlem yaparken, 2. sütun 3. satır diyorsun.

matris = [matris; 9 8 7 6]; % Matrise satır ekleme
matris_ilk_satir = matris(1, :); % Matrisin satırını elme

% Matematiksel Operatörler
matris2 = [1 2 3 ; 5 6 7];
matris3 = [2 4 6 ; 8 10 12];

toplam_matris = matris2 + matris3;
carpim_matris = matris2 .* matris3; % Matrissel çarpım .*
transpose = matris2';
