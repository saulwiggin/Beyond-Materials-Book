% Time Stepping Loop
%First Configure the movie in matlab
figure('position', [10 250 940 360]); set(gcf, 'color', 'white');
rect = get(gcf,'position'); rect(1:2) =[0 0];

%Time-stepping loop 
for n=1:namx
    
    %Ez field update
    Ezx(2:ie,2:je) = caEzx(2:ie,2:je).*Ezx(2:ie,2:je) + cbEzx(2:ie,2:je).*(Hy(2:ie,2:je) - Hy(1:ie-1,2:je));
    Ezy(2:ie,2:je) = caEzy(2:ie,2:je).*Ezy(2:ie,2:je) + cbEzy(2:ie,2:je).*(Hx(2:ie,1:je-1) - Hx(2:ie,2:je));
    Ez(2:ie,2:je) = Ezx(2:ie,2:je) + Ezy(2:ie,2:je);
    
    % Update the source
    Ez(is, js) = source(n);
    
    % H Field Update
    Hx(1:ib,1:je) = daHx(1:ib,1:je).*Hx(1:ib,1:je) + dbHx(1:ib,1:je).*(Ez(1:ib,1:je) - Ez(1:ib,2:jb));
    Hy(1:ie,1:jb) = daHy(1:ie,1:jb).*Hy(1:ie,1:jb) + dbHy(1:ie,1:jb).*(Ez(2:ib,1:jb) - Ez(1:ie,1:jb));
    
    % Visualise Field
    frame = 10;
    if mod(n,frame) ==0
        timestep = int2str(n);
        subplot(1,3,1);pcolor(Hx);shading interp; axis image; caxis([-3e-4 3e-4]); axis([0 jb 0 ie]);
        title(['Hx']); xlabel('y'); ylabel('x');
        subplot(1,3,2);pcolor(Hy); shading interp; axis image; caxis([-3e-4 3e-4]); axis([0 je 0 ib]);
        title(['Hy at time step ',timestep]); xlabel('y'); ylabel('x');
        subplot(1,3,3);pcolor(Ez); shading interp; axis image; caxis([-0.15 0.15]); axis([0 jb 0 ib]);
        title(['Ez']); xlabel('y'); ylabel('x');
        nn = n/frame;
        getframe(gcf,rect);
    end
    
    % Display Progess to GUI
    if (mod(n,step)==0)
        c=round(clock);
        disp(['Current time step: ',num2str(n-mod(n,step)),', ',num2str(n/nmax*100),'% completed at', num2str(c(4)),':',num2str(c(5)),':',num2str(c(6))]);
    end
    
end
