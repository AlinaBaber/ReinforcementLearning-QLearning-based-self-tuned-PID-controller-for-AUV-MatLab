function [Kp_range,Ki_range,Kd_range] =neural_network_training(Features)
%Features= [error,previous_error];
MFile= load('nnmodels'); 
%==================Kp======================================%
% Test the Network
Features=transpose(Features);
Kp_output=MFile.NNStruct_Kp(Features);
%Kp_errors = gsubtract(targets1,Kp_output);
%Kp_performance = perform(MFile.NNStruct_categories,targets1,Kp_output);
%Kp_performance= perform(MFile.NNStruct_categories,targets1(2),Kp_output);
%Kp_performance= max([performance1,performance2]);
A= max(Kp_output);
Kp_Error=1-max(Kp_output);
if A==Kp_output(1,:)
    Kp={'Zero'};
    Kp_cost=[1,0,0,0,0,0,0,0];
    Kp_range= [249.8, 250];
elseif A==Kp_output(2,:)
    Kp={'Small'}; 
    Kp_cost=[0,1,0,0,0,0,0,0];
    Kp_range=  [250, 250.3];
elseif A==Kp_output(3,:)
    Kp={'Medium'}; 
    Kp_cost=[0,0,1,0,0,0,0,0];
    Kp_range=  [ 250.5, 250.8];
elseif A==Kp_output(4,:)
    Kp={'Big'}; 
    Kp_cost=[0,0,0,1,0,0,0,0];
    Kp_range=  [250.8 ,251];
elseif A==Kp_output(5,:)
    Kp={'Very Big'};
    Kp_cost=[1,0,0,0,0,0,0,0];
     Kp_range= [ 251 ,251.3];
else
    Kp_range=[250,251];

end
%==================Ki======================================%
% Test the Network
%Features=transpose(Features);
Ki_output=MFile.NNStruct_Ki(Features);
%Ki_errors = gsubtract(targets1,Ki_output);
%Ki_performance = perform(MFile.NNStruct_categories,targets1,Ki_output);
%Ki_performance= perform(MFile.NNStruct_categories,targets1(2),Ki_output);
%Ki_performance= max([performance1,performance2]);

A=max(Ki_output);
Ki_Error=1-max(Ki_output);
if A==Ki_output(1,:)
    Ki={'Zero'};
    Ki_cost=[1,0,0,0,0,0,0,0];
    Ki_range=  [-0.25, 0 ];
elseif A==Ki_output(2,:)
    Ki={'Small'}; 
    Ki_cost=[0,1,0,0,0,0,0,0];
    Ki_range=  [0.25, 0.5];
elseif A==Ki_output(3,:)
    Ki={'Medium'}; 
    Ki_cost=[0,0,1,0,0,0,0,0];
    Ki_range=  [0.5 ,0.75];
elseif A==Ki_output(4,:)
    Ki={'Big'}; 
    Ki_cost=[0,0,0,1,0,0,0,0];
    Ki_range=  [0.75, 1];
elseif A==Ki_output(5,:)
    Ki={'Very Big'};
    Ki_cost=[1,0,0,0,0,0,0,0];
    Ki_range=  [1 ,1.25];
else
    Ki_range=[0,1];

end

%==================Kd======================================%
% Test the Network
%Features=transpose(Features);
Kd_output=MFile.NNStruct_Kd(Features);
%Kd_errors = gsubtract(targets1,Kd_output);
%Kd_performance = perform(MFile.NNStruct_categories,targets1,Kd_output);
%Kd_performance= perform(MFile.NNStruct_categories,targets1(2),Kd_output);
%Kd_performance= max([performance1,performance2]);

A=max(Kd_output);
Kd_Error=1-max(Kd_output);
if A==Kd_output(1,:)
    Kd={'Zero'};
    Kd_cost=[1,0,0,0,0,0,0,0];
    Kd_range=   [78.5, 80];
elseif A==Kd_output(2,:)
    Kd={'Small'}; 
    Kd_cost=[0,1,0,0,0,0,0,0];   
    Kd_range=   [81.5, 82.5];
elseif A==Kd_output(3,:)
    Kd={'Medium'}; 
    Kd_cost=[0,0,1,0,0,0,0,0];
     Kd_range=   [82.5, 84];
elseif A==Kd_output(4,:)
    Kd={'Big'}; 
    Kd_cost=[0,0,0,1,0,0,0,0];
     Kd_range=   [84 ,85];
elseif A==Kd_output(5,:)
    Kd={'Very Big'};
    Kd_cost=[1,0,0,0,0,0,0,0];
     Kd_range=   [85 ,86.5];
else
    Kd_range=[80,85];
end
% Plots
% Uncomment these lines to enable various plots.
% figure, plotperform(tr)
% figure, plottrainstate(tr)
%figure, plotconfusion(targets1,Kd_output)
%figure, ploterrhist(Kd_errors)
%Categories_errors = gsubtract(targets,frequency_categories_outputs);
%Categories_performance = perform(MFile.NNStruct_frequency_categories,targets,frequency_categories_outputs);
