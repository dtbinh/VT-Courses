function  [xdotp_dt3s]  = dt3sGraph (t_dt3s, xp_dt3s)

V = 1; % assuming same speed of agents

xdotp_dt3s(1) = 0; % theta-dot
xdotp_dt3s(2) = -xp_dt3s(2) + xp_dt3s(1); % theta-dot
xdotp_dt3s(3) = -xp_dt3s(3) + xp_dt3s(1); % theta-dot
xdotp_dt3s(4) = -xp_dt3s(4) + xp_dt3s(2); % theta-dot
xdotp_dt3s(5) = -xp_dt3s(5) + xp_dt3s(3); % theta-dot
xdotp_dt3s(6) = -xp_dt3s(6) + xp_dt3s(3); % theta-dot
xdotp_dt3s(7) = V*cos(xp_dt3s(1)); % x-dot
xdotp_dt3s(8) = V*cos(xp_dt3s(2)); % x-dot
xdotp_dt3s(9) = V*cos(xp_dt3s(3)); % x-dot
xdotp_dt3s(10) = V*cos(xp_dt3s(4)); % x-dot
xdotp_dt3s(11) = V*cos(xp_dt3s(5)); % x-dot
xdotp_dt3s(12) = V*cos(xp_dt3s(6)); % x-dot
xdotp_dt3s(13) = V*sin(xp_dt3s(1)); % y-dot
xdotp_dt3s(14) = V*sin(xp_dt3s(2)); % y-dot
xdotp_dt3s(15) = V*sin(xp_dt3s(3)); % y-dot
xdotp_dt3s(16) = V*sin(xp_dt3s(4)); % y-dot
xdotp_dt3s(17) = V*sin(xp_dt3s(5)); % y-dot
xdotp_dt3s(18) = V*sin(xp_dt3s(6)); % y-dot

xdotp_dt3s=xdotp_dt3s'; % x-dot transpose
