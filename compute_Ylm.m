function [Ylm] = compute_Ylm(L, M, THETA, PHI)

%%=============================================================
%% Project:   Spherical Harmonics
%% Module:    $RCSfile: compute_Ylm.m,v $
%% Language:  MATLAB
%% Author:    $Author: bjian $
%% Date:      $Date: 2007/12/27 06:23:35 $
%% Version:   $Revision: 1.3 $
%%=============================================================

Plm = legendre(L,cos(THETA));

if L~=0
  Plm = squeeze(Plm(M+1,:,:));
end

a1 = ((2*L+1)/(4*pi));
a2 = factorial(L-M)/factorial(L+M);
C = sqrt(a1*a2);

Ylm = C*Plm;
%Ylm = C*Plm.*exp(1i*M*PHI);


x = cos(THETA)
%%new polynomials function
%f = ((x.^2-1)^L)
%PLM = (((-1)^M)*((1-x.^2).^M/2)/((2^L)*factorial(L))).*diff(diff(diff(f)))
%d = 1