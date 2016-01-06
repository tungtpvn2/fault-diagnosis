function [ constraints, coords ] = g003( )
%G003 High-level sensor/kinematic airplane model for fault detection
%   Detailed explanation goes here

con = [...
    {'V_a ni theta V_g'};...
    {'V_a ni theta h_dot'};...
    {'h_dot ni h'};...
    {'h msr h_{gps}'};...
    {'V_g msr V_{g,gps}'};...
    {'h msr h_{bar}'};...
    {'V_a msr V_{a,m} h'};...
    {'msr theta_m theta'};...
    ];
    
constraints = [{con},{'c'}];

% coords = [];
coords = [...
    0.4179    0.4748;...
    0.5971    0.6677;...
    0.1984    0.6639;...
    0.5997    0.2919;...
    0.2031    0.2831;...
    0.5991    0.0851;...
    0.4200    0.8569;...
    0.0752    0.0662;...
    0.0716    0.4735;...
    0.7921    0.8417;...
    0.4174    0.6627;...
    0.5997    0.4786;...
    0.4179    0.2869;...
    0.4231    0.0801;...
    0.2010    0.8544;...
    0.0752    0.2806;...
    0.2041    0.4760;...
    0.7964    0.6715;...
    ];


end

