%***************************************
% FDTD Script for TM mode with PML
%***************************************

%***************************************
%Declare Variable
%***************************************
c = 3.0e8;
mu0 = 4.0*pi*1.0e-7;
eps0 = 8.854e-12;

%***************************************
% Setting up the Yee Grid
%***************************************
ie = 201;
je = 201;
ib = ie + 1;
jb = je + 1;
npmls = 10;
ip - ie - npmls;
jp = je - npmls;

dx = 2.0e-3;
dt = dx/c/sqrt(2);

is = (ie+1)/2;
js = (je+1)/2;

nmax = 2000;

aimp = sqrt(mu/eps);

step = ceil(nmax/10);