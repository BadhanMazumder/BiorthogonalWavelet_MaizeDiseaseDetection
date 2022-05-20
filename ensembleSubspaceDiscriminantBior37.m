function [trainedClassifier, validationAccuracy] = ensembleSubspaceDiscriminantBior37(trainingData)
% [trainedClassifier, validationAccuracy] = trainClassifier(trainingData)
% returns a trained classifier and its accuracy. This code recreates the
% classification model trained in Classification Learner app. Use the
% generated code to automate training the same model with new data, or to
% learn how to programmatically train models.
%
%  Input:
%      trainingData: a table containing the same predictor and response
%       columns as imported into the app.
%
%  Output:
%      trainedClassifier: a struct containing the trained classifier. The
%       struct contains various fields with information about the trained
%       classifier.
%
%      trainedClassifier.predictFcn: a function to make predictions on new
%       data.
%
%      validationAccuracy: a double containing the accuracy in percent. In
%       the app, the History list displays this overall accuracy score for
%       each model.
%
% Use the code to train the model with new data. To retrain your
% classifier, call the function from the command line with your original
% data or new data as the input argument trainingData.
%
% For example, to retrain a classifier trained with the original data set
% T, enter:
%   [trainedClassifier, validationAccuracy] = trainClassifier(T)
%
% To make predictions with the returned 'trainedClassifier' on new data T2,
% use
%   yfit = trainedClassifier.predictFcn(T2)
%
% T2 must be a table containing at least the same predictor columns as used
% during training. For details, enter:
%   trainedClassifier.HowToPredict

% Auto-generated by MATLAB on 13-Mar-2020 11:13:13


% Extract predictors and response
% This code processes the data into the right shape for training the
% model.
inputTable = trainingData;
predictorNames = {'SE_RH1', 'SE_GH1', 'SE_BH1', 'SE_RV1', 'SE_GV1', 'SE_BV1', 'SE_RD1', 'SE_GD1', 'SE_BD1', 'SE_RH2', 'SE_GH2', 'SE_BH2', 'SE_RV2', 'SE_GV2', 'SE_BV2', 'SE_RD2', 'SE_GD2', 'SE_BD2', 'SE_RH3', 'SE_GH3', 'SE_BH3', 'SE_RV3', 'SE_GV3', 'SE_BV3', 'SE_RD3', 'SE_GD3', 'SE_BD3', 'SE_RH4', 'SE_GH4', 'SE_BH4', 'SE_RV4', 'SE_GV4', 'SE_BV4', 'SE_RD4', 'SE_GD4', 'SE_BD4', 'LEE_RH1', 'LEE_GH1', 'LEE_BH1', 'LEE_RV1', 'LEE_GV1', 'LEE_BV1', 'LEE_RD1', 'LEE_GD1', 'LEE_BD1', 'LEE_RH2', 'LEE_GH2', 'LEE_BH2', 'LEE_RV2', 'LEE_GV2', 'LEE_BV2', 'LEE_RD2', 'LEE_GD2', 'LEE_BD2', 'LEE_RH3', 'LEE_GH3', 'LEE_BH3', 'LEE_RV3', 'LEE_GV3', 'LEE_BV3', 'LEE_RD3', 'LEE_GD3', 'LEE_BD3', 'LEE_RH4', 'LEE_GH4', 'LEE_BH4', 'LEE_RV4', 'LEE_GV4', 'LEE_BV4', 'LEE_RD4', 'LEE_GD4', 'LEE_BD4', 'SuE_RH1', 'SuE_GH1', 'SuE_BH1', 'SuE_RV1', 'SuE_GV1', 'SuE_BV1', 'SuE_RD1', 'SuE_GD1', 'SuE_BD1', 'SuE_RH2', 'SuE_GH2', 'SuE_BH2', 'SuE_RV2', 'SuE_GV2', 'SuE_BV2', 'SuE_RD2', 'SuE_GD2', 'SuE_BD2', 'SuE_RH3', 'SuE_GH3', 'SuE_BH3', 'SuE_RV3', 'SuE_GV3', 'SuE_BV3', 'SuE_RD3', 'SuE_GD3', 'SuE_BD3', 'SuE_RH4', 'SuE_GH4', 'SuE_BH4', 'SuE_RV4', 'SuE_GV4', 'SuE_BV4', 'SuE_RD4', 'SuE_GD4', 'SuE_BD4', 'ThE_RH1', 'ThE_GH1', 'ThE_BH1', 'ThE_RV1', 'ThE_GV1', 'ThE_BV1', 'ThE_RD1', 'ThE_GD1', 'ThE_BD1', 'ThE_RH2', 'ThE_GH2', 'ThE_BH2', 'ThE_RV2', 'ThE_GV2', 'ThE_BV2', 'ThE_RD2', 'ThE_GD2', 'ThE_BD2', 'ThE_RH3', 'ThE_GH3', 'ThE_BH3', 'ThE_RV3', 'ThE_GV3', 'ThE_BV3', 'ThE_RD3', 'ThE_GD3', 'ThE_BD3', 'ThE_RH4', 'ThE_GH4', 'ThE_BH4', 'ThE_RV4', 'ThE_GV4', 'ThE_BV4', 'ThE_RD4', 'ThE_GD4', 'ThE_BD4'};
predictors = inputTable(:, predictorNames);
response = inputTable.Type;
isCategoricalPredictor = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];

