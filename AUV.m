function [ Va ] = AUV( xx, T)
global m;
global B;
global W;
global xg;
global yg;
global zg;
global xb;
global yb;
global zb;
global I;
global DD;
global DDD;
global X;
global Y;
global Z;
global K;
global M;
global N;
global Sv;
%%%%%%%%%%主推系数%%%%%%%%%%
% prop.X=0;
% prop.Y=0;
% prop.Z=0;
% prop.M=0;
% prop.N=0;
%%%%%%%%%%%%%%推力%%%%%%%%%%%%%%
Tx=T(1);
Ty=T(2);
Tz=T(3);
Tm=T(4);
Tn=T(5);
% T1=T(1);
% T2=T(2);
% T3=T(3);
% T4=T(4);
% T5=T(5);
%T_n=T(6);

%%%%%%%%%%%%%%速度%%%%%%%%%%%%%%
u=xx(1);
v=xx(2);
w=xx(3);
%%%%%%%%%%%%%%角速度%%%%%%%%%%%%%%
p=xx(4);
q=xx(5);
r=xx(6);
%%%%%%%%%%%%%%欧拉角%%%%%%%%%%%%%%
heel=xx(7);
trim=xx(8);
head=xx(9);
% %%%%%%%%%%%%%%位置%%%%%%%%%%%%%%
% EX=E(1);
% EY=E(2);
% EZ=E(3);
%%%%%%%%%%%%%%低速恒定海流%%%%%%%%%%%%%%

% J=[cos(head)*cos(trim),                              sin(head)*cos(trim),                              -sin(trim);
%    cos(head)*sin(trim)*sin(heel)-sin(head)*cos(heel),sin(head)*sin(trim)*sin(heel)+cos(head)*cos(heel),cos(trim)*sin(heel);
%    cos(head)*sin(trim)*cos(heel)+sin(head)*sin(heel),sin(head)*sin(trim)*cos(heel)-cos(head)*sin(heel),cos(trim)*cos(heel)]; 
% vvv = xx(1:3)'-J*Sv';
% vu = vvv(1,1);
% vv = vvv(2,1);
% vw = vvv(3,1);
vu = u - (cos(head)*cos(trim)*Sv.x+sin(head)*cos(trim)*Sv.y);
vv = v - ((cos(head)*sin(trim)*sin(heel)-sin(head)*cos(heel))*Sv.x+(sin(head)*sin(trim)*sin(heel)+cos(head)*cos(heel))*Sv.y);
vw = w - ((cos(head)*sin(trim)*cos(heel)+sin(head)*sin(heel))*Sv.x+(sin(head)*sin(trim)*cos(heel)-cos(head)*sin(heel))*Sv.y);
% vu = u-( cos(head)*sin(trim)*sin(heel)-sin(head)*cos(heel) )*Sv.y;
% vv = v-( sin(head)*sin(trim)*sin(heel)+cos(head)*cos(heel) )*Sv.y;
% vw = w-( cos(trim)*sin(heel) )*Sv.y;
% vu=u;
% vv=v;
% vw=w;

