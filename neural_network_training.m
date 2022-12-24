function [net,tr] =neural_network_training(inputs,targets)
inputs=transpose(inputs);
targets=transpose(targets);
% Create a Pattern Recognition Network
hiddenLayerSize =30;
net = patternnet(hiddenLayerSize);


% Set up Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 100/100;
net.divideParam.valRatio = 20/100;
net.divideParam.testRatio = 20/100;
net.trainParam.epochs=100;

% Train the Network
[net,tr] = train(net,inputs,targets);



% View the Network
%view(net)

% Plots
% Uncomment these lines to enable various plots.
%figure, plotperform(tr)
%figure, plottrainstate(tr)
