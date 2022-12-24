function [results,E,EE,iii,A,B,C]= nnfuzzypid()
clear;
clc;
num=6000;

d1 = 0.191;
l1 = 1.33;

d = 0.2;
l = 2.135;

g=9.8;
W1 = 299;
B1 = 306;
m1 = W1/g;

global W;
global B;
global m;

m=2.18+3.33+25+3.33+8.6;
Bm=2.88+1.14+28.59+1.14+10.1;
W = m*g;
B = Bm*g;


global xg;
global yg;
global zg;
xg=0;
yg=0;
zg=0.05;

global xb;
global yb;
global zb;
xb=0.01;
yb=0;
zb=0;

global I;
global X;
global Y;
global Z;
global K;
global M;
global N;

I.xx=0.177/(W1*l1*d1^2)*(W*l*d^2);
I.yy=3.45/(W1*l1^2*d1^2)*(W*l^2*d^2);
I.zz=3.45/(W1*l1^2*d1^2)*(W*l^2*d^2);

X.u_u = -1.62/(d1^2)*(d^2);
X.ua = -0.93/0.3585*0.02071/(l1*d1^2)*(l*d^2);

Y.v_v = -131/(d1*l1)*(d*l);
Y.r_r = 0.632/(l1^3*d1)*(l^3*d);
Y.va = -35.5/(l1*d1^2)*(l*d^2);
Y.ra = 1.93/(l1^2*d1^2)*(l^2*d^2);

Z.w_w = -131/(d1*l1)*(d*l);
Z.q_q = -0.632/(l1^3*d1)*(l^3*d);
Z.wa = Y.va;
Z.qa = -1.93/(l1^2*d1^2)*(l^2*d^2);

K.p_p = Y.v_v*0.001;
K.pa = -0.0704*l/l1;

M.w_w = 3.18/(l1^2*d1)*(l^2*d);
M.q_q = -188/(l1^4*d1)*(l^4*d);
M.wa = -1.93/(l1^2*d1^2)*(l^2*d^2);
M.qa = -4.88/(l1^3*d1^2)*(l^3*d^2);

N.r_r = -94/(l1^4*d1)*(l^4*d);
N.v_v = -M.w_w;
N.va = 1.93/(l1^2*d1^2)*(l^2*d^2);
N.ra = -4.88/(l1^3*d1^2)*(l^3*d^2);

X.wq = Z.wa;
X.qq = Z.qa;
X.vr = -Y.va;
X.rr = -Y.ra;

Y.ur = 5.22/(l1*d1^2)*(l*d^2);
Y.wp = -Z.wa;
Y.pq = -Z.qa;

Z.uq = -Y.ur;
Z.vp = Y.va;
Z.rp = Y.ra;

M.uw = 24/(l1*d1^2)*(l*d^2);
M.vp = -Y.ra;
M.rp = 4.86/(l1^3*d1^2)*(l^3*d^2);
M.uq = -2/(l1^2*d1^2)*(l^2*d^2);

N.uv = -24/(l1*d1^2)*(l*d^2);
N.wp = Z.qa;
N.pq = -4.86/(l1^3*d1^2)*(l^3*d^2);
N.ur = -2/(l1^2*d1^2)*(l^2*d^2);

Y.uv = -28.6/(d1*l1)*(d*l);
Z.uw = Y.uv;

global DD;
global DDD;
DD=zeros(6,6);

DD(1,1)=m-X.ua;
DD(1,5)=m*zg;
DD(1,6)=-m*yg;

DD(2,2)=m-Y.va;
DD(2,4)=-m*zg;
DD(2,6)=m*xg-Y.ra;

DD(3,3)=m-Z.wa;
DD(3,4)=m*yg;
DD(3,5)=-m*xg-Z.qa;

DD(4,2)=-m*zg;
DD(4,3)=m*yg;
DD(4,4)=I.xx-K.pa;

DD(5,1)=m*zg;
DD(5,3)=-m*xg-M.wa;
DD(5,5)=I.yy-M.qa;

DD(6,1)=-m*yg;
DD(6,2)=m*xg-N.va;
DD(6,6)=I.zz-N.ra;
DDD=DD;
DD = DD^-1;

for i=1:6;
    for j=1:6
        if abs(DD(i,j))<0.00009
            DD(i,j)=0;
        end
    end
end

global Sv;
Sv.x=0;
Sv.y=0.1;




%%%%%%%%%%%%%%      %%%%%%%%%%%%%%
E=zeros(1,3);%XYZ
E(3)=10;
% XXX=zeros(1,1000);
% YYY=zeros(1,1000);
% ZZZ=zeros(1,1000);
EE=zeros(num,3);

buf1=zeros(num,1);
buf2=zeros(num,1);
buf3=zeros(num,1);
buf4=zeros(num,1);
buf5=zeros(num,1);
buf6=zeros(num,1);
buf7=zeros(num,1);
buf8=zeros(num,1);
buf9=zeros(num,1);
buf10=zeros(num,1);
buf11=zeros(num,1);
buf12=zeros(num,1);
buf13=zeros(num,1);
buf14=zeros(num,1);

