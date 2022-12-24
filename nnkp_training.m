function nnkp_training()
File=load('nn_dataset');
%==================Speech Disorder======================================%
%----(1)----------Frequency--------------

[NNStruct_Kp,NNTr_Kp] = neural_network_training(File.data,File.D_Kp_NN);
save('nnmodels.mat','NNStruct_Kp','-append');
save('nnmodels.mat','NNTr_Kp','-append');
figure, plotperform(NNTr_Kp);
figure, plottrainstate(NNTr_Kp);
