%********************************
%Source 
%********************************
freq = 3.0e9;
tau = 1/freq;
delay = 3*tau/dt;
N = round(tau/dt);
source = zeros(nmax,1);
ST=5;
for n=1:nmax
    if n<ST*N
        x = 1.0 - (ST*N-n)/(ST*N);
        g = 10.0*x^3 - 15.0*x^4 + 6.0*x^5;
        source(n) = g* sin(2*pi*freq*n*dt);
    else
        source(n) = exp(-((n-delay)*dt/tau)^2) * sin(2*pi*freq*n*dt);
    end
end