% Train a classifier
% This code specifies all the classifier options and trains the classifier.
subspaceDimension = max(1, min(72, width(predictors) - 1));
classificationEnsemble = fitcensemble(...
    predictors, ...
    response, ...
    'Method', 'Subspace', ...
    'NumLearningCycles', 30, ...
    'Learners', 'discriminant', ...
    'NPredToSample', subspaceDimension, ...
    'ClassNames', {'CR'; 'GLS'; 'NLB'});

% Create the result struct with predict function
predictorExtractionFcn = @(t) t(:, predictorNames);
ensemblePredictFcn = @(x) predict(classificationEnsemble, x);
trainedClassifier.predictFcn = @(x) ensemblePredictFcn(predictorExtractionFcn(x));

% Add additional fields to the result struct
trainedClassifier.RequiredVariables = {'SE_RH1', 'SE_GH1', 'SE_BH1', 'SE_RV1', 'SE_GV1', 'SE_BV1', 'SE_RD1', 'SE_GD1', 'SE_BD1', 'SE_RH2', 'SE_GH2', 'SE_BH2', 'SE_RV2', 'SE_GV2', 'SE_BV2', 'SE_RD2', 'SE_GD2', 'SE_BD2', 'SE_RH3', 'SE_GH3', 'SE_BH3', 'SE_RV3', 'SE_GV3', 'SE_BV3', 'SE_RD3', 'SE_GD3', 'SE_BD3', 'SE_RH4', 'SE_GH4', 'SE_BH4', 'SE_RV4', 'SE_GV4', 'SE_BV4', 'SE_RD4', 'SE_GD4', 'SE_BD4', 'LEE_RH1', 'LEE_GH1', 'LEE_BH1', 'LEE_RV1', 'LEE_GV1', 'LEE_BV1', 'LEE_RD1', 'LEE_GD1', 'LEE_BD1', 'LEE_RH2', 'LEE_GH2', 'LEE_BH2', 'LEE_RV2', 'LEE_GV2', 'LEE_BV2', 'LEE_RD2', 'LEE_GD2', 'LEE_BD2', 'LEE_RH3', 'LEE_GH3', 'LEE_BH3', 'LEE_RV3', 'LEE_GV3', 'LEE_BV3', 'LEE_RD3', 'LEE_GD3', 'LEE_BD3', 'LEE_RH4', 'LEE_GH4', 'LEE_BH4', 'LEE_RV4', 'LEE_GV4', 'LEE_BV4', 'LEE_RD4', 'LEE_GD4', 'LEE_BD4', 'SuE_RH1', 'SuE_GH1', 'SuE_BH1', 'SuE_RV1', 'SuE_GV1', 'SuE_BV1', 'SuE_RD1', 'SuE_GD1', 'SuE_BD1', 'SuE_RH2', 'SuE_GH2', 'SuE_BH2', 'SuE_RV2', 'SuE_GV2', 'SuE_BV2', 'SuE_RD2', 'SuE_GD2', 'SuE_BD2', 'SuE_RH3', 'SuE_GH3', 'SuE_BH3', 'SuE_RV3', 'SuE_GV3', 'SuE_BV3', 'SuE_RD3', 'SuE_GD3', 'SuE_BD3', 'SuE_RH4', 'SuE_GH4', 'SuE_BH4', 'SuE_RV4', 'SuE_GV4', 'SuE_BV4', 'SuE_RD4', 'SuE_GD4', 'SuE_BD4', 'ThE_RH1', 'ThE_GH1', 'ThE_BH1', 'ThE_RV1', 'ThE_GV1', 'ThE_BV1', 'ThE_RD1', 'ThE_GD1', 'ThE_BD1', 'ThE_RH2', 'ThE_GH2', 'ThE_BH2', 'ThE_RV2', 'ThE_GV2', 'ThE_BV2', 'ThE_RD2', 'ThE_GD2', 'ThE_BD2', 'ThE_RH3', 'ThE_GH3', 'ThE_BH3', 'ThE_RV3', 'ThE_GV3', 'ThE_BV3', 'ThE_RD3', 'ThE_GD3', 'ThE_BD3', 'ThE_RH4', 'ThE_GH4', 'ThE_BH4', 'ThE_RV4', 'ThE_GV4', 'ThE_BV4', 'ThE_RD4', 'ThE_GD4', 'ThE_BD4'};
trainedClassifier.ClassificationEnsemble = classificationEnsemble;
trainedClassifier.About = 'This struct is a trained model exported from Classification Learner R2017b.';
trainedClassifier.HowToPredict = sprintf('To make predictions on a new table, T, use: \n  yfit = c.predictFcn(T) \nreplacing ''c'' with the name of the variable that is this struct, e.g. ''trainedModel''. \n \nThe table, T, must contain the variables returned by: \n  c.RequiredVariables \nVariable formats (e.g. matrix/vector, datatype) must match the original training data. \nAdditional variables are ignored. \n \nFor more information, see <a href="matlab:helpview(fullfile(docroot, ''stats'', ''stats.map''), ''appclassification_exportmodeltoworkspace'')">How to predict using an exported model</a>.');

