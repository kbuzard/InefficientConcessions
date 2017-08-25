T=10
W=8
D=5
dl = .45
p = .3

#Separating w/out concessions for dh such that:
dh_swoc = W/((1-p)*W +p*(T+D))

#Separating with concessions when alpha = 1 for dh such that:
dh_stc = W/(T+D)

dh = dh_stc
#Separating with concessions can be either with e=1 or e=0. Which does high type choose?
g1 = (p*(1-dl)*(D+T))/((1-dl)*(1-p*T)+(1-p)*D) #gift necessary to separate if e = 1
g0 = p*(D+T)                                   #gift necessary to separate if e = 0   

uh_g1 = (1-dh)*(p-1)*g1 + dh*(p*T*(1+g1) + p*g1 +(1-p)*(W-D-D*g1))
uh_g0 = (1-dh)*(p-1)*g0 + dh*(p*T + (1-p)*(W-D))

dh1Th = W*(1-p)+1-p*T + p*(W-(T+D))/g1
dh0Th = W*(1-p)+1-p*T + p*(W-(T+D))/g0

#What would happen for these parameters with the mediator? Only dh_stc matters, 
#and this is guaranteed by assuption on dh