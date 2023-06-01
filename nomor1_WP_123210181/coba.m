data1 = readmatrix('DatasetHostelJepang.xlsx', 'Range','D2:E51'); %price, distance from city centre
data2 = readmatrix('DatasetHostelJepang.xlsx', 'Range','I2:I51'); %cleanliness
data3 = readmatrix('DatasetHostelJepang.xlsx', 'Range','N2:N51'); % value for money
alternatif = readtable('DatasetHostelJepang.xlsx', 'Range','B2:B51'); %Ambil data alternatif
cellAlternatif = table2cell (alternatif);
namaAlternatif = string(cellAlternatif);

dataGabung = [data1 data2 data3];
classify = [0 0 1 0];

w = [1 4 2 3];

norm_w = normalisasi(w);

[m n] = size(dataGabung);
    for j = 1 : n
        if classify(j) == 0, norm_w(j)=-1*norm_w(j);
        end
    end
    
    for i = 1:m
        vektorS(i) = prod(dataGabung(i,:).^norm_w);
    end
 vektorV = vektorS/sum(vektorS);
[highScore, index] = max(vektorV);
 [~, indeks_terurut] = sort(vektorV, 'descend');
sepuluhbesar = indeks_terurut(1:5);

 pemenang = namaAlternatif(sepuluhbesar);
    disp(pemenang);
 
    function hasilNormalisasi = normalisasi(m)
        sM = sum(m);
        hasilNormalisasi = m./sM;
    end
    
 