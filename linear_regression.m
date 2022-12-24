function [m b] = linear_regression(X, Y)
    n = length(Y);
    EX = sum(X);
    EY = sum(Y);
    EX2 = sum(X.*X);
    EXY = sum(X.*Y);
    m = (n*EXY - EX*EY) / (n*EX2 - EX*EX);
    b = (EY - m*EX) / n;
end