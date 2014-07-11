Ezx = zeros(ib,jb); Ezy = zeros(ib,jb);
Ez = zeros(ib,jb); 
Hx = zeros(ib,je);
Hy = zeros(ie,jb);
caEzx = ones(ib,jb); cbEzx = ones(ib,jb).*(dt/eps_0/dx);
caEzy = ones(ib,jb); cbEzy = ones(ib,jb).*(dt/eps_0/dx);
daHx = ones(ib,je); dbHx = ones(ib,je).*(dt/mu_0/dx);
daHy = ones(ie,jb); dbHy = ones(ie,jb).*(dt/mu_0/dx);
