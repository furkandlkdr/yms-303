f = readfis('bulanik_mantik.fis');
for i=1:173
    tahmin(i,1) = evalfis([input1(i,1) input2(i,1)], f);
end

n = length(tahmin);
mse = sum((output - tahmin).^2) / n;
print(mse)