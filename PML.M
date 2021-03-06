% Set up Berenger's PML material
sigmax = -3.0*eps0*c0*log(1.0e-5)/(1.0e-5)/(2.0*dx*npmls);
rhomax = sigmax*(aimp^2);
for m=1:npmls
    sig(m) = sigmax*((m-0.5)/(npmls+0.5))^2;
    rho(m) = rhomax*(m/(npmls+0.5))^2;
end

% Setting up the PML layer...
for m = 1:npmls
    re = sig(m)*dt/eps0;
    rm = rho(m)*dt/mu0;
    ca(m) = exp(-re);
    cb(m) = -(exp(-re)-1.0)/sig(m)/dx;
    da(m) = exp(-rm);
    db(m) = -(exp(-rm)-1.0)/rho(m)/dx;
end

% Place the constants in PML later in simulation grid
for i =2:ie
    for j=2:npmls+1
        m=npmls+2-j;
        caEzy(i,j) = ca(m);
        cbEzy(i,j) = cb(m);
    end
    for j =jp+1:je
        m=j-jp;
        caEzy(i,j) = ca(m);
        cbEzy(i,j) = cb(m);
    end
end

for j=2:je
    for i=2:npmls+1
        m=npmls+2-i;
        caEzx(i,j) = ca(m);
        cbEzx(i,j) = cb(m);
    end
    for i = ip+1:ie
        m=i-ip;
        caEzx(i,j) = ca(m);
        cbEzx(i,j) = cb(m);
    end
end
% Now for the Hx Field
% Left and Right Simulation Regions
for i=2:ie
    for j=1:npmls
        m=npmls+1-j;
        daHx(i,j) = da(m);
        dbHx(i,j) = db(m);
    end
    for j =jp+1:je
        m=j-jp;
        daHx(i,j) = da(m);
        dbHx(i,j) = db(m);
    end
end
% Hy Fields
% Front and Back PML Regions 
for j=j:je
    for i=1:npmls
        m = npmls+1-i;
        daHy(i,j) = da(m);
        dbHy(i,j) = db(m);
    end
    for i=ip+1:ie
        m=i-ip;
        daHy(i,j) = da(m);
        dbHy(i,j) = db(m);
    end
end