% FXX = double((-(W-B)*sin(trim) + X.u_u*vu*abs(vu)-m*w*q+X.wq*vw*q+(X.qq+m*xg)*q^2+m*v*r+X.vr*vv*r+(X.rr+m*xg)*r^2-m*yg*p*q-m*zg*p*r  ));
% FYY = double(((W-B)*cos(trim)*sin(heel) + Y.v_v*vv*abs(vv)+Y.r_r*r*abs(r)+m*yg*r^2-m*u*r+Y.ur*vu*r+m*w*p+Y.wp*vw*p+(Y.pq-m*xg)*p*q+Y.uv*vu*vv+m*yg*p^2+m*zg*q*r  ));
% FZZ = double(((W-B)*cos(trim)*cos(heel) + Z.w_w*vw*abs(vw)+Z.q_q*q*abs(q)+m*u*q+Z.uq*vu*q-m*v*p+Z.vp*vv*p+(Z.rp-m*xg)*r*p+Z.uw*vu*vw+m*zg*(p^2+q^2)-m*yg*r*q  ));
% FKK = double((-(yg*W-yb*B)*cos(trim)*cos(heel)-(zg*W-zb*B)*cos(trim)*sin(heel) + K.p_p*p*abs(p)-(I.zz-I.yy)*q*r+m*yg*(u*q-v*p)-m*zg*(w*p-u*r)  ));
% FMM = double((-(zg*W-zb*B)*sin(trim)-(xg*W-xb*B)*cos(trim)*cos(heel) + M.w_w*vw*abs(vw)+M.q_q*q*abs(q)-m*xg*u*q+M.uq*vu*q+m*xg*v*p+M.vp*vv*p+(M.rp-(I.xx-I.zz))*r*p+m*zg*(v*r-w*q)+M.uw*vu*vw  ));
% FNN = double((-(xg*W-xb*B)*cos(trim)*sin(heel)-(yg*W-yb*B)*sin(trim) + N.v_v*vv*abs(vv)+N.r_r*r*abs(r)-m*xg*u*r+N.ur*vu*r+m*xg*w*p+N.wp*vw*p+(N.pq-(I.yy-I.xx))*p*q-m*yg*(v*r-w*q)+N.uv*vu*vv ));


FXX = double((-(W-B)*sin(trim) + X.u_u*vu*abs(vu)-m*w*q+X.wq*vw*q+(X.qq+m*xg)*q^2+m*v*r+X.vr*vv*r+(X.rr+m*xg)*r^2-m*yg*p*q-m*zg*p*r  ));
FYY = double(((W-B)*cos(trim)*sin(heel) + Y.v_v*vv*abs(vv)+Y.r_r*r*abs(r)+m*yg*r^2-m*u*r+Y.ur*vu*r+m*w*p+Y.wp*vw*p+(Y.pq-m*xg)*p*q+Y.uv*vu*vv+m*yg*p^2+m*zg*q*r  ));
FZZ = double(((W-B)*cos(trim)*cos(heel) + Z.w_w*vw*abs(vw)+Z.q_q*q*abs(q)+m*u*q+Z.uq*vu*q-m*v*p+Z.vp*vv*p+(Z.rp-m*xg)*r*p+Z.uw*vu*vw+m*zg*(p^2+q^2)-m*yg*r*q  ));
FKK = double((-(yg*W-yb*B)*cos(trim)*cos(heel)-(zg*W-zb*B)*cos(trim)*sin(heel) + K.p_p*p*abs(p)-(I.zz-I.yy)*q*r+m*yg*(u*q-v*p)-m*zg*(w*p-u*r)  ));
FMM = double((-(zg*W-zb*B)*sin(trim)-(xg*W-xb*B)*cos(trim)*cos(heel) + M.w_w*vw*abs(vw)+M.q_q*q*abs(q)-m*xg*u*q+M.uq*vu*q+m*xg*v*p+M.vp*vv*p+(M.rp-(I.xx-I.zz))*r*p+m*zg*(v*r-w*q)+M.uw*vu*vw  ));
FNN = double((-(xg*W-xb*B)*cos(trim)*sin(heel)-(yg*W-yb*B)*sin(trim) + N.v_v*vv*abs(vv)+N.r_r*r*abs(r)-m*xg*u*r+N.ur*vu*r+m*xg*w*p+N.wp*vw*p+(N.pq-(I.yy-I.xx))*p*q-m*yg*(v*r-w*q)+N.uv*vu*vv ));
% FMM=0;%由于解算精度导致速度不能为0
% FNN=0;
% FKK=0;
% FXX=0;
% FYY=0;
% FZZ=0;
%%最小精度0.001m/s,0.001rad

if (abs(u)<0.001 && abs(FXX/DDD(1,1))<0.001)
    FXX=-DDD(1,1)*u;
elseif (u~=0 && abs(FXX/DDD(1,1))<0.001)
    FXX=-DDD(1,1)*0.001;
end
if (abs(v)<0.001 && abs(FYY/DDD(2,2))<0.001)
    FYY=-DDD(2,2)*v;
elseif (v~=0 && abs(FYY/DDD(2,2))<0.001)
    FYY=-DDD(2,2)*0.001;
