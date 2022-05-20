clc;close all;

Train1= readtable('MaizeTrain3.3.xlsx');
Train2= readtable('MaizeTrain3.5.xlsx');
Train3= readtable('MaizeTrain3.7.xlsx');

Test1= readtable('MaizeTest3.3.xlsx');
Test2= readtable('MaizeTest3.5.xlsx');
Test3= readtable('MaizeTest3.7.xlsx');


trainedModel1=ensembleSubspaceDiscriminantBior33(Train1);
trainedModel2=ensembleSubspaceDiscriminantBior35(Train2);
trainedModel3=ensembleSubspaceDiscriminantBior37(Train3);
yfit1 = trainedModel1.predictFcn(Test1);
yfit2 = trainedModel2.predictFcn(Test2);
yfit3 = trainedModel3.predictFcn(Test3);
filename = 'ResultsEnsemble.xlsx';
xlswrite(filename,yfit1,'bior3.3','A1');
xlswrite(filename,yfit2,'bior3.5','A1');
xlswrite(filename,yfit3,'bior3.7','A1');
