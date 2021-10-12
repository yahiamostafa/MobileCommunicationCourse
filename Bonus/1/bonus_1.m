clc;clear all;close all
freq_vec = [2.4,5].*1e9;  % frequency vector 
Pt = 0;  % transimtted power 1 mW and 0 dBm
Gt = 1; % Gain of transimitted antenna
Gr = 1; % Gain of receiving antenna
L = 1; % System loss
c = 3e8; % light speed
power_at_2 = zeros(1,6); % result due to the frequency 2.4 GHz and distance will be saved here
power_at_5 = zeros(1,6); % result due to the frequency 5 GHz and distance will be saved here
for freq = 1:2
    lamda = c / freq_vec(freq);  % wavelength = lightspeed / frequency
    for dist = 0:5
        distance = 2^dist;
        received_power = Pt + Gt + Gr + 20*log(lamda)-20*log(4*pi*distance)-10*log(L);
        if freq == 1
            power_at_2(dist+1) = received_power;
        else
            power_at_5(dist+1) = received_power;
        end
    end
end
plot(2.^(0:5),power_at_2,'linewidth',2);
xlabel('Distance between sender and receiver in (meters)')
hold on
plot(2.^(0:5),power_at_5,'linewidth',2);
ylabel('RSS at the receiver in dBm')
legend('Received power at frequency 2.4 GHz','Received power at frequency 5 GHz');