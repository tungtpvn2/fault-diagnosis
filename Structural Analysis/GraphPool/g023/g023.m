classdef g023 < model
    % Model of electric motor, taken from Fault Diagnosis Toolbox%
    methods
        function this = g023()
            this.name = 'g023';
            this.description = 'Model of electric motor, taken from Fault Diagnosis Toolbox';

%   V == I*(R+fR) + L*dI + Ka*I*w,... % e1
%   Tm == Ka*I^2, ...                 % e2
%   J*dw == DT-b*w, ...               % e3
%   DT == Tm-Tl, ...                  % e4
%   dth == w, ...                     % e5
%   dw == alpha, ...                  % e6
%   yi == I + fi, ...                 % e7
%   yw == w + fw, ...                 % e8
%   yd == DT + fD, ...                % e9
            con = [...
                {'fault msr V I dI w'};...
                {'Tm I'};...
                {'dw DT w'};...
                {'DT Tm Tl'};...
                {'dth w'};...
                {'dw alpha'};...
                ];
            
            der = [...
                {'int dI dot I'};...
                {'int dw dot w'};...
                {'int dth dot th'};...
                ];
            
            msr = [...
                {'fault msr yi I'};...
                {'fault msr yw w'};...
                {'fault msr yd DT'};...
                ];
                
            this.constraints = [...
                {con},{'c'};...
                {der},{'d'};...
                {msr},{'s'};...
                ];
            
            this.coordinates = [];
            
        end
        
    end
    
end