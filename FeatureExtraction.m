clc;
close all;
%-------------------------------ReadImage----------------------------------
offset =131;
for a_iter=1:20
k=imread(sprintf('TestGLS (%d).jpg',offset));

%--------------------------------Segmentaion-------------------------------

segmented_image = waveletSegmentation2(k);

%----------------------WaveletDecomposition_+_Featureextraction------------

     FeatureData1 = bior33Feature(segmented_image);
     FeatureData2 = bior35Feature(segmented_image);
     FeatureData3 = bior37Feature(segmented_image);
     excelfile= 'FeatureMaizeTestGLS.xlsx';
     xlswrite(excelfile,FeatureData1,'bior3.3',sprintf('A%d',offset));
     xlswrite(excelfile,FeatureData2,'bior3.5',sprintf('A%d',offset));
     xlswrite(excelfile,FeatureData3,'bior3.7',sprintf('A%d',offset));
     
    offset=offset+1;
end