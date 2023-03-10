Mfile = load('resultsd.mat');
figure(1);
subplot(311);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,1),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,1),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,1),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,1),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,1),'k');
title('u');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off;
subplot(312);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,2),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,2),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,2),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,2),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,2),'k');
hold off;
title('v');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
subplot(313);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,3),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,3),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,3),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,3),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,3),'k');
title('w');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off;

figure(2);
subplot(311);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,4),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,4),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,4),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,4),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,4),'k');
title('p');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off;
subplot(312);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,5),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,5),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,5),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,5),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,5),'k');
title('q');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off;
subplot(313);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,6),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,6),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,6),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,6),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,6),'k');
title('r');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off;

figure(3);
subplot(311);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,7),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,7),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,7),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,7),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,7),'k');
title('heel');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off;
subplot(312);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,8),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,8),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,8),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,8),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,8),'k');
title('TRIM1');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off;
subplot(313);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,9),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,9),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,9),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,9),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,9),'k');
title('head');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off;

figure(4);
subplot(3,1,1);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,10),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,10),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,10),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,10),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,10),'k');
title('Tx');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off;
subplot(3,2,3);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,11),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,11),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,11),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,11),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,11),'k');
title('Ty');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off
subplot(3,2,4);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,12),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,12),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,12),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,12),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,12),'k');
title('Tz');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off
subplot(3,2,6);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,13),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,13),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,13),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,13),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,13),'k');
title('My');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off
subplot(3,2,5);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,14),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,14),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,14),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,14),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,14),'k');
title('Mz');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off

figure(5);
plot3(Mfile.PP(Mfile.iii,1),Mfile.PP(Mfile.iii,2),Mfile.PP(Mfile.iii,3),'-');
title('AUV Track');
grid on;
set(gca,'zdir','reverse');
hold on;
plot3(Mfile.FP(Mfile.iii,1),Mfile.FP(Mfile.iii,2),Mfile.FP(Mfile.iii,3),'g');
hold on;
plot3(Mfile.NP(Mfile.iii,1),Mfile.NP(Mfile.iii,2),Mfile.NP(Mfile.iii,3),'m');
hold on;
plot3(Mfile.NF(Mfile.iii,1),Mfile.NF(Mfile.iii,2),Mfile.NF(Mfile.iii,3),'c');
hold on;
plot3(Mfile.QL(Mfile.ii,1),Mfile.QL(Mfile.ii,2),Mfile.QL(Mfile.ii,3),'k');
hold on;
A=[0 10 0 10 20 30 20 7];
B=[0 10 20 30 30 20 10 10];
C=[10 20 20 20 20 20 20 20];
plot3(A,B,C,'r');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning','expected');
hold off;
figure(6);
subplot(311);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,15),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,15),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,15),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,15),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,15),'k');
title('   Roll angular velocity');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off
subplot(312);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,15),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,16),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,16),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,16),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,16),'k');
title('    Pitch angular velocity');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off
subplot(313);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,17),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,17),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,17),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,17),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,17),'k');
title('    Heading speed');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off

figure(7);
subplot(311);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,18),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,18),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,18),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,18),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,18),'k');
title('x   Axis acceleration');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off
subplot(312);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,19),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,19),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,19),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,19),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,19),'k');
title('y  Axis acceleration');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off
subplot(313);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,20),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,20),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,20),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,20),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,20),'k');
title('z  Axis acceleration');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off

figure(8);
subplot(311);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,18),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,18),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,18),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,18),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,18),'k');
title('x   Axis acceleration');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off
subplot(312);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,19),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,19),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,19),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,19),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,19),'k');
title('y  Axis acceleration');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off
subplot(313);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,20),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,20),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,20),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,20),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,20),'k');
title('z  Axis acceleration');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off

figure(9);
subplot(311);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,21),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,21),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,21),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,21),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,21),'k');
title('  Roll angle');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off
subplot(312);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,22),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,22),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,22),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,22),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,22),'k');
title(' TRIM angle');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off
subplot(313);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,23),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,23),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,23),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,23),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,23),'k');
title('  Route angle');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off

figure(10);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,24),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,24),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,24),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,24),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,24),'k');
title(' Depth gauge');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off

figure(11);
subplot(311);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,25),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,25),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,25),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,25),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,25),'k');
title('x Shaft speed');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off
subplot(312);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,26),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,26),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,26),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,26),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,26),'k');
title('y Shaft speed');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off
subplot(313);
plot(Mfile.iii,Mfile.pidresults(Mfile.iii,27),'b');
hold on;
plot(Mfile.iii,Mfile.ffresults(Mfile.iii,27),'g');
hold on;
plot(Mfile.iii,Mfile.nnresults(Mfile.iii,27),'m');
hold on;
plot(Mfile.iii,Mfile.nfresults(Mfile.iii,27),'c');
hold on;
plot(Mfile.iii,Mfile.QLresults(Mfile.iii,27),'k');
title('z Shaft speed');
legend('PID','Fuzzy PID','NN PID','Fuzzy NN PID','RL-Q Learning');
hold off
