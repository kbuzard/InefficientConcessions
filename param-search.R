T=10
W=8
D=5
dl = .2
p = .3

#Separating w/out concessions for dh such that:
dh_swoc = W/((1-p)*W +p*(T+D))

#Separating with concessions when alpha = 1 for dh such that:
dh_stc = W/(T+D)

dh = .6
#Separating with concessions can be either with e=1 or e=0. Which does high type choose?
g1 = (p*(1-dl)*(D+T))/((1-dl)*(1-p*T)+(1-p)*D) #gift necessary to separate if e = 1
g0 = p*(D+T)                                   #gift necessary to separate if e = 0   

uh_g1 = (p*T*(1+g1))/(1-dh) - g1 + ((1-p)*(W-D-D*g1))/(1-dh)
uh_g0 = (p*T)/(1-dh) - g0 + ((1-p)*(W-D))/(1-dh)

dh1Th = D*(1-p)+1-p*T + p*(W-(T+D))/g1
dh0Th = 1 + p*(W-(T+D))/g0

uh_swoc = p*T/(1-dh) + (1-p)*(dh*(W-D)/(1-dh)-D)
uh_pool = (W-D)/(1-dh)
#What would happen for these parameters with the mediator? Only dh_stc matters, 
#and this is guaranteed by assuption on dh
