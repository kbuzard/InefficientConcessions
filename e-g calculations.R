#Parameterization from Theorem 3 in the paper
T = 10
W = 8
D = 5
p = .2
dl = .3
dh = .6

#Let's find an alternate where W1 > W0
T = 7
W = 8
D = 5
p = .5
dl = .25
dh = .6
# This works to make both the gift and welfare higher under e=1.
# But welfare under mediator is never even positive (for non-negative gift)

#Let's forget about where e=1 is possible; then mediator isn't as important
#I think this works, but need to check it b/c "We" is weird!
T = 7
W = 8
D = 5
p = .9
dl = .3
dh = .6

e = seq(0, 1, 0.01)
g = data.frame((1-dl)*(T+D)/(p - e*(p + T - dl*T +W)))
condition = data.frame((p - e*(p + T - dl*T +W)))
eg = e*g #effective gift

# Welfare calculations 
# 0 < e < 1 with mediator
We = 1/(1-dh)*(p*T*(1+e*g) + (1-p)*(W-D)) - g
# e=0
g0 = p*(T+D)
W0 = 1/(1-dh)*(p*T + (1-p)*(W-D)) - g0
# e=1
g1 = (p*(1-dl)*(D+T))/((1-dl)*(1-p*T)+(1-p)*D)
W1 = 1/(1-dh)*(p*T*(1+g1) + (1-p)*(W-D*(1+g1))) - g1

#If g1 is negative, this is an UPPER BOUND
d_h1 = D*(1-p)+1-p*T + (p*(W-(T+D)))/g1  #Minimum delta_h for separation





