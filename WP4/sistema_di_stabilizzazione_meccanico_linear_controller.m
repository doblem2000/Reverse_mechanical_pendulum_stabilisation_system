function ueq = sistema_di_stabilizzazione_linear_controller(input)

    yd=input(1);
    yd_dot=input(2);
    yd_ddot=input(3);
    y=input(4);
    y_dot=input(5);
    fprintf("SUCAAAAAAAAAAAAAAAAAAAAAA yd %f", yd)
    fprintf("SUCAAAAAAAAAAAAAAAAAAAAAA yd_dot %f", yd_dot)
    fprintf("SUCAAAAAAAAAAAAAAAAAAAAAA yd_ddot %f", yd_ddot)
    fprintf("SUCAAAAAAAAAAAAAAAAAAAAAA y %f", y)
    fprintf("SUCAAAAAAAAAAAAAAAAAAAAAA y_dot %f", y_dot)

    Kp_alpha=10;
    Kp_beta=10;

    ulin = yd_ddot - Kp_alpha*(y_dot-yd_dot) - Kp_beta*(y-yd) ;
    
    ueq=[ulin];
end