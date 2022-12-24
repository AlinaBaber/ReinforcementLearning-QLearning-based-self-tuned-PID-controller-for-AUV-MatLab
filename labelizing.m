 File=load('matlab');
 D_Kp={};
 D_Kp_NN =[];
for i=1:605

 if File.d_Kp(i)<=250.3 && File.d_Kp(i)>248
  D_Kp(i)={'ZE'};
  D_Kp_NN(i,:)=[1,0,0,0,0];
 elseif File.d_Kp(i)<=250.5 && File.d_Kp(i)>250.3
   D_Kp(i)={'S'};
  D_Kp_NN(i,:)=[0,1,0,0,0];
  elseif File.d_Kp(i)<=250.8 && File.d_Kp(i)>250.5
   D_Kp(i)={'M'};
 D_Kp_NN(i,:)=[0,0,1,0,0];
  elseif File.d_Kp(i)<=251 && File.d_Kp(i)>250.8
   D_Kp(i)={'B'};
  D_Kp_NN(i,:)=[0,0,0,1,0];
   elseif File.d_Kp(i)<=251.3 && File.d_Kp(i)>251
   D_Kp(i)={'VB'};
  D_Kp_NN(i,:)=[0,0,0,0,1];
 end
end
  D_Ki={};
 D_Ki_NN =[];
for i=1:605

 if File.d_Ki(i)<=0.25 && File.d_Ki(i)>=-0.25
   D_Ki(i)={'ZE'};
  D_Ki_NN(i,:)=[1,0,0,0,0];
 elseif File.d_Ki(i)<=0.5 && File.d_Ki(i)>0.25
    D_Ki(i)={'S'};
  D_Ki_NN(i,:)=[0,1,0,0,0];
  elseif File.d_Ki(i)<=0.75 && File.d_Ki(i)>0.5
    D_Ki(i)={'M'};
 D_Ki_NN(i,:)=[0,0,1,0,0];
  elseif File.d_Ki(i)<=1 && File.d_Ki(i)>0.75
    D_Ki(i)={'B'};
  D_Ki_NN(i,:)=[0,0,0,1,0];
   elseif File.d_Ki(i)<=1.25 && File.d_Ki(i)>1
    D_Ki(i)={'VB'};
  D_Ki_NN(i,:)=[0,0,0,0,1];
 end
end
  D_Kd={};
 D_Kd_NN =[];
for i=1:605

 if File.d_Kd(i)<=81.5 && File.d_Kd(i)>=78.5
   D_Kd(i)={'ZE'};
  D_Kd_NN(i,:)=[1,0,0,0,0];
 elseif File.d_Kd(i)<=82.5 && File.d_Kd(i)>81.5
    D_Kd(i)={'S'};
  D_Kd_NN(i,:)=[0,1,0,0,0];
  elseif File.d_Kd(i)<=84 && File.d_Kd(i)>82.5
    D_Kd(i)={'M'};
 D_Kd_NN(i,:)=[0,0,1,0,0];
  elseif File.d_Kd(i)<=85 && File.d_Kd(i)>84
    D_Kd(i)={'B'};
  D_Kd_NN(i,:)=[0,0,0,1,0];
   elseif File.d_Kd(i)<=86.5 && File.d_Kd(i)>85
    D_Kd(i)={'VB'};
  D_Kd_NN(i,:)=[0,0,0,0,1];
 end
end
D_Labels= D_Kp, D_Ki, D_Kd;
D_NN_Labels=[D_Kp_NN_Labels, D_Ki_NN, D_Kd_NN];