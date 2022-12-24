function nnki_training()
File=load('nn_dataset');

[NNStruct_Ki,NNTr_Ki] = neural_network_training(File.data,File.D_Ki_NN);
save('nnmodels.mat','NNStruct_Ki','-append');
save('nnmodels.mat','NNTr_Ki','-append');
figure, plotperform(NNTr_Ki);
figure, plottrainstate(NNTr_Ki);
