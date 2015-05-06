addpath('define_dipoles','fringes','animations','classes','responses','applied_field') %add stuff to path

%----------DEFINE_DIPOLES our system-----------
m_s = 1;
small_gamma = 1;
alpha = 1/16;

no_dipoles = 2;
exchange_coupling = 0.9;
endcoupling = true;

% create a system with these dipoles in a circle (equi) or line (lin)
dipoles = calc_equi_dip_def(no_dipoles,class_dipole(m_s,small_gamma,alpha,[0;0]));
G_x = calc_nn_gx(no_dipoles,exchange_coupling,endcoupling);


%---------calculate the EXTERNAL_FIELD from 2 sources------------ 

no_src = class_source([128;128],[0;0]);
sources = [class_source([2;2], [1;-i]), no_src];  %location, field
h_sources = calc_ss_h(calc_he(dipoles,sources,0));


%---------run scripts to look at stuff------------
%L = calc_L(1.2,1,G_x,dipoles)

%fplot(@(w) calc_power(w,G_x,dipoles,h_sources,1), [-1,5]);  %freq response

fplot(@(he0) calc_power(1.3,G_x,dipoles,h_sources,he0), [0,2]);  %FMR (vary w gives interesting results)

 %figure; plot_eigenvalues(L, G_x, dipoles, [0,2], [3,4])  % plot the eigenvalues of response matrix

%eai  %Reconstruct the L matrix

%difference = L + L_recon;

%abs((L-L_recon) ./ L) %show difference << L