buf15=zeros(num,1);
buf16=zeros(num,1);
buf17=zeros(num,1);
buf18=zeros(num,1);
buf19=zeros(num,1);
buf20=zeros(num,1);
buf21=zeros(num,1);
buf22=zeros(num,1);
buf23=zeros(num,1);
buf24=zeros(num,1);
buf25=zeros(num,1);
buf26=zeros(num,1);
buf27=zeros(num,1);
buf28=zeros(num,1);
%%%%%%%%%%%%%%    %%%%%%%%%%%%%%
%%%%%%%%%%%%%%    %%%%%%%%%%%%%%
ins.x=0;%    
ins.y=0;
ins.z=0;
ins.px=0;%    
ins.py=0;
ins.pz=0;

ins.u_a=0;
ins.v_a=0;
ins.w_a=0;
ins.p_a=0;
ins.q_a=0;
ins.r_a=0;
ins.pu_a=0;
ins.pv_a=0;
ins.pw_a=0;
ins.pp_a=0;
ins.pq_a=0;
ins.pr_a=0;

ins.p=0;
ins.q=0;
ins.r=0;
ins.pp=0;
ins.pq=0;
ins.pr=0;
%%%%%%%%%%%%%%     %%%%%%%%%%%%%%
depth=0;
pdepth=0;
%%%%%%%%%%%%%%GPS  %%%%%%%%%%%%%%
gps.x=E(1);%  
gps.y=E(2);%  
gps.px=E(1);%  
gps.py=E(2);%  
%%%%%%%%%%%%%%     %%%%%%%%%%%%%%
doppler.u=0;
doppler.v=0;
doppler.w=0;

doppler.pu=0;
doppler.pv=0;
doppler.pw=0;

doppler.fu=0;
doppler.fv=0;
doppler.fw=0;
% doppler.nfu=0;%                 
% doppler.nfv=0;
% doppler.nfw=0;
doppler.f=600;%kHz
EDV=zeros(1,3);
%%%%%%%%%%%%%%USBL%%%%%%%%%%%%%%
%             
usbl=zeros(1,3);
usbl(1)=10;
usbl(2)=10;
usbl(3)=20;
%usb=zeros(1,3);
usb=usbl;
pan=0;
an=0;
% usb(1)=atan(usbl(3)/usbl(2));
% usb(2)=atan(usbl(1)/usbl(3));
% usb(3)=atan(usbl(2)/usbl(1));
%%%%%%%%%%%%%%   %%%%%%%%%%%%%%
TT=zeros(1,5);
TTf=zeros(1,5);

%%%%%%%%%%%%%%    u v w p q r heel trim head%%%%%%%%%%%%%%
vel=zeros(1,9);
velf=zeros(1,9);

EV=zeros(1,3);%E   
EVf=zeros(1,3);
J=zeros(3,3);

k1=0;
k2=0;
k3=0;
k4=0;

ins.x=vel(7);%    
ins.y=vel(8);
ins.z=vel(9);

E
T=0.05;
Tc=0.2;

%%%%%%%%%%%%%%PID I
INT.dd=0;
INT.dtrim=0;
INT.angel=0;
INT.x=0;
INT.y=0;
%%%%%%%%%%%%%%    +
flag=1;
obj=pi;%     

for ii=1:num
    EV=EVf;
    TT=TTf;
    %%   
    
%     if ii==1000
%        velf(8)=1;
%     end
    
    
    if mod(ii+1,Tc/T)==0
        
        pan=an;
        
        ins.px=ins.x;
        ins.py=ins.y;
        ins.pz=ins.z;
        ins.pp=ins.p;
        ins.pq=ins.q;
        ins.pr=ins.r;
        ins.pu_a=ins.u_a;
        ins.pv_a=ins.v_a;
        ins.pw_a=ins.w_a;
        ins.pp_a=ins.p_a;
        ins.pq_a=ins.q_a;
        ins.pr_a=ins.r_a;
        
        pdepth=depth;
        
        gps.px=gps.x;
        gps.py=gps.y;
        
        doppler.pu=doppler.u;
        doppler.pv=doppler.v;
        doppler.pw=doppler.w;
        
        ins.p=velf(4) ;%     
        ins.q=velf(5) ;%     
        ins.r=velf(6) ;%     
        
        ins.u_a=(velf(1)-vel(1))/Tc ;%     
        ins.v_a=(velf(2)-vel(2))/Tc ;%     
        ins.w_a=(velf(3)-vel(3))/Tc ;%     
        
        ins.p_a=(velf(4)-vel(4))/Tc ;%     
        ins.q_a=(velf(5)-vel(5))/Tc ;%     
        ins.r_a=(velf(6)-vel(6))/Tc ;%     
        
        ins.x=ins.x+(ins.p+sin(ins.x)*tan(ins.y)*ins.q+cos(ins.x)*tan(ins.y)*ins.r)*Tc;
        ins.y=ins.y+(cos(ins.x)*ins.q-sin(ins.x)*ins.r)*Tc;
        ins.z=ins.z+(sin(ins.x)/cos(ins.y)*ins.q+cos(ins.x)/cos(ins.y)*ins.r)*Tc;
