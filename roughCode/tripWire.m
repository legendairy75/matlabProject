% This is a portion of the project that will activate the Photo resistor circut and
% wait for something to pass through the (line).
% There is no shut off for the D9 led because if it is an alar system you
% would want it to stay tripped

clc, clear all, close all % clears all history and closes all running matlab programs

a = arduino('COM3','UNO',"Libraries","Ultrasonic"); % assignes the arduino to a
ultsonObj = ultrasonic(a,'D2','D3'); %assigns the ultrasonic sensor to ultsonObj

distance = readDistance(ultsonObj); %reads the ultrasonic sensor (ultsonObj) as a distance and assignes the value to distance
line = readVoltage(a,'A0'); % photo rsistor

writeDigitalPin(a,'D7',1)

if line<0

    writeDigitalPin(a,'D13',1);
    
end
