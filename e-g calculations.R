# These are the parameterizations and calculations for the version of the paper
# submitted to the JCR

# P1: WM > W0, e=1 not possible (Corollary 2, Theorem 6(a))
T = 1
W = 1
D = 1
p = .9
dl = .3
dh = .7

## P2: make mediator better than e=0 or e=1: We > W1 > W0 (Theorem 6(b))
T = 1
W = 1
D = 1
p = .5
dl = .5
dh = 15/16

## P3: Mediator works while e=0 doesn't (Theorem 6(c))
T = 1
W = 1
D = 1
p = 13/16
dl = .25
dh = .49

# no concessions cutoff (only matters when no material value)
# dh_min_nc = W/((1-p)*W+p*(T+D)) 

# asymptote for e
e_s = p/(p + T - T*dl +W)
# WM asymptotes to +infty when this is positive (sufficient condition)
suff = e_s*p*T - 1 + dh
# when e can't reach the asymptote, use this to calculate for another value of e
e =
suff = e*p*T - 1 + dh

# e=1
g1 = (p*(1-dl)*(D+T))/((1-dl)*(1-p*T)+(1-p)*D) # must be positive
W1 = 1/(1-dh)*(p*T*(1+g1) + (1-p)*(W-D*(1+g1))) - (1-p)*g1
# e = 1 incentive compatible? Minimum dh for separation is
dh_min1 = (p*(W - T -D))/g1 + p*(W-T) + (1-p)*D + 1
rm(dh_min1) #get rid of this after checking that it is lower than dh

# e=0
g0 = p*(T+D)
W0 = 1/(1-dh)*(p*T + (1-p)*(W-D)) - (1-p)*g0
# e = 0 incentive compatible? Minimum dh for separation is
dh_min0 = W/(T+D)
rm(dh_min0)

# 0 < e < 1 with mediator
e = seq(0, 1, 0.01)
# set gift to satisfy low type IC with equality (not necessarily optimal)
g = data.frame((1-dl)*(T+D)/(p - e*(p + T - dl*T +W)))
# Does high type IC/IR hold? If this is negative, no additional restriction on g:
HTir = data.frame(T*e - (1-dh)*(1-e))
# If HTir is positive, we need g <= g_HTir 
g_HTir = data.frame((T+D-W)/(T*e - (1-dh)*(1-e))) #see below for when this binds
# High type welfare when gift set so that low type IC binds
We = 1/(1-dh)*(p*T*(1+e*g) + (1-p)*(W-D)) - (1-e)*g
We_max = max(We[which(g[is.finite(g$X.1...dl.....T...D...p...e....p...T...dl...T...W..),1]>=0),1])
e_max = e[which.max(We[which(g>=0),1])]
g_max = g[e_max,1]

# Calculate welfare under mediator for any e/g:
e_calc = .29
g_calc = 12.98
WM = 1/(1-dh)*(p*T*(1+e_calc*g_calc) + (1-p)*(W-D)) - (1-e_calc)*g_calc

#Welfare under no mechanism
WnM = (W-D)/(1-dh)