%         ins.x=velf(7);
%         ins.y=velf(8);
%         ins.z=velf(9);
        
        depth=E(3) ;%     
        
        %     gps.x=gps.x+;%x
        %     gps.y=gps.y+;%y
        
        doppler.fu=(1+velf(1)/1500)*doppler.f ;%     
        doppler.fv=(1+velf(2)/1500)*doppler.f ;%     
        doppler.fw=(1+velf(3)/1500)*doppler.f ;%     
        
        doppler.u=(doppler.fu/doppler.f-1)*1500;
        doppler.v=(doppler.fv/doppler.f-1)*1500;
        doppler.w=(doppler.fw/doppler.f-1)*1500;
        
        %  
        
        pusb=usb;
        J=[cos(ins.z)*cos(ins.y),                                 sin(ins.z)*cos(ins.y),                                 -sin(ins.y);
            cos(ins.z)*sin(ins.y)*sin(ins.x)-sin(ins.z)*cos(ins.x),sin(ins.z)*sin(ins.y)*sin(ins.x)+cos(ins.z)*cos(ins.x),cos(ins.y)*sin(ins.x);
            cos(ins.z)*sin(ins.y)*cos(ins.x)+sin(ins.z)*sin(ins.x),sin(ins.z)*sin(ins.y)*cos(ins.x)-cos(ins.z)*sin(ins.x),cos(ins.y)*cos(ins.x)];
        usb=(J*(usbl-E)')';%      
        EDV = double((J'*[doppler.u,doppler.v,doppler.w]')');
        INT.dd=INT.dd+(usbl(3)-depth);
        
        
        
        if flag==1
            if (usb(1)<0)&&(usb(2)<=0)
                
            an=atan(usb(2)/usb(1))-pi;
            elseif (usb(1)<0)&&(usb(2)>=0)
                an=atan(usb(2)/usb(1))+pi;
            elseif (usb(1)==0)&&(usb(2)>=0)
                an=pi/2;
            elseif  (usb(1)==0)&&(usb(2)<=0)
                an=-pi/2;
            else
                an=atan(usb(2)/usb(1));
            end
            File=load('nn_pid');
            flag_value=[File.flag_value;flag]; 
            save('nn_pid.mat','flag_value','-append');
            INT.dtrim=INT.dtrim+0.1-ins.y;
            INT.angel=INT.angel+an;
            INT_dtrim=[File.INT_dtrim;INT.dtrim]; 
            save('nn_pid.mat','INT_dtrim','-append');
            INT_angel=[File.INT_angel;INT.angel]; 
            save('nn_pid.mat','INT_angel','-append');
            TTf(1)=-X.u_u*0.8*0.8;
            File=load('nn_pid');
            fismat = readfis('fuzzy_piddirect');
            out_direct = evalfis([an;pan],fismat);
            d_an=[File.d_an;an]; 
            d_pan=[File.d_pan;pan]; 
            save('nn_pid.mat','d_an','-append');
            save('nn_pid.mat','d_pan','-append');
            Kp = out_direct(1); Ki= out_direct(2);Kd= out_direct(3);
            Features=[an,pan];
            [Kp_range,Ki_range ,Kd_range]=neural_network_classification(Features) ;
                       Kp=mean([Kp_range,Kp]);
            Ki=mean([Ki_range,Ki]);
            Kd=mean([Kd_range,Kd]);
            d_Kp=[File.d_Kp;Kp]; 
            d_Ki=[File.d_Ki;Ki]; 
            d_Kd=[File.d_Kd;Kd];
            save('nn_pid.mat','d_Kp','-append');
            save('nn_pid.mat','d_Ki','-append');
            save('nn_pid.mat','d_Kd','-append');
            TTf(5)=Direct(pan,an,INT.angel,1,Kp,Ki,Kd);
            fismat = readfis('fuzzy_pid3');
            out_direct = evalfis([ins.y;ins.py],fismat);
            t_ins_y=[File.t_ins_y;ins.y]; 
            t_ins_py=[File.t_ins_py;ins.py]; 
            save('nn_pid.mat','t_ins_y','-append');
            save('nn_pid.mat','t_ins_py','-append');
            Kp = out_direct(1); Ki= out_direct(2);Kd= out_direct(3);
            Features=[ins.y,ins.py];
            [Kp_range,Ki_range ,Kd_range]=neural_network_classification(Features) ;
                       Kp=mean([Kp_range,Kp]);
            Ki=mean([Ki_range,Ki]);
            Kd=mean([Kd_range,Kd]);
            t_Kp=[File.d_Kp;Kp]; 
            t_Ki=[File.d_Ki;Ki]; 
            t_Kd=[File.d_Kd;Kd];
            save('nn_pid.mat','t_Kp','-append');
            save('nn_pid.mat','t_Ki','-append');
            save('nn_pid.mat','t_Kd','-append');
            TTf(4)=TRIM(ins.py,ins.y,INT.dtrim,0.1,1,Kp,Ki,Kd);
            if usb(1)^2+usb(2)^2<sqrt(25) 
                if usbl(1)~=0
                    usbl(1)=0;    
                    usbl(2)=20;
                else flag=2;
                     
                     
              
                    
%                     flag=2;
%                     INT.dtrim=0;
%                     INT.angel=0;
%                     pan=0;
                end                
            end
        elseif flag==2
            if (usb(1)<0)&&(usb(2)<=0)
                
            an=atan(usb(2)/usb(1))-pi;
            elseif (usb(1)<0)&&(usb(2)>=0)
                an=atan(usb(2)/usb(1))+pi;
            elseif (usb(1)==0)&&(usb(2)>=0)
                an=pi/2;
            elseif  (usb(1)==0)&&(usb(2)<=0)
                an=-pi/2;
            else
                an=atan(usb(2)/usb(1));
            end
            flag_value=[File.flag_value;flag]; 
            save('nn_pid.mat','flag_value','-append');
            INT.dtrim=INT.dtrim+0.1-ins.y;
            INT.angel=INT.angel+an;
            INT_dtrim=[File.INT_dtrim;INT.dtrim]; 
            save('nn_pid.mat','INT_dtrim','-append');
            INT_angel=[File.INT_angel;INT.angel]; 
            save('nn_pid.mat','INT_angel','-append');
            TTf(1)=-X.u_u*0.8*0.8;
File=load('nn_pid');
            fismat = readfis('fuzzy_piddirect');
            out_direct = evalfis([an;pan],fismat);
            d_an=[File.d_an;an]; 
            d_pan=[File.d_pan;pan]; 
            save('nn_pid.mat','d_an','-append');
            save('nn_pid.mat','d_pan','-append');
            Kp = out_direct(1); Ki= out_direct(2);Kd= out_direct(3);
            Features=[an,pan];
            [Kp_range,Ki_range ,Kd_range]=neural_network_classification(Features); 
             Kp=mean([Kp_range,Kp]);
            Ki=mean([Ki_range,Ki]);
            Kd=mean([Kd_range,Kd]);
            d_Kp=[File.d_Kp;Kp]; 
            d_Ki=[File.d_Ki;Ki]; 
            d_Kd=[File.d_Kd;Kd];
            save('nn_pid.mat','d_Kp','-append');
            save('nn_pid.mat','d_Ki','-append');
            save('nn_pid.mat','d_Kd','-append');
            TTf(5)=Direct(pan,an,INT.angel,1,Kp,Ki,Kd);
            fismat = readfis('fuzzy_pid3');
            out_direct = evalfis([ins.y;ins.py],fismat);
            t_ins_y=[File.t_ins_y;ins.y]; 
            t_ins_py=[File.t_ins_py;ins.py]; 
            save('nn_pid.mat','t_ins_y','-append');
            save('nn_pid.mat','t_ins_py','-append');
            Kp = out_direct(1); Ki= out_direct(2);Kd= out_direct(3);
            Kp = out_direct(1); Ki= out_direct(2);Kd= out_direct(3);
            Features=[ins.y,ins.py];
            [Kp_range,Ki_range ,Kd_range]=neural_network_classification(Features) ;
                       Kp=mean([Kp_range,Kp]);
            Ki=mean([Ki_range,Ki]);
            Kd=mean([Kd_range,Kd]);
            t_Kp=[File.d_Kp;Kp]; 
            t_Ki=[File.d_Ki;Ki]; 
            t_Kd=[File.d_Kd;Kd];
            save('nn_pid.mat','t_Kp','-append');
            save('nn_pid.mat','t_Ki','-append');
            save('nn_pid.mat','t_Kd','-append');
            TTf(4)=TRIM(ins.py,ins.y,INT.dtrim,0.1,1,Kp,Ki,Kd);
             if usb(1)^2+usb(2)^2<sqrt(25)
                if usbl(1)~=10
                    usbl(1)=10;
                    usbl(2)=30;
                else flag=3;
                end   
             end
              elseif flag==3
            if (usb(1)<0)&&(usb(2)<=0)
                
            an=atan(usb(2)/usb(1))-pi;
            elseif (usb(1)<0)&&(usb(2)>=0)
                an=atan(usb(2)/usb(1))+pi;
            elseif (usb(1)==0)&&(usb(2)>=0)
                an=pi/2;
            elseif  (usb(1)==0)&&(usb(2)<=0)
                an=-pi/2;
            else
                an=atan(usb(2)/usb(1));
            end
            flag_value=[File.flag_value;flag]; 
            save('nn_pid.mat','flag_value','-append');
            INT.dtrim=INT.dtrim+0.1-ins.y;
            INT.angel=INT.angel+an;
            INT_dtrim=[File.INT_dtrim;INT.dtrim]; 
            save('nn_pid.mat','INT_dtrim','-append');
            INT_angel=[File.INT_angel;INT.angel]; 
            save('nn_pid.mat','INT_angel','-append');
            TTf(1)=-X.u_u*0.8*0.8;
            File=load('nn_pid');
            fismat = readfis('fuzzy_piddirect');
            out_direct = evalfis([an;pan],fismat);
            d_an=[File.d_an;an]; 
            d_pan=[File.d_pan;pan]; 
            save('nn_pid.mat','d_an','-append');
            save('nn_pid.mat','d_pan','-append');
            Kp = out_direct(1); Ki= out_direct(2);Kd= out_direct(3);
            Features=[an,pan]
            [Kp_range,Ki_range ,Kd_range]=neural_network_classification(Features) ;
             Kp=mean([Kp_range,Kp]);
            Ki=mean([Ki_range,Ki]);
            Kd=mean([Kd_range,Kd]);
            d_Kp=[File.d_Kp;Kp]; 
            d_Ki=[File.d_Ki;Ki]; 
            d_Kd=[File.d_Kd;Kd];
            save('nn_pid.mat','d_Kp','-append');
            save('nn_pid.mat','d_Ki','-append');
            save('nn_pid.mat','d_Kd','-append');
            TTf(5)=Direct(pan,an,INT.angel,1,Kp,Ki,Kd);
            fismat = readfis('fuzzy_pid3');
            out_direct = evalfis([ins.y;ins.py],fismat);
            t_ins_y=[File.t_ins_y;ins.y]; 
            t_ins_py=[File.t_ins_py;ins.py]; 
            save('nn_pid.mat','t_ins_y','-append');
            save('nn_pid.mat','t_ins_py','-append');
            Kp = out_direct(1); Ki= out_direct(2);Kd= out_direct(3);
            Kp = out_direct(1); Ki= out_direct(2);Kd= out_direct(3);
            Features=[ins.y,ins.py];
            [Kp_range,Ki_range ,Kd_range]=neural_network_classification(Features) ;
                       Kp=mean([Kp_range,Kp]);
            Ki=mean([Ki_range,Ki]);
            Kd=mean([Kd_range,Kd]);
            t_Kp=[File.d_Kp;Kp]; 
            t_Ki=[File.d_Ki;Ki]; 
            t_Kd=[File.d_Kd;Kd];
            save('nn_pid.mat','t_Kp','-append');
            save('nn_pid.mat','t_Ki','-append');
            save('nn_pid.mat','t_Kd','-append');
            TTf(4)=TRIM(ins.py,ins.y,INT.dtrim,0.1,1,Kp,Ki,Kd);
             if usb(1)^2+usb(2)^2<sqrt(25)
                if usbl(1)~=20
                    usbl(1)=20;
                    usbl(2)=30;
                else flag=4;
                end   
             end
             elseif flag==4
            if (usb(1)<0)&&(usb(2)<=0)
                
            an=atan(usb(2)/usb(1))-pi;
            elseif (usb(1)<0)&&(usb(2)>=0)
                an=atan(usb(2)/usb(1))+pi;
            elseif (usb(1)==0)&&(usb(2)>=0)
                an=pi/2;
            elseif  (usb(1)==0)&&(usb(2)<=0)
                an=-pi/2;
            else
                an=atan(usb(2)/usb(1));
            end

            INT.dtrim=INT.dtrim+0.1-ins.y;
            INT.angel=INT.angel+an;


            TTf(1)=-X.u_u*0.8*0.8;
            File=load('nn_pid');
            fismat = readfis('fuzzy_piddirect');
            out_direct = evalfis([an;pan],fismat);
            Kp = out_direct(1); Ki= out_direct(2);Kd= out_direct(3);
            Features=[an,pan];
            [Kp_range,Ki_range ,Kd_range]=neural_network_classification(Features) ;
             Kp=mean([Kp_range,Kp]);
            Ki=mean([Ki_range,Ki]);
            Kd=mean([Kd_range,Kd]);

            TTf(5)=Direct(pan,an,INT.angel,1,Kp,Ki,Kd);
            fismat = readfis('fuzzy_pid3');
            out_direct = evalfis([ins.y;ins.py],fismat);

            Kp = out_direct(1); Ki= out_direct(2);Kd= out_direct(3);
            Kp = out_direct(1); Ki= out_direct(2);Kd= out_direct(3);
            Features=[ins.y,ins.py];
            [Kp_range,Ki_range ,Kd_range]=neural_network_classification(Features) ;
                       Kp=mean([Kp_range,Kp]);
            Ki=mean([Ki_range,Ki]);
            Kd=mean([Kd_range,Kd]);

            TTf(4)=TRIM(ins.py,ins.y,INT.dtrim,0.1,1,Kp,Ki,Kd);
             if usb(1)^2+usb(2)^2<sqrt(25)
                if usbl(1)~=30
                    usbl(1)=30;
                    usbl(2)=20;
                else flag=5;
                end   
             end
              elseif flag==5
            if (usb(1)<0)&&(usb(2)<=0)
                
            an=atan(usb(2)/usb(1))-pi;
            elseif (usb(1)<0)&&(usb(2)>=0)
                an=atan(usb(2)/usb(1))+pi;
            elseif (usb(1)==0)&&(usb(2)>=0)
                an=pi/2;
            elseif  (usb(1)==0)&&(usb(2)<=0)
                an=-pi/2;
            else
                an=atan(usb(2)/usb(1));
            end

            INT.dtrim=INT.dtrim+0.1-ins.y;
            INT.angel=INT.angel+an;

            TTf(1)=-X.u_u*0.8*0.8;
            File=load('nn_pid');
            fismat = readfis('fuzzy_piddirect');
            out_direct = evalfis([an;pan],fismat);

            Kp = out_direct(1); Ki= out_direct(2);Kd= out_direct(3);
            Features=[an,pan]
            [Kp_range,Ki_range ,Kd_range]=neural_network_classification(Features) ;
             Kp=mean([Kp_range,Kp]);
            Ki=mean([Ki_range,Ki]);
            Kd=mean([Kd_range,Kd]);
            TTf(5)=Direct(pan,an,INT.angel,1,Kp,Ki,Kd);
            fismat = readfis('fuzzy_pid3');
            out_direct = evalfis([ins.y;ins.py],fismat);
           
            Kp = out_direct(1); Ki= out_direct(2);Kd= out_direct(3);
            Kp = out_direct(1); Ki= out_direct(2);Kd= out_direct(3);
            Features=[ins.y,ins.py];
            [Kp_range,Ki_range ,Kd_range]=neural_network_classification(Features) ;
                       Kp=mean([Kp_range,Kp]);
            Ki=mean([Ki_range,Ki]);
            Kd=mean([Kd_range,Kd]);
            
            TTf(4)=TRIM(ins.py,ins.y,INT.dtrim,0.1,1,Kp,Ki,Kd);
             if usb(1)^2+usb(2)^2<sqrt(25)
                if usbl(1)~=20
                    usbl(1)=20;
                    usbl(2)=10;
                else flag=6;
                end   
             end
              elseif flag==6
            if (usb(1)<0)&&(usb(2)<=0)
                
            an=atan(usb(2)/usb(1))-pi;
            elseif (usb(1)<0)&&(usb(2)>=0)
                an=atan(usb(2)/usb(1))+pi;
            elseif (usb(1)==0)&&(usb(2)>=0)
                an=pi/2;
            elseif  (usb(1)==0)&&(usb(2)<=0)
                an=-pi/2;
            else
                an=atan(usb(2)/usb(1));
            end
            
            INT.dtrim=INT.dtrim+0.1-ins.y;
            INT.angel=INT.angel+an;
            
            TTf(1)=-X.u_u*0.8*0.8;
            File=load('nn_pid');
            out_direct = evalfis([an;pan],fismat);
            Kp = out_direct(1); Ki= out_direct(2);Kd= out_direct(3);
            Features=[an,pan]
            [Kp_range,Ki_range ,Kd_range]=neural_network_classification(Features) ;
             Kp=mean([Kp_range,Kp]);
            Ki=mean([Ki_range,Ki]);
            Kd=mean([Kd_range,Kd]);
            TTf(5)=Direct(pan,an,INT.angel,1,Kp,Ki,Kd);
            fismat = readfis('fuzzy_pid3');
            out_direct = evalfis([ins.y;ins.py],fismat);
          
            Kp = out_direct(1); Ki= out_direct(2);Kd= out_direct(3);
            Kp = out_direct(1); Ki= out_direct(2);Kd= out_direct(3);
            Features=[ins.y,ins.py];
            [Kp_range,Ki_range ,Kd_range]=neural_network_classification(Features) ;
                       Kp=mean([Kp_range,Kp]);
            Ki=mean([Ki_range,Ki]);
            Kd=mean([Kd_range,Kd]);

            TTf(4)=TRIM(ins.py,ins.y,INT.dtrim,0.1,1,Kp,Ki,Kd);
             if usb(1)^2+usb(2)^2<sqrt(25)
                if usbl(1)~=7
                    usbl(1)=7;
                    usbl(2)=10;
                else break
                end   
             end
%               elseif flag==4
%               if (usb(1)<=0)&&(usb(2)<=0)
%                 
%             an=atan(usb(2)/usb(1))-pi;
%             elseif (usb(1)<=0)&&(usb(2)>=0)
%                 an=atan(usb(2)/usb(1))+pi;
%             else an=atan(usb(2)/usb(1));
%               end
%             INT.dtrim=INT.dtrim+0.1-ins.y;
%             INT.angel=INT.angel+an;
%             TTf(1)=-X.u_u*0.8*0.8;
%             TTf(5)=Direct(pan,an,INT.angel,1);
%             TTf(4)=TRIM(ins.py,ins.y,INT.dtrim,0.1,1);
%              if usb(1)^2+usb(2)^2<sqrt(25)
%                 if usbl~=10
%                     usbl(1)=10;
%                     usbl(2)=10;
%                 else break
%                 end   
%              end
%               elseif flag==5
%               if (usb(1)<=0)&&(usb(2)<=0)
%                 
%             an=atan(usb(2)/usb(1))-pi;
%             elseif (usb(1)<=0)&&(usb(2)>=0)
%                 an=atan(usb(2)/usb(1))+pi;
%             else an=atan(usb(2)/usb(1));
%               end
%             INT.dtrim=INT.dtrim+0.1-ins.y;
%             INT.angel=INT.angel+an;
%             TTf(1)=-X.u_u*0.8*0.8;
%             TTf(5)=Direct(pan,an,INT.angel,1);
%             TTf(4)=TRIM(ins.py,ins.y,INT.dtrim,0.1,1);
%              if usb(1)^2+usb(2)^2<sqrt(25)
%                 if usbl~=20
%                     usbl(1)=20;
%                     usbl(2)=10;
%                 else flag=5;
%                 end   
%              end
%               elseif flag==6
%               if (usb(1)<=0)&&(usb(2)<=0)
%                 
%             an=atan(usb(2)/usb(1))-pi;
%             elseif (usb(1)<=0)&&(usb(2)>=0)
%                 an=atan(usb(2)/usb(1))+pi;
%             else an=atan(usb(2)/usb(1));
%               end
%             INT.dtrim=INT.dtrim+0.1-ins.y;
%             INT.angel=INT.angel+an;
%             TTf(1)=-X.u_u*0.8*0.8;
%             TTf(5)=Direct(pan,an,INT.angel,1);
%             TTf(4)=TRIM(ins.py,ins.y,INT.dtrim,0.1,1);
%              if usb(1)^2+usb(2)^2<sqrt(25)
%                 if usbl~=10
%                     usbl(1)=10;
%                     usbl(2)=10;
%                 else break
%                 end   
%              end
%         elseif flag==2
%             INT.x=INT.x+usb(1);
%             INT.y=INT.y+usb(2);
%             an=pi/2-ins.z;
%             INT.dtrim=INT.dtrim-ins.y;
%             INT.angel=INT.angel+an;
%             TTf(4)=TRIM(ins.py,ins.y,INT.dtrim,0,0);
%             [TTf(1),TTf(2)]=Control(pusb,usb,0,INT.x,INT.y);
%             if usb(1)^2+usb(2)^2<1
%                 flag=0;
%             end
%             TTf(5)=Direct(pan,an,INT.angel,0);
%         else
%             INT.x=INT.x+usb(1);
%             INT.y=INT.y+usb(2);
%             an=pi/2-ins.z;
%             INT.dtrim=INT.dtrim-ins.y;
%             INT.angel=INT.angel+an;
%             TTf(4)=TRIM(ins.py,ins.y,INT.dtrim,0,0);
%             [TTf(1),TTf(2)]=Control(pusb,usb,1,INT.x,INT.y);
%             
%             TTf(5)=Direct(pan,an,INT.angel,0);
        end
        File=load('nn_pid');
        fismat = readfis('fuzzy_piddepth');
            out_direct = evalfis([depth;pdepth],fismat);

        Kp = out_direct(1); Ki= out_direct(2);Kd= out_direct(3);
        Features=[depth,pdepth];
            [Kp_range,Ki_range ,Kd_range]=neural_network_classification(Features) ;
                       Kp=mean([Kp_range,Kp]);
            Ki=mean([Ki_range,Ki]);
            Kd=mean([Kd_range,Kd]);

        TTf(3)=Deep(pdepth,depth,INT.dd,usbl(3),Kp,Ki,Kd);
        
%         if isnan(TTf(4))
%             break;
%         end

     
    end
    %TTf = Control(E, usbl, EV, vel, usb, T ,ii);
    
    %  
    vel=velf;
%     k1 = vel+AUV(vel,TT)*T;
%     k2 = AUV(k1,TTf);
%     velf = vel+T*k2;
    k1 = AUV(vel,TTf);
    k2 = AUV(vel+0.5.*T.*k1,(TT+TTf)./2);
    k3 = AUV(vel+0.5.*T.*k2,(TT+TTf)./2);
    k4 = AUV(vel+T.*k3,TTf);
    velf = vel+T/6*(k1+2*k2+2*k3+k4);
    
    %J=J'%J^-1==J'
    J=[cos(velf(9))*cos(velf(8)),-sin(velf(9))*cos(velf(7))+cos(velf(9))*sin(velf(8))*sin(velf(7)),sin(velf(9))*sin(velf(7))+cos(velf(9))*sin(velf(8))*cos(velf(7));
        sin(velf(9))*cos(velf(8)),cos(velf(9))*cos(velf(7))+sin(velf(9))*sin(velf(8))*sin(velf(7)), -cos(velf(9))*sin(velf(7))+sin(velf(9))*sin(velf(8))*cos(velf(7));
        -sin(velf(8)),            cos(velf(8))*sin(velf(7)),                                        cos(velf(8))*cos(velf(7))                                        ];
    EVf = double((J*[velf(1),velf(2),velf(3)]')') ;
    
    E = E+EVf*T;
    %    if E(3)<0
    %        E(3)=0;
    %    end
    %    if abs(E(1))>1000
    %        break;
    %    end
    %    if abs(E(2))>1000
    %        break;
    %    end
    %    if abs(E(3))>1000
    %        break;
    %    end
    
    
    
%     if E(3)<0
%         E(3)=0;
%         velf(3)=0;
%         break;
%     end



    EE(ii,:)=E;
    
    buf1(ii,1)=velf(1);
    buf2(ii,1)=velf(2);
    buf3(ii,1)=velf(3);
    buf4(ii,1)=velf(4);
    buf5(ii,1)=velf(5);
    buf6(ii,1)=velf(6);
    buf7(ii,1)=velf(7);
    buf8(ii,1)=velf(8);
    buf9(ii,1)=velf(9);
    buf10(ii,1)=TTf(1);
    buf11(ii,1)=TTf(2);
    buf12(ii,1)=TTf(3);
    buf13(ii,1)=TTf(4);
    buf14(ii,1)=TTf(5);
    
    buf15(ii,1)=ins.p;
    buf16(ii,1)=ins.q;
    buf17(ii,1)=ins.r;
    buf18(ii,1)=ins.u_a;
    buf19(ii,1)=ins.v_a;
    buf20(ii,1)=ins.w_a;
    buf21(ii,1)=ins.x;
    buf22(ii,1)=ins.y;
    buf23(ii,1)=ins.z;
    buf24(ii,1)=depth;
    buf25(ii,1)=doppler.u;
    buf26(ii,1)=doppler.v;
    buf27(ii,1)=doppler.w;
    if flag==0
        buf28(ii,1)=sqrt(usb(1)^2+usb(2)^2);
    else
        buf28(ii,1)=0;
    end
end
%k1(5)
%velf(5)
E
iii=1:ii-1;
figure(1);
subplot(311);
plot(iii,buf1(iii),'-');
title('u');
subplot(312);
plot(iii,buf2(iii),'-');
title('v');
subplot(313);
plot(iii,buf3(iii),'-');
title('w');

figure(2);
subplot(311);
plot(iii,buf4(iii),'-');
title('p');
subplot(312);
plot(iii,buf5(iii),'-');
title('q');
subplot(313);
plot(iii,buf6(iii),'-');
title('r');

figure(3);
subplot(311);
plot(iii,buf7(iii),'-');
title('heel');
subplot(312);
plot(iii,buf8(iii),'-');
title('trim');
subplot(313);
plot(iii,buf9(iii),'-');
title('head');

figure(4);
subplot(3,1,1);
plot(iii,buf10(iii),'-');
title('Tx');
subplot(3,2,3);
plot(iii,buf11(iii),'-');
title('Ty');
subplot(3,2,4);
plot(iii,buf12(iii),'-');
title('Tz');
subplot(3,2,6);
plot(iii,buf13(iii),'-');
title('My');
subplot(3,2,5);
plot(iii,buf14(iii),'-');
title('Mz');
figure(5);

plot3(EE(iii,1),EE(iii,2),EE(iii,3),'-');
title('PID AUV Track');
grid on;
set(gca,'zdir','reverse');
hold on;
A=[0 10 0 10 20 30 20 7];
B=[0 10 20 30 30 20 10 10];
C=[10 20 20 20 20 20 20 20];
plot3(A,B,C,'r');
legend('actual','expected');%Actual ',' Expected
hold off;

figure(6);
subplot(311);
plot(iii,buf15(iii),'-');
title('   Roll angular velocity');
subplot(312);
plot(iii,buf16(iii),'-');
title('    Pitch angular velocity');
subplot(313);
plot(iii,buf17(iii),'-');
title('    Heading speed');

figure(7);
subplot(311);
plot(iii,buf18(iii),'-');
title('x   Axis acceleration');
subplot(312);
plot(iii,buf19(iii),'-');
title('y  Axis acceleration');
subplot(313);
plot(iii,buf20(iii),'-');
title('z  Axis acceleration');

figure(8);
subplot(311);
plot(iii,buf18(iii),'-');
title('x  Axis acceleration');
subplot(312);
plot(iii,buf19(iii),'-');
title('y  Axis acceleration');
subplot(313);
plot(iii,buf20(iii),'-');
title('z  Axis acceleration');

figure(9);
subplot(311);
plot(iii,buf21(iii),'-');
title('  Roll angle');
subplot(312);
plot(iii,buf22(iii),'-');
title(' Trim angle');
subplot(313);
plot(iii,buf23(iii),'-');
title('  Route angle');

figure(10);
plot(iii,buf24(iii),'-');
title(' Depth gauge');

figure(11);
subplot(311);
plot(iii,buf25(iii),'-');
title('x Shaft speed');
subplot(312);
plot(iii,buf26(iii),'-');
title('y Shaft speed');
subplot(313);
plot(iii,buf27(iii),'-');
title('z Shaft speed');

results =[buf1(iii),buf2(iii),buf3(iii),buf4(iii),buf5(iii),buf6(iii),buf7(iii),buf8(iii),buf9(iii),buf10(iii),buf11(iii),buf12(iii),buf13(iii),buf14(iii),buf15(iii),buf16(iii),buf17(iii),buf18(iii),buf19(iii),buf20(iii),buf21(iii),buf22(iii),buf23(iii),buf24(iii),buf25(iii),buf26(iii),buf27(iii)];

% figure(12);
% title('  Power positioning error');
% plot(iii,buf28(iii),'-');