end
if (abs(w)<0.001 && abs(FZZ/DDD(3,3))<0.001)
    FZZ=-DDD(3,3)*w;
elseif (w~=0 && abs(FZZ/DDD(3,3))<0.001)
    FZZ=-DDD(3,3)*0.001;
end
if (abs(p)<0.001 && abs(FKK/DDD(4,4))<0.001)
    FKK=-DDD(4,4)*p;
elseif (p~=0 && abs(FKK/DDD(4,4))<0.001)
    FKK=-DDD(4,4)*0.001;
end
if (abs(q)<0.001 && abs(FMM/DDD(5,5))<0.001)
    FMM=-DDD(5,5)*q;
elseif (q~=0 && abs(FMM/DDD(5,5))<0.001)
    FMM=-DDD(5,5)*0.001;
end
if (abs(r)<0.001 && abs(FNN/DDD(6,6))<0.001)
    FNN=-DDD(6,6)*r;
elseif (r~=0 && abs(FNN/DDD(6,6))<0.001)
    FNN=-DDD(6,6)*0.001;
end
XX=FXX+Tx;
YY=FYY+Ty;
ZZ=FZZ+Tz;
KK=FKK;
MM=FMM+Tm;
NN=FNN+Tn;
% [XX YY ZZ KK MM NN]

% X = -(W-B)*sin(trim) + Xu_u*vu*abs(vu)-m*w*q+Xwq*vw*q+(Xqq+m*xg)*q^2+m*v*r+Xvr*vv*r+(Xrr+m*xg)*r^2-m*yg*p*q-m*zg*p*r + T1 ;
% Y = (W-B)*cos(trim)*sin(heel) + Yv_v*vv*abs(vv)+Yr_r*r*abs(r)+m*yg*r^2-m*u*r+Yur*vu*r+m*w*p+Ywp*vw*p+(Ypq-m*xg)*p*q+Yuv*vu*vv+m*yg*p^2+m*zg*q*r + T2+T3 ;
% Z = (W-B)*cos(trim)*cos(heel) + Zw_w*vw*abs(vw)+Zq_q*q*abs(q)+m*u*q+Zuq*vu*q-m*v*p+Zvp*vv*p+(Zrp-m*xg)*r*g+Zuw*vu*vw+m*zg*(p^2+q^2)-m*yg*r*q + T4+T5 ;
% K = -(yg*W-yb*B)*cos(trim)*cos(heel)-(zg*W-zb*B)*cos(trim)*sin(heel) + Kp_p*p*abs(p)-(Izz-Iyy)*q*r+m*(u*q-v*p)-m*zg*(w*p-u*r)  ;
% M = -(zg*W-zb*B)*sin(trim)-(xg*W-xb*B)*cos(trim)*cos(heel) + Mw_w*vw*abs(vw)+Mq_q*q*abs(q)-m*xg*u*q+Muq*vu*q+m*xg*v*p+Mvp*vv*p+(Mrp-(Ixx-Izz))*r*p+m*zg*(v*r-w*q)+Muw*vu*vw + (T4+T5)*d1 ;
% N = -(xg*W-xb*B)*cos(trim)*sin(heel)--(yg*W-yb*B)*sin(trim) + Nv_v*vv*abs(vv)+Nr_r*r*abs(r)-m*xg*u*r+Nur*vu*r+m*xg*w*p+Nwp*vw*p+(Npq-(Iyy-Ixx))*p*q-m*yg*(v*r-w*q)+Nuv*vu*vv + (T2+T3)*d2 ;

