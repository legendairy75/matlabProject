%  This is a portion of the project that will output the distance of an object to
%  the command window every 5 seconds

clc, clear all, close all % clears all history and closes all running matlab programs

a = arduino('COM3','UNO',"Libraries","Ultrasonic"); % assignes the arduino to a
ultsonObj = ultrasonic(a,'D2','A0'); %assigns the ultrasonic sensor to ultsonObj

distance = readDistance(ultsonObj); %reads the ultrasonic sensor (ultsonObj) as a distance and assignes the value to distance
line = readVoltage(a,'D4'); % photo rsistor

while 1

    fprintf('Object is %f away.',distance)
    wait 5

end
