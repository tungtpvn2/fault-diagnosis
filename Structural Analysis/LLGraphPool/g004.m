function [ constraints, coords ] = g004( )
%G004 Spring-mass system with position measuring
%   Detailed explanation goes here

con = [...
    {'x_dot x'};...
    {'v x_dot'};...
    {'v_dot v'};...
    {'v_dot x'};...
    {'msr x_m x'};...
    ];
    
constraints = [{con},{'c'}];

% coords = [];
coords = [...
    0.3033    0.2718;...
    0.2940    0.5807;...
    0.6492    0.2705;...
    0.6455    0.5832;...
    0.1427    0.9023;...
    0.1400    0.2755;...
    0.4601    0.2730;...
    0.8148    0.5807;...
    0.4633    0.5820;...
    0.1423    0.5832;...
    ];


end

