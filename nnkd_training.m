function nnkd_training()
File=load('nn_dataset');

[NNStruct_Kd,NNTr_Kd] = neural_network_training(File.data,File.D_Kd_NN);
save('nnmodels.mat','NNStruct_Kd','-append');
save('nnmodels.mat','NNTr_Kd','-append');
figure, plotperform(NNTr_Kd);
figure, plottrainstate(NNTr_Kd);
