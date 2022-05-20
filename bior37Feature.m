function Feature = bior37Feature(seg_image)

[c,s]=wavedec2(seg_image,4,'bior3.7');
%level-1
[H1,V1,D1] = detcoef2('all',c,s,1);
A1 = appcoef2(c,s,'bior3.7',1);
%level-2
[H2,V2,D2] = detcoef2('all',c,s,2);
A2 = appcoef2(c,s,'bior3.7',2);
%level-3
[H3,V3,D3] = detcoef2('all',c,s,3);
A3 = appcoef2(c,s,'bior3.7',3);
%level-4
[H4,V4,D4] = detcoef2('all',c,s,4);
A4 = appcoef2(c,s,'bior3.7',4);

%-----------------------------------------Entropy Features-----------------------------

%----------------Level1--------------------
redChannelH1 = H1(:, :, 1);
greenChannelH1 = H1(:, :, 2);
blueChannelH1 = H1(:, :, 3);
redChannelV1 = V1(:, :, 1);
greenChannelV1 = V1(:, :, 2);
blueChannelV1 = V1(:, :, 3);
redChannelD1 = D1(:, :, 1);
greenChannelD1 = D1(:, :, 2);
blueChannelD1 = D1(:, :, 3);
%----------------Level2--------------------
redChannelH2 = H2(:, :, 1);
greenChannelH2 = H2(:, :, 2);
blueChannelH2 = H2(:, :, 3);
redChannelV2 = V2(:, :, 1);
greenChannelV2 = V2(:, :, 2);
blueChannelV2 = V2(:, :, 3);
redChannelD2 = D2(:, :, 1);
greenChannelD2 = D2(:, :, 2);
blueChannelD2 = D2(:, :, 3);
%----------------Level3--------------------
redChannelH3 = H3(:, :, 1);
greenChannelH3 = H3(:, :, 2);
blueChannelH3 = H3(:, :, 3);
redChannelV3 = V3(:, :, 1);
greenChannelV3 = V3(:, :, 2);
blueChannelV3 = V3(:, :, 3);
redChannelD3 = D3(:, :, 1);
greenChannelD3 = D3(:, :, 2);
blueChannelD3 = D3(:, :, 3);
%----------------Level4--------------------
redChannelH4 = H4(:, :, 1);
greenChannelH4 = H4(:, :, 2);
blueChannelH4 = H4(:, :, 3);
redChannelV4 = V4(:, :, 1);
greenChannelV4 = V4(:, :, 2);
blueChannelV4 = V4(:, :, 3);
redChannelD4 = D4(:, :, 1);
greenChannelD4 = D4(:, :, 2);
blueChannelD4 = D4(:, :, 3);
%-------------------------------------------------ShanonEntropy-------------------------------
%Level1 
SE_RH1=wentropy(redChannelH1,'shannon');%SE_RH1=ShanonEntropyRedChannelHorizontal_1
SE_GH1=wentropy(greenChannelH1,'shannon');
SE_BH1=wentropy(blueChannelH1,'shannon');
SE_RV1=wentropy(redChannelV1,'shannon');
SE_GV1=wentropy(greenChannelV1,'shannon');
SE_BV1=wentropy(blueChannelV1,'shannon');
SE_RD1=wentropy(redChannelD1,'shannon');
SE_GD1=wentropy(greenChannelD1,'shannon');
SE_BD1=wentropy(blueChannelD1,'shannon');
%Level2
SE_RH2=wentropy(redChannelH2,'shannon');%SE_RH1=ShanonEntropyRedChannelHorizontal_2
SE_GH2=wentropy(greenChannelH2,'shannon');
SE_BH2=wentropy(blueChannelH2,'shannon');
SE_RV2=wentropy(redChannelV2,'shannon');
SE_GV2=wentropy(greenChannelV2,'shannon');
SE_BV2=wentropy(blueChannelV2,'shannon');
SE_RD2=wentropy(redChannelD2,'shannon');
SE_GD2=wentropy(greenChannelD2,'shannon');
SE_BD2=wentropy(blueChannelD2,'shannon');
%Level3
SE_RH3=wentropy(redChannelH3,'shannon');%SE_RH1=ShanonEntropyRedChannelHorizontal_3
SE_GH3=wentropy(greenChannelH3,'shannon');
SE_BH3=wentropy(blueChannelH3,'shannon');
SE_RV3=wentropy(redChannelV3,'shannon');
SE_GV3=wentropy(greenChannelV3,'shannon');
SE_BV3=wentropy(blueChannelV3,'shannon');
SE_RD3=wentropy(redChannelD3,'shannon');
SE_GD3=wentropy(greenChannelD3,'shannon');
SE_BD3=wentropy(blueChannelD3,'shannon');
%Level4
SE_RH4=wentropy(redChannelH4,'shannon');%SE_RH1=ShanonEntropyRedChannelHorizontal_4
SE_GH4=wentropy(greenChannelH4,'shannon');
SE_BH4=wentropy(blueChannelH4,'shannon');
SE_RV4=wentropy(redChannelV4,'shannon');
SE_GV4=wentropy(greenChannelV4,'shannon');
SE_BV4=wentropy(blueChannelV4,'shannon');
SE_RD4=wentropy(redChannelD4,'shannon');
SE_GD4=wentropy(greenChannelD4,'shannon');
SE_BD4=wentropy(blueChannelD4,'shannon');
%----------------------------------------------LogEnergyEntropy----------------------------------------------
%Level1
LEE_RH1=wentropy(redChannelH1,'log energy');%LEE_RH1=LogEnergyEntropyRedChannelHorizontal_1
LEE_GH1=wentropy(greenChannelH1,'log energy');
LEE_BH1=wentropy(blueChannelH1,'log energy');
LEE_RV1=wentropy(redChannelV1,'log energy');
LEE_GV1=wentropy(greenChannelV1,'log energy');
LEE_BV1=wentropy(blueChannelV1,'log energy');
LEE_RD1=wentropy(redChannelD1,'log energy');
LEE_GD1=wentropy(greenChannelD1,'log energy');
LEE_BD1=wentropy(blueChannelD1,'log energy');
%Level2
LEE_RH2=wentropy(redChannelH2,'log energy');%LEE_RH1=LogEnergyEntropyRedChannelHorizontal_2
LEE_GH2=wentropy(greenChannelH2,'log energy');
LEE_BH2=wentropy(blueChannelH2,'log energy');
LEE_RV2=wentropy(redChannelV2,'log energy');
LEE_GV2=wentropy(greenChannelV2,'log energy');
LEE_BV2=wentropy(blueChannelV2,'log energy');
LEE_RD2=wentropy(redChannelD2,'log energy');
LEE_GD2=wentropy(greenChannelD2,'log energy');
LEE_BD2=wentropy(blueChannelD2,'log energy');
%Level3
LEE_RH3=wentropy(redChannelH3,'log energy');%LEE_RH1=LogEnergyEntropyRedChannelHorizontal_3
LEE_GH3=wentropy(greenChannelH3,'log energy');
LEE_BH3=wentropy(blueChannelH3,'log energy');
LEE_RV3=wentropy(redChannelV3,'log energy');
LEE_GV3=wentropy(greenChannelV3,'log energy');
LEE_BV3=wentropy(blueChannelV3,'log energy');
LEE_RD3=wentropy(redChannelD3,'log energy');
LEE_GD3=wentropy(greenChannelD3,'log energy');
LEE_BD3=wentropy(blueChannelD3,'log energy');
%Level4
LEE_RH4=wentropy(redChannelH4,'log energy');%LEE_RH1=LogEnergyEntropyRedChannelHorizontal_4
LEE_GH4=wentropy(greenChannelH4,'log energy');
LEE_BH4=wentropy(blueChannelH4,'log energy');
LEE_RV4=wentropy(redChannelV4,'log energy');
LEE_GV4=wentropy(greenChannelV4,'log energy');
LEE_BV4=wentropy(blueChannelV4,'log energy');
LEE_RD4=wentropy(redChannelD4,'log energy');
LEE_GD4=wentropy(greenChannelD4,'log energy');
LEE_BD4=wentropy(blueChannelD4,'log energy');
%----------------------------------------------SureEntropy----------------------------------------------
%Level1
SuE_RH1=wentropy(redChannelH1,'sure',3);%SuE_RH1=SureEntropyRedChannelHorizontal_1
SuE_GH1=wentropy(greenChannelH1,'sure',3);
SuE_BH1=wentropy(blueChannelH1,'sure',3);
SuE_RV1=wentropy(redChannelV1,'sure',3);
SuE_GV1=wentropy(greenChannelV1,'sure',3);
SuE_BV1=wentropy(blueChannelV1,'sure',3);
SuE_RD1=wentropy(redChannelD1,'sure',3);
SuE_GD1=wentropy(greenChannelD1,'sure',3);
SuE_BD1=wentropy(blueChannelD1,'sure',3);
%Level2
SuE_RH2=wentropy(redChannelH2,'sure',3);%SuE_RH1=SureEntropyRedChannelHorizontal_2
SuE_GH2=wentropy(greenChannelH2,'sure',3);
SuE_BH2=wentropy(blueChannelH2,'sure',3);
SuE_RV2=wentropy(redChannelV2,'sure',3);
SuE_GV2=wentropy(greenChannelV2,'sure',3);
SuE_BV2=wentropy(blueChannelV2,'sure',3);
SuE_RD2=wentropy(redChannelD2,'sure',3);
SuE_GD2=wentropy(greenChannelD2,'sure',3);
SuE_BD2=wentropy(blueChannelD2,'sure',3);
%Level3
SuE_RH3=wentropy(redChannelH3,'sure',3);%SuE_RH1=SureEntropyRedChannelHorizontal_3
SuE_GH3=wentropy(greenChannelH3,'sure',3);
SuE_BH3=wentropy(blueChannelH3,'sure',3);
SuE_RV3=wentropy(redChannelV3,'sure',3);
SuE_GV3=wentropy(greenChannelV3,'sure',3);
SuE_BV3=wentropy(blueChannelV3,'sure',3);
SuE_RD3=wentropy(redChannelD3,'sure',3);
SuE_GD3=wentropy(greenChannelD3,'sure',3);
SuE_BD3=wentropy(blueChannelD3,'sure',3);
%Level4
SuE_RH4=wentropy(redChannelH4,'sure',3);%SuE_RH1=SureEntropyRedChannelHorizontal_4
SuE_GH4=wentropy(greenChannelH4,'sure',3);
SuE_BH4=wentropy(blueChannelH4,'sure',3);
SuE_RV4=wentropy(redChannelV4,'sure',3);
SuE_GV4=wentropy(greenChannelV4,'sure',3);
SuE_BV4=wentropy(blueChannelV4,'sure',3);
SuE_RD4=wentropy(redChannelD4,'sure',3);
SuE_GD4=wentropy(greenChannelD4,'sure',3);
SuE_BD4=wentropy(blueChannelD4,'sure',3);
%----------------------------------------------ThresholdEntropy---------------------------------------------- 
%Level1
ThE_RH1=wentropy(redChannelH1,'threshold',0.2);%ThE_RH1=ThresholdEntropyRedChannelHorizontal_1
ThE_GH1=wentropy(greenChannelH1,'threshold',0.2);
ThE_BH1=wentropy(blueChannelH1,'threshold',0.2);
ThE_RV1=wentropy(redChannelV1,'threshold',0.2);
ThE_GV1=wentropy(greenChannelV1,'threshold',0.2);
ThE_BV1=wentropy(blueChannelV1,'threshold',0.2);
ThE_RD1=wentropy(redChannelD1,'threshold',0.2);
ThE_GD1=wentropy(greenChannelD1,'threshold',0.2);
ThE_BD1=wentropy(blueChannelD1,'threshold',0.2);
%Level2
ThE_RH2=wentropy(redChannelH2,'threshold',0.2);%ThE_RH1=ThresholdEntropyRedChannelHorizontal_2
ThE_GH2=wentropy(greenChannelH2,'threshold',0.2);
ThE_BH2=wentropy(blueChannelH2,'threshold',0.2);
ThE_RV2=wentropy(redChannelV2,'threshold',0.2);
ThE_GV2=wentropy(greenChannelV2,'threshold',0.2);
ThE_BV2=wentropy(blueChannelV2,'threshold',0.2);
ThE_RD2=wentropy(redChannelD2,'threshold',0.2);
ThE_GD2=wentropy(greenChannelD2,'threshold',0.2);
ThE_BD2=wentropy(blueChannelD2,'threshold',0.2);
%Level3
ThE_RH3=wentropy(redChannelH3,'threshold',0.2);%ThE_RH1=ThresholdEntropyRedChannelHorizontal_3
ThE_GH3=wentropy(greenChannelH3,'threshold',0.2);
ThE_BH3=wentropy(blueChannelH3,'threshold',0.2);
ThE_RV3=wentropy(redChannelV3,'threshold',0.2);
ThE_GV3=wentropy(greenChannelV3,'threshold',0.2);
ThE_BV3=wentropy(blueChannelV3,'threshold',0.2);
ThE_RD3=wentropy(redChannelD3,'threshold',0.2);
ThE_GD3=wentropy(greenChannelD3,'threshold',0.2);
ThE_BD3=wentropy(blueChannelD3,'threshold',0.2);
%Level4
ThE_RH4=wentropy(redChannelH4,'threshold',0.2);%ThE_RH1=ThresholdEntropyRedChannelHorizontal_4
ThE_GH4=wentropy(greenChannelH4,'threshold',0.2);
ThE_BH4=wentropy(blueChannelH4,'threshold',0.2);
ThE_RV4=wentropy(redChannelV4,'threshold',0.2);
ThE_GV4=wentropy(greenChannelV4,'threshold',0.2);
ThE_BV4=wentropy(blueChannelV4,'threshold',0.2);
ThE_RD4=wentropy(redChannelD4,'threshold',0.2);
ThE_GD4=wentropy(greenChannelD4,'threshold',0.2);
ThE_BD4=wentropy(blueChannelD4,'threshold',0.2);

