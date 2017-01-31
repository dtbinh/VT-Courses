function  [xdotp_3s]  = dir3sGraph (t_3s, xp_3s)

V = 1; % assuming same speed of agents

xdotp_3s(1) = -xp_3s(1) + xp_3s(3); % theta-dot
xdotp_3s(2) = -2*xp_3s(2) + xp_3s(1) + xp_3s(6); % theta-dot
xdotp_3s(3) = -2*xp_3s(3) + xp_3s(1) + xp_3s(2); % theta-dot
xdotp_3s(4) = -xp_3s(4) + xp_3s(2); % theta-dot
xdotp_3s(5) = -xp_3s(5) + xp_3s(3); % theta-dot
xdotp_3s(6) = -2*xp_3s(6) + xp_3s(4) + xp_3s(5); % theta-dot
xdotp_3s(7) = V*cos(xp_3s(1)); % x-dot
xdotp_3s(8) = V*cos(xp_3s(2)); % x-dot
xdotp_3s(9) = V*cos(xp_3s(3)); % x-dot
xdotp_3s(10) = V*cos(xp_3s(4)); % x-dot
xdotp_3s(11) = V*cos(xp_3s(5)); % x-dot
xdotp_3s(12) = V*cos(xp_3s(6)); % x-dot
xdotp_3s(13) = V*sin(xp_3s(1)); % y-dot
xdotp_3s(14) = V*sin(xp_3s(2)); % y-dot
xdotp_3s(15) = V*sin(xp_3s(3)); % y-dot
xdotp_3s(16) = V*sin(xp_3s(4)); % y-dot
xdotp_3s(17) = V*sin(xp_3s(5)); % y-dot
xdotp_3s(18) = V*sin(xp_3s(6)); % y-dot

xdotp_3s=xdotp_3s'; % x-dot transpose
