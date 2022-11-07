%  This is a portion of the project that will output the distance of an object to
%  the command window every 5 seconds

clc, clear all, close all % clears all history and closes all running matlab programs

a = arduino('COM4','UNO',"Libraries","Ultrasonic"); % assignes the arduino to a
ultsonObj = ultrasonic(a,'D2','D3'); %assigns the ultrasonic sensor to ultsonObj

%disp(distance)
line = readVoltage(a,'A0'); % photo rsistor

while 1

    distance = readDistance(ultsonObj); %reads the ultrasonic sensor (ultsonObj) as a distance and assignes the value to distance
    %fprintf('Object is %f away.\n',distance)
    %pause (2)

    if distance <.2 % 5 is just a place holder, change before exicution

    writeDigitalPin(a,'D13',1); % LED for testing purposes

    else

    writeDigitalPin(a,'D13',0);

    end

end
