base = fscanfMat("aerogerador.dat")

x = base(:,1) //velocidade do vento em m/s
y = base(:,2) //potência gerada em kWatts

plot(x, y, "*")
xlabel("velocidade do vento (m/s)", "fontsize", 2)
ylabel("potência gerada (kWatts)", "fontsize", 2)

n = length(x)

X = [ones(n,1) x x.^2 x.^3 x.^4 x.^5 x.^6 x.^7]

beta = (X'*X)^(-1)*X'*y

y_prev = beta(1) + beta(2)*x + beta(3)*x.^2 + beta(4)*x.^3 + beta(5)*x.^4 + beta(6)*x.^5 + beta(7)*x.^6 + beta(8)*x.^7

SQE=sum((y-y_prev).^2)
Syy=sum((y-mean(y)).^2)

R2 = 1 - SQE/Syy

p=length(beta)

Raj2 = 1-SQE*(n-1)/(Syy*(n-p))
plot(x, y_prev, "k-")