Feature = [SE_RH1,SE_GH1,SE_BH1,SE_RV1,SE_GV1,SE_BV1,SE_RD1,SE_GD1,SE_BD1,SE_RH2,SE_GH2,SE_BH2,SE_RV2,SE_GV2,SE_BV2,SE_RD2,SE_GD2,SE_BD2,SE_RH3,SE_GH3,SE_BH3,SE_RV3,SE_GV3,SE_BV3,SE_RD3,SE_GD3,SE_BD3,SE_RH4,SE_GH4,SE_BH4,SE_RV4,SE_GV4,SE_BV4,SE_RD4,SE_GD4,SE_BD4,LEE_RH1,LEE_GH1,LEE_BH1,LEE_RV1,LEE_GV1,LEE_BV1,LEE_RD1,LEE_GD1,LEE_BD1,LEE_RH2,LEE_GH2,LEE_BH2,LEE_RV2,LEE_GV2,LEE_BV2,LEE_RD2,LEE_GD2,LEE_BD2,LEE_RH3,LEE_GH3,LEE_BH3,LEE_RV3,LEE_GV3,LEE_BV3,LEE_RD3,LEE_GD3,LEE_BD3,LEE_RH4,LEE_GH4,LEE_BH4,LEE_RV4,LEE_GV4,LEE_BV4,LEE_RD4,LEE_GD4,LEE_BD4,SuE_RH1,SuE_GH1,SuE_BH1,SuE_RV1,SuE_GV1,SuE_BV1,SuE_RD1,SuE_GD1,SuE_BD1,SuE_RH2,SuE_GH2,SuE_BH2,SuE_RV2,SuE_GV2,SuE_BV2,SuE_RD2,SuE_GD2,SuE_BD2,SuE_RH3,SuE_GH3,SuE_BH3,SuE_RV3,SuE_GV3,SuE_BV3,SuE_RD3,SuE_GD3,SuE_BD3,SuE_RH4,SuE_GH4,SuE_BH4,SuE_RV4,SuE_GV4,SuE_BV4,SuE_RD4,SuE_GD4,SuE_BD4,ThE_RH1,ThE_GH1,ThE_BH1,ThE_RV1,ThE_GV1,ThE_BV1,ThE_RD1,ThE_GD1,ThE_BD1,ThE_RH2,ThE_GH2,ThE_BH2,ThE_RV2,ThE_GV2,ThE_BV2,ThE_RD2,ThE_GD2,ThE_BD2,ThE_RH3,ThE_GH3,ThE_BH3,ThE_RV3,ThE_GV3,ThE_BV3,ThE_RD3,ThE_GD3,ThE_BD3,ThE_RH4,ThE_GH4,ThE_BH4,ThE_RV4,ThE_GV4,ThE_BV4,ThE_RD4,ThE_GD4,ThE_BD4];

end