% Extract predictors and response
% This code processes the data into the right shape for training the
% model.
inputTable = trainingData;
predictorNames = {'SE_RH1', 'SE_GH1', 'SE_BH1', 'SE_RV1', 'SE_GV1', 'SE_BV1', 'SE_RD1', 'SE_GD1', 'SE_BD1', 'SE_RH2', 'SE_GH2', 'SE_BH2', 'SE_RV2', 'SE_GV2', 'SE_BV2', 'SE_RD2', 'SE_GD2', 'SE_BD2', 'SE_RH3', 'SE_GH3', 'SE_BH3', 'SE_RV3', 'SE_GV3', 'SE_BV3', 'SE_RD3', 'SE_GD3', 'SE_BD3', 'SE_RH4', 'SE_GH4', 'SE_BH4', 'SE_RV4', 'SE_GV4', 'SE_BV4', 'SE_RD4', 'SE_GD4', 'SE_BD4', 'LEE_RH1', 'LEE_GH1', 'LEE_BH1', 'LEE_RV1', 'LEE_GV1', 'LEE_BV1', 'LEE_RD1', 'LEE_GD1', 'LEE_BD1', 'LEE_RH2', 'LEE_GH2', 'LEE_BH2', 'LEE_RV2', 'LEE_GV2', 'LEE_BV2', 'LEE_RD2', 'LEE_GD2', 'LEE_BD2', 'LEE_RH3', 'LEE_GH3', 'LEE_BH3', 'LEE_RV3', 'LEE_GV3', 'LEE_BV3', 'LEE_RD3', 'LEE_GD3', 'LEE_BD3', 'LEE_RH4', 'LEE_GH4', 'LEE_BH4', 'LEE_RV4', 'LEE_GV4', 'LEE_BV4', 'LEE_RD4', 'LEE_GD4', 'LEE_BD4', 'SuE_RH1', 'SuE_GH1', 'SuE_BH1', 'SuE_RV1', 'SuE_GV1', 'SuE_BV1', 'SuE_RD1', 'SuE_GD1', 'SuE_BD1', 'SuE_RH2', 'SuE_GH2', 'SuE_BH2', 'SuE_RV2', 'SuE_GV2', 'SuE_BV2', 'SuE_RD2', 'SuE_GD2', 'SuE_BD2', 'SuE_RH3', 'SuE_GH3', 'SuE_BH3', 'SuE_RV3', 'SuE_GV3', 'SuE_BV3', 'SuE_RD3', 'SuE_GD3', 'SuE_BD3', 'SuE_RH4', 'SuE_GH4', 'SuE_BH4', 'SuE_RV4', 'SuE_GV4', 'SuE_BV4', 'SuE_RD4', 'SuE_GD4', 'SuE_BD4', 'ThE_RH1', 'ThE_GH1', 'ThE_BH1', 'ThE_RV1', 'ThE_GV1', 'ThE_BV1', 'ThE_RD1', 'ThE_GD1', 'ThE_BD1', 'ThE_RH2', 'ThE_GH2', 'ThE_BH2', 'ThE_RV2', 'ThE_GV2', 'ThE_BV2', 'ThE_RD2', 'ThE_GD2', 'ThE_BD2', 'ThE_RH3', 'ThE_GH3', 'ThE_BH3', 'ThE_RV3', 'ThE_GV3', 'ThE_BV3', 'ThE_RD3', 'ThE_GD3', 'ThE_BD3', 'ThE_RH4', 'ThE_GH4', 'ThE_BH4', 'ThE_RV4', 'ThE_GV4', 'ThE_BV4', 'ThE_RD4', 'ThE_GD4', 'ThE_BD4'};
predictors = inputTable(:, predictorNames);
response = inputTable.Type;
isCategoricalPredictor = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];

% Perform cross-validation
partitionedModel = crossval(trainedClassifier.ClassificationEnsemble, 'KFold', 10);

% Compute validation predictions
[validationPredictions, validationScores] = kfoldPredict(partitionedModel);

% Compute validation accuracy
validationAccuracy = 1 - kfoldLoss(partitionedModel, 'LossFun', 'ClassifError');
