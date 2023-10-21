K = zw(0.045,16);
K = [8109.81 179.9];
rt = ts(K,0);

function parameters = zw(rise_time,overshoot)
    coeff = 0;
    zeta = 0;
    if overshoot == 0
        coeff = 2.7;
        zeta = 1;
    elseif(overshoot == 4)
        coeff = 2.2;
        zeta = 1/sqrt(2);
    else
        zeta = 0.5;
        coeff = 1.8;
    end
    omega = coeff/rise_time;
    parameters = [0 0];
    parameters(2) = 2*zeta*omega-0.1;
    parameters(1) = omega^2 + 9.81;
end

function rising_time = ts(K,overshoot)
    coeff = 0;
    if overshoot == 0
        coeff = 2.7;
    elseif(overshoot == 4)
        coeff = 2.2;
    else
        zeta = 0.5;
    end
    ts = coeff/(sqrt(K(1)-9.81))
end