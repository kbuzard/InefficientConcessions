#Parameterization from Theorem 3 in the paper
T = 10
W = 8
D = 5
p = .2
dl = .3
dh = .6

#P2 in notes: e=1 not possible (negative gift)
#This makes welfare highest under mediator, 2nd under e=0, e=1 not possible
T = 7
W = 8
D = 5
p = .9
dl = .3
dh = .6
## Note: reducing dl from 0.3 to 0.4 makes the mediator even more attractive


#P3: W1 > W0 and g1 > g0. Welfare under mediator is never positive. 
T = 7
W = 8
D = 5
p = .5
dl = .25
dh = .6


## P4: W0 > W1 > We (mediator). Mediator optimally chooses e=0 anyway
T = 7
W = 8
D = 5
p = .3
dl = .4
dh = .9

## P5: Here, W1 > W0 > We (mediator). Mediator optimally chooses e=0.03
T = 6
W = 8
D = 5
p = .5
dl = .2
dh = .9

## To do: Find parameters that make e=1 possible, test against mediator
T = 6
W = 8
D = 5
p = .4
dl = .5
dh = .8

# e=1
g1 = (p*(1-dl)*(D+T))/((1-dl)*(1-p*T)+(1-p)*D)
W1 = 1/(1-dh)*(p*T*(1+g1) + (1-p)*(W-D*(1+g1))) - g1
# e = 1 incentive compatible? Minimum dh for separation is
dh_min = D*(1-p) + 1 - p*T + (p*(W - T -D))/g1 #If g1<0, this is UPPER BOUND

# e=0
g0 = p*(T+D)
W0 = 1/(1-dh)*(p*T + (1-p)*(W-D)) - g0

# 0 < e < 1 with mediator
e = seq(0, 1, 0.01)
g = data.frame((1-dl)*(T+D)/(p - e*(p + T - dl*T +W)))
#condition = data.frame((p - e*(p + T - dl*T +W)))
#eg = e*g #effective gift
We = 1/(1-dh)*(p*T*(1+e*g) + (1-p)*(W-D)) - g
We_max = max(We[which(g>=0),1])
g_max = g[which.max(We[which(g>=0),1]),1]
#eg_max = eg[which.max(We[which(g>=0),1]),1]

# condition for mediator to be better than e = 1
WM1 = 1/(1-dh)*g_max*p*T*e[min(which(g<=0))] - g_max - 1/(1-dh)*g1*(p*T + p*D - D) - g1
test = We_max - W1
