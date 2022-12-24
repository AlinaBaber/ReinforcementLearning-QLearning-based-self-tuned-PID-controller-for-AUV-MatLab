function [Kp_range,Ki_range,Kd_range] =q_learning_fun(MFile,Features)

%==================Kp======================================%
%Features=transpose(Features);
Kp_output=MFile.QLStruct_Kp(Features);
A= max(Kp_output);
Kp_Error=1-max(Kp_output);
if A==Kp_output(1,:)
    Kp={'Zero'};
    Kp_cost=[1,0,0,0,0,0,0,0];
    Kp_range= [249.8, 250];
    Kp_range=mean(Kp_range)+std(Kp_range);
elseif A==Kp_output(2,:)
    Kp={'Small'}; 
    Kp_cost=[0,1,0,0,0,0,0,0];
    Kp_range=  [250.1, 250.3];
    Kp_range=mean(Kp_range)+std(Kp_range);
elseif A==Kp_output(3,:)
    Kp={'Medium'}; 
    Kp_cost=[0,0,1,0,0,0,0,0];
    Kp_range=  [ 250.4, 250.8];
    Kp_range=mean(Kp_range)+std(Kp_range);
elseif A==Kp_output(4,:)
    Kp={'Big'}; 
    Kp_cost=[0,0,0,1,0,0,0,0];
    Kp_range=  [250.9 ,251];
    Kp_range=mean(Kp_range)+std(Kp_range);
elseif A==Kp_output(5,:)
    Kp={'Very Big'};
    Kp_cost=[1,0,0,0,0,0,0,0];
    Kp_range= [ 251.1 ,251.3];
    Kp_range=mean(Kp_range)+std(Kp_range);
else
    Kp_range=[251.4,252];
    Kp_range=mean(Kp_range)+std(Kp_range);

end
%==================Ki======================================%
% Test the Network
%Features=transpose(Features);
Ki_output=MFile.QLStruct_Ki(Features);


A=max(Ki_output);
Ki_Error=1-max(Ki_output);
if A==Ki_output(1,:)
    Ki={'Zero'};
    Ki_cost=[1,0,0,0,0,0,0,0];
    Ki_range=  [-0.25, 0 ];
    Ki_range=mean(Ki_range)+std(Ki_range);
elseif A==Ki_output(2,:)
    Ki={'Small'}; 
    Ki_cost=[0,1,0,0,0,0,0,0];
    Ki_range=  [0.1, 0.25];
    Ki_range=mean(Ki_range)+std(Ki_range);
elseif A==Ki_output(3,:)
    Ki={'Medium'}; 
    Ki_cost=[0,0,1,0,0,0,0,0];
    Ki_range=  [0.26 ,0.50];
    Ki_range=mean(Ki_range)+std(Ki_range);
elseif A==Ki_output(4,:)
    Ki={'Big'}; 
    Ki_cost=[0,0,0,1,0,0,0,0];
    Ki_range=  [0.51, 0.75];
    Ki_range=mean(Ki_range)+std(Ki_range);
elseif A==Ki_output(5,:)
    Ki={'Very Big'};
    Ki_cost=[1,0,0,0,0,0,0,0];
    Ki_range=  [0.76 ,1];
    Ki_range=mean(Ki_range)+std(Ki_range);
else
    Ki_range=[1.1,1.25];
    Ki_range=mean(Ki_range)+std(Ki_range);

end

%==================Kd======================================%
% Test the Network
%Features=transpose(Features);
Kd_output=MFile.QLStruct_Kd(Features);


A=max(Kd_output);
Kd_Error=1-max(Kd_output);
if A==Kd_output(1,:)
    Kd={'Zero'};
    Kd_cost=[1,0,0,0,0,0,0,0];
    Kd_range=   [78.5, 80];
    Kd_range=mean(Kd_range)+std(Kd_range);
elseif A==Kd_output(2,:)
    Kd={'Small'}; 
    Kd_cost=[0,1,0,0,0,0,0,0];   
    Kd_range=   [81.5, 82.5];
    Kd_range=mean(Kd_range)+std(Kd_range);
elseif A==Kd_output(3,:)
    Kd={'Medium'}; 
    Kd_cost=[0,0,1,0,0,0,0,0];
    Kd_range=   [82.5, 84];
    Kd_range=mean(Kd_range)+std(Kd_range);
elseif A==Kd_output(4,:)
    Kd={'Big'}; 
    Kd_cost=[0,0,0,1,0,0,0,0];
     Kd_range=   [84 ,85];
     Kd_range=mean(Kd_range)+std(Kd_range);
elseif A==Kd_output(5,:)
    Kd={'Very Big'};
    Kd_cost=[1,0,0,0,0,0,0,0];
     Kd_range=   [85 ,86.5];
     Kd_range=mean(Kd_range)+std(Kd_range);
else
    Kd_range=[80,85];
    Kd_range=mean(Kd_range)+std(Kd_range);
end
% Plots
% Uncomment these lines to enable various plots.
% figure, plotperform(tr)
% figure, plottrainstate(tr)
%figure, plotconfusion(targets1,Kd_output)
%figure, ploterrhist(Kd_errors)
%Categories_errors = gsubtract(targets,frequency_categories_outputs);
%Categories_performance = perform(MFile.NNStruct_frequency_categories,targets,frequency_categories_outputs);
