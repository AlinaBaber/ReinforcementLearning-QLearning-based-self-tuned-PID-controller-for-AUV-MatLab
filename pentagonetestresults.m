Mfile = load('pendagon.mat');

figure(5);
plot3(Mfile.pidresults(Mfile.iii,1),Mfile.pidresults(Mfile.iii,2),Mfile.pidresults(Mfile.iii,3),'-');
title('AUV Track');
grid on;
set(gca,'zdir','reverse');
hold on;
plot3(Mfile.ffresults(Mfile.iii,1),Mfile.ffresults(Mfile.iii,2),Mfile.ffresults(Mfile.iii,3),'g');
hold on;
plot3(Mfile.nnresults(Mfile.iii,1),Mfile.nnresults(Mfile.iii,2),Mfile.nnresults(Mfile.iii,3),'m');
hold on;
plot3(Mfile.nfresults(Mfile.iii,1),Mfile.nfresults(Mfile.iii,2),Mfile.nfresults(Mfile.iii,3),'c');
hold on;
plot3(Mfile.QLresults(Mfile.ii,1),Mfile.QLresults(Mfile.ii,2),Mfile.QLresults(Mfile.ii,3),'k');
hold on;
A=[0 10 0 2 15 20 7];
B=[0 10 20 36 38 20 10];
C=[10 20 20 20 20 20 20];
plot3(A,B,C,'r');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning','expected');
hold off;