% X = -(W-B)*sin(trim) + Xu_u*vu*abs(vu)-m*w*q+Xwq*vw*q+(Xqq+m*xg)*q^2+m*v*r+Xvr*vv*r+(Xrr+m*xg)*r^2-m*yg*p*q-m*zg*p*r + T1 ;
% Y = (W-B)*cos(trim)*sin(heel) + Yv_v*vv*abs(vv)+Yr_r*r*abs(r)+m*yg*r^2-m*u*r+Yur*vu*r+m*w*p+Ywp*vw*p+(Ypq-m*xg)*p*q+Yuv*vu*vv+m*yg*p^2+m*zg*q*r + T2+T3 ;
% Z = (W-B)*cos(trim)*cos(heel) + Zw_w*vw*abs(vw)+Zq_q*q*abs(q)+m*u*q+Zuq*vu*q-m*v*p+Zvp*vv*p+(Zrp-m*xg)*r*g+Zuw*vu*vw+m*zg*(p^2+q^2)-m*yg*r*q + T4+T5 ;
% K = -(yg*W-yb*B)*cos(trim)*cos(heel)-(zg*W-zb*B)*cos(trim)*sin(heel) + Kp_p*p*abs(p)-(Izz-Iyy)*q*r+m*(u*q-v*p)-m*zg*(w*p-u*r)  ;
% M = -(zg*W-zb*B)*sin(trim)-(xg*W-xb*B)*cos(trim)*cos(heel) + Mw_w*vw*abs(vw)+Mq_q*q*abs(q)-m*xg*u*q+Muq*vu*q+m*xg*v*p+Mvp*vv*p+(Mrp-(Ixx-Izz))*r*p+m*zg*(v*r-w*q)+Muw*vu*vw + (T4+T5)*d1 ;
% N = -(xg*W-xb*B)*cos(trim)*sin(heel)--(yg*W-yb*B)*sin(trim) + Nv_v*vv*abs(vv)+Nr_r*r*abs(r)-m*xg*u*r+Nur*vu*r+m*xg*w*p+Nwp*vw*p+(Npq-(Iyy-Ixx))*p*q-m*yg*(v*r-w*q)+Nuv*vu*vv + (T2+T3)*d1 ;
% X = -(W-B)*sin(trim) + Xu_u*u*abs(u)+(Xwq-m)*w*q+(Xqq+m*xg)*q^2+(Xvr+m)*v*r+(Xrr+m*xg)*r^2-m*yg*p*q-m*zg*p*r + T1 ;
% Y = (W-B)*cos(trim)*sin(heel) + Yv_v*v*abs(v)+Yr_r*r*abs(r)+m*yg*r^2+(Yur-m)*u*r+(Ywp+m)*w*p+(Ypq-m*xg)*p*q+Yuv*u*v+m*yg*p^2+m*zg*q*r + T2+T3 ;
% Z = (W-B)*cos(trim)*cos(heel) + Zw_w*w*abs(w)+Zq_q*q*abs(q)+(Zuq+m)*u*q+(Zvp-m)*v*p+(Zrp-m*xg)*r*g+Zuw*u*w+m*zg*(p^2+q^2)-m*yg*r*q + T4+T5 ;
% K = -(yg*W-yb*B)*cos(trim)*cos(heel)-(zg*W-zb*B)*cos(trim)*sin(heel) + Kp_p*p*abs(p)-(Izz-Iyy)*q*r+m*(u*q-v*p)-m*zg*(w*p-u*r)  ;
% M = -(zg*W-zb*B)*sin(trim)-(xg*W-xb*B)*cos(trim)*cos(heel) + Mw_w*w*abs(w)+Mq_q*q*abs(q)+(Muq-m*xg)*u*q+(Mvp+m*xg)*v*p+(Mrp-(Ixx-Izz))*r*p+m*zg*(v*r-w*q)+Muw*u*w + (T4+T5)*d1 ;
% N = -(xg*W-xb*B)*cos(trim)*sin(heel)--(yg*W-yb*B)*sin(trim) + Nv_v*v*abs(v)+Nr_r*r*abs(r)+(Nur-m*xg)*u*r+(Nwp+m*xg)*w*p+(Npq-(Iyy-Ixx))*p*q-m*yg*(v*r-w*q)+Nuv*u*v + (T2+T3)*d1 ;

FM=double((DD*([XX YY ZZ KK MM NN]'))');
%FM
Va = double([FM,p+sin(heel)*tan(trim)*q+cos(heel)*tan(trim)*r,cos(heel)*q-sin(heel)*r,sin(heel)/cos(trim)*q+cos(heel)/cos(trim)*r]);
end

