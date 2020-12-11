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


#Here W1 > W0 and g1 > g0. Welfare under mediator is never positive. 
T = 7
W = 8
D = 5
p = .5
dl = .25
dh = .6


## Here, W0 > W1 > We (mediator). Mediator optimally chooses e=0 anyway
T = 7
W = 8
D = 5
p = .3
dl = .4
dh = .9

## Here, W0 > W1 > We (mediator). Mediator optimally chooses e=0.03
T = 6
W = 8
D = 5
p = .5
dl = .2
dh = .9

## To do: Find parameters that make e=1 possible, test against mediator

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
condition = data.frame((p - e*(p + T - dl*T +W)))
eg = e*g #effective gift
We = 1/(1-dh)*(p*T*(1+e*g) + (1-p)*(W-D)) - g
We_max = We[min(which(g<=0)) - 1,1]
g_max = g[min(which(g<=0)) - 1,1]
ge_max = eg[min(which(g<=0)) - 1,1]
