classdef g032b < model
    
    methods
        function this = g032b()
            this.name = 'g032b';
            this.description = 'Fixed-wing UAV submodel, to test AoS fault response. Added disturbances';
            
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
            kin = [...
                {'v v_r v_w expr -v+v_r+v_w'};...
                {'Beta v_r Va expr -v_r+sin(Beta)*Va'};...
                ];
            
            der = [...
                {'int dot_v dot v expr differentiator'};...
                ];
            
            dyn = [...
                {'dot_v r ni u ni p ni w Fy par m expr -dot_v+r*u+p*w+Fy/m'};...
                ];
            % Set non-zero V, u
            
            msr = [...
                {'fault Beta msr Beta_m dist d_Beta expr Beta_m-Beta-d_Beta'};...
                {'fault msr Va_m Va dist d_Va expr Va_m-Va-d_Va'};...
                {'msr r_m r dist d_r expr r_m-r-d_r'};...
                {'msr p_m p dist d_p expr p_m-p-d_p'};...
                {'msr u_m u dist d_u expr u_m-u-d_u'};...
                {'msr w_m w dist d_w expr w_m-w-d_w'};...
                {'fault msr Phi_m Phi dist d_Phi expr Phi_m-Phi-d_Phi'};...
                {'fault msr Theta_m Theta dist d_Theta expr Theta_m-Theta-d_Theta'};...
                {'msr a_m_y Fy ni par m par g Phi ni Theta dist d_ay dist d_g sub sensors expr -a_m_y+Fy/m-sin(Phi)*cos(Theta)*(g+d_g)+d_ay'};...
                {'msr v_w_m v_w expr equal'};...
                ];
            
            this.constraints = [...
                {kin},{'k'};...
                {der},{'d'};...
                {dyn},{'f'};...
                {msr},{'s'};...
                ];            
        end
        
    end
    
end