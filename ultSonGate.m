% this is a portion of the project that will detect if an object has crosed the
% ultrasonic threshold (ultSonObj).
% this program will detect the distance of an object. When an object is to
% close (5) it will power on the LED.

clc, clear all, close all % clears all history and closes all running matlab programs

a = arduino('COM4','UNO',"Libraries","Ultrasonic"); % assignes the arduino to a
ultsonObj = ultrasonic(a,'D2','D3'); %assigns the ultrasonic sensor to ultsonObj

%disp(distance)
line = readVoltage(a,'A0'); % photo rsistor
%writeDigitalPin(a,'D13',0);

while 1

    distance = readDistance(ultsonObj); %reads the ultrasonic sensor (ultsonObj) as a distance and assignes the value to distance

if distance <.2 % 5 is just a place holder, change before exicution

    writeDigitalPin(a,'D13',1); % LED for testing purposes

else

    writeDigitalPin(a,'D13',0);

end

end