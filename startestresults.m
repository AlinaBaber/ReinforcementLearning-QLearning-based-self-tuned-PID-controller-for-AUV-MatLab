Mfile = load('star.mat');

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
A=[0 7 0 9 12 15 20 17 19 11 4 7];
B=[0 13 20 20 34 20 20 14 1 8 0 13];
C=[10 20 20 20 20 20 20 20 20 20 20 20];
plot3(A,B,C,'r');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning','expected');
hold off;

