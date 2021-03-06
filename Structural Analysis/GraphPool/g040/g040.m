classdef g040 < model
    
    methods
        function this = g040()
            this.name = 'g040';
            this.description = ['Example system from C. Svard and M. Nyberg, Residual Generators for Fault Diagnosis'...
                'Using Computation Sequences With Mixed Causality Applied to Automotive Systems, IEEE Transactions on'...
                'Systems, Man, and Cybernetics - Part A: Systems and Humans, vol. 40, no. 6, pp. 1310–1328, Nov. 2010.'];
            
            %% Equation list
            % legend:
            % dot - differential relation
            % int - integral term
            % trig - trigonometric term
            % ni - general non-invertible term
            % inp - input variable
            % out - output variable % NOT SUPPORTED
            % msr - measured variable
            % sub - subsystem where the equation belongs
            % mat - matrix variable
            % expr - algebraic expression
            % par - parameter
            % dist - disturbance
            % rg - residual generator
            kin = [...
                {'x1_dot x1 x6 x3 x5 x7'};
                {'x2_dot x2 x3 msr y1'};...
                {'x3_dot x2 x3 x4 msr y2'};...
                {'x4_dot x2 x5 msr y3'};...
                {'x1 x2 x3 x4 x6 x7 msr y4'};...
                {'x3 x6 x7 msr y5'};...
                {'x4 msr y6'};...             
                {'fault x6 msr y7'};... % Extra equation to make the system over-determined
                ];
            
            der = [...
                {'dot x1 int x1_dot'};...
                {'dot x2 int x2_dot'};...
                {'dot x3 int x3_dot'};...
                {'dot x4 int x4_dot'};...
                ];
            
            msr = [...
                ];
            
            this.constraints = [...
                {kin},{'k'};...
                {der},{'d'};...
                {msr},{'s'};...
                ];            
        end
        
    end
    
end