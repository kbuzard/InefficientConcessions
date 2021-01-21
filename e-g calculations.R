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
dh = .7
## Note: reducing dl from 0.3 to 0.4 makes the mediator even more attractive


#P3: W1 > W0 and g1 > g0. Welfare under mediator is never positive (asymptotes to -infty) 
T = 7
W = 8
D = 5
p = .5
dl = .25
dh = .7


## P4: W0 > W1 > We (mediator). Mediator optimally chooses e=0 anyway (asymptotes to -infty)
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

## P6: make mediator better than e=0: We > W1 > W0. All gifts are positive
T = 1
W = 1
D = 1
p = .5
dl = .5
dh = 15/16

## P7: Parameters that make e=1 possible, but mediator still better
T = .5
W = 1
D = 1
p = .5
dl = .5
dh = 61/64

## P8: Looking for parameters that make dh_min1 < dh_min0
T = 1
W = 1
D = 1
p = .5
dl = .5
dh = ?61/64

# grim trigger cutoff
dh_min_nc = W/((1-p)*W+p*(T+D)) 
# WM asymptotes to +infty when the following is positive (sufficient condition)
# suff = e*p*T - 1 + dh
# problem is that we need the asymptote for e (I think)
e_s = p/(p + T - T*dl +W)
suff = e_s*p*T - 1 + dh

# e=1
g1 = (p*(1-dl)*(D+T))/((1-dl)*(1-p*T)+(1-p)*D) # must be positive
W1 = 1/(1-dh)*(p*T*(1+g1) + (1-p)*(W-D*(1+g1))) - (1-p)*g1
# e = 1 incentive compatible? Minimum dh for separation is
#D*(1-p) + 1 - p*T + (p*(W - T -D))/g1 #This was Ben's calculation, wrong (I think)
dh_min1 = (p*(W - T -D))/g1 + p*(W-T) + (1-p)*D + 1
rm(dh_min1) #get rid of this after checking that it is lower than dh

# e=0
g0 = p*(T+D)
W0 = 1/(1-dh)*(p*T + (1-p)*(W-D)) - (1-p)*g0
dh_min0 = W/(T+D)
rm(dh_min0)

# 0 < e < 1 with mediator
e = seq(0, 1, 0.01)
g = data.frame((1-dl)*(T+D)/(p - e*(p + T - dl*T +W)))
#condition = data.frame((p - e*(p + T - dl*T +W)))
eg = e*g #effective gift
We = 1/(1-dh)*(p*T*(1+e*g) + (1-p)*(W-D)) - g
We_max = max(We[which(g[is.finite(g$X.1...dl.....T...D...p...e....p...T...dl...T...W..),1]>=0),1])
e_max = which.max(We[which(g>=0),1])
g_max = g[e_max,1]
eg_max = eg[e_max,1]

# condition for mediator to be better than e = 1
WM1 = 1/(1-dh)*g_max*p*T*e[min(which(g<=0))] - g_max - 1/(1-dh)*g1*(p*T + p*D - D) - (1-p)g1
test = We_max - W1
