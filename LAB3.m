clc
clear all
close all

x = [0:1/22:1];
y = 1 + 0.6*sin(2*pi*x/0.7) + 0.3*sin(2*pi*x)./2;
figure(); plot(x,y,'b'), grid on

c1 = 0.19;
r1 = 0.203;
F1 = exp(-(x-c1).^2/(2*r1^2));

c2 = 0.88;
r2 = 0.206;
F2 = exp(-(x-c2).^2/(2*r2^2));

w1 = randn(1);
w2 = randn(1);
b = randn(1);
n = 0.01;

iterations = 100000;
disp("Pradedamas apmokymas, pradiniai rezultatai: b = "+b+", w1 = "+w1+", w2 = "+w2);

for j = 1:iterations
    for i = 1:length(x)
        v = F1(i)*w1+F2(i)*w2+b;
        e = y(i) - v;
        w1 = w1 + n*e*F1(i);
        w2 = w2 + n*e*F2(i);
        b = b + n*e;
    end
end

disp("Apmokymas baigtas po "+iterations+" iteracijų, gauti rezultatai: b = "+b+", w1 = "+w1+", w2 = "+w2);

y = F1*w1+F2*w2+b;
hold on; plot(x,y,'g'), grid on;