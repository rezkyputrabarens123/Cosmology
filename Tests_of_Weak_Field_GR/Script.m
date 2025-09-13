% General Relativity Light Deflection - Small Angle Approximation
% ---------------------------------------------------------------
% This script compares Newtonian straight-line light paths
% with approximate GR (General Relativity) deflected paths.
% The result shows how light curves when passing near a massive body.

clear; clc;

R = 1;                                % Reference radius (e.g. solar radius)
MRs = [0, 0.01, 0.02, 0.03, 0.05];    % Different Rs/R values (strength of curvature)

% Define angle parameter (sin(phi))
% Small angles close to 0.1 give a wide domain, up to 1 for the closest approach
sp = linspace(0.1,1,500);             % sin(phi)
cp = sqrt(1.0 - sp.^2);               % cos(phi)

% --- Newtonian straight line (no deflection) ---
r_new = R ./ sp;                      % radial distance
x_new = r_new .* cp;                  % x-coordinates
y_new = r_new .* sp;                  % y-coordinates
plot(x_new,y_new,-x_new,y_new,'b','LineWidth',1.5)   % symmetric about y-axis
hold on

% --- Approximate GR deflected orbits ---
for k = 2:length(MRs)
    MR = MRs(k);
    
    % GR correction term (less sharp than before)
    % Added constant curvature shift proportional to Rs/R
    uu = sp./R + (MR./R^2);   
    
    r_GR = 1.0 ./ uu;                 % radial distance in GR approx
    x_GR = r_GR .* cp;                % x-coordinates
    y_GR = r_GR .* sp;                % y-coordinates
    
    plot(x_GR,y_GR,-x_GR,y_GR,'LineWidth',1.2)   % plot both sides
end

% --- Labels and axis formatting ---
title('Small Angle Orbits for Light, Newtonian and GR')
xlabel('x/R')
ylabel('y/R')
axis([-10 10 0.6 1.1])                % set axis limits
grid on
legend('Newtonian','GR: Rs/R=0.01','GR: Rs/R=0.02','GR: Rs/R=0.03','GR: Rs/R=0.05')