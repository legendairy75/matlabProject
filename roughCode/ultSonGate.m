% this is a portion of the project that will detect if an object has crosed the
% ultrasonic threshold (ultSonObj).
% this program will detect the distance of an object. When an object is to
% close (5) it will power on the LED.

clc, clear all, close all % clears all history and closes all running matlab programs

a = arduino('COM3','UNO',"Libraries","Ultrasonic"); % assignes the arduino to a
ultsonObj = ultrasonic(a,'D2','A0'); %assigns the ultrasonic sensor to ultsonObj

distance = readDistance(ultsonObj); %reads the ultrasonic sensor (ultsonObj) as a distance and assignes the value to distance
line = readVoltage(a,'D4'); % photo rsistor

if distance <= 5 % 5 is just a place holder, change before exicution

    writeDigitalPin(a,'D13',1); % LED for testing purposes

else

    writeDigitalPin(a,'D13',0);

end
