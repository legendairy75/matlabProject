% This is a portion of the project that will activate the Photo resistor circut and
% wait for something to pass through the (line).
% There is no shut off for the D9 led because if it is an alar system you
% would want it to stay tripped

clc, clear all, close all % clears all history and closes all running matlab programs

a = arduino('COM4','UNO',"Libraries","Ultrasonic"); % assignes the arduino to a
%ultsonObj = ultrasonic(a,'D2','D3'); %assigns the ultrasonic sensor to ultsonObj

writeDigitalPin(a,'D6',1)

%disp(distance)
%writeDigitalPin(a,'D13',0);

while 1

    line = readVoltage(a,'A0'); % photo rsistor

    if line<1

        writeDigitalPin(a,'D13',1);
        playTone(a,'D3',440,2);
        
    end
    
end
