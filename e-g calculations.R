#Parameterization from Theorem 3 in the paper
T = 10
W = 8
D = 5
p = .2
dl = .3
dh = .6

e = seq(0, 1, 0.01)
g = data.frame((1-dl)*(T+D)/(p - e*(p + T - dl*T +W)))
condition = data.frame((p - e*(p + T - dl*T +W)))
eg = e*g #effective gift

# Welfare calculations 
# e=0
g0 = p*(T+D)
W0 = 1/(1-dh)*(p*T + (1-p)*(W-D)) - g0
# e=1
g1 = (p*(1-dl)*(D+T))/((1-dl)*(1-p*T)+(1-p)*D)
W1 = 1/(1-dh)*(p*T*(1+g1) + (1-p)*(W-D*(1+g1))) - g1
# 0 < e < 1 with mediator
We = 1/(1-dh)*(p*T*(1+e*g) + (1-p)*(W-D)) - g

g1denom = (1-dl)*(1-p*T)+(1-p)*D #checks to see if denominator is positive
    