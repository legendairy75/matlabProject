%  This is a portion of the project that will output the distance of an object to
%  the command window every 5 seconds

clc, clear all, close all % clears all history and closes all running matlab programs

a = arduino('COM4','UNO',"Libraries","Ultrasonic"); % assignes the arduino to a
ultsonObj = ultrasonic(a,'D2','D4'); %assigns the ultrasonic sensor to ultsonObj

%disp(distance)
line = readVoltage(a,'A0'); % photo rsistor

playTone(a,'D3',440,.5);
pause(.5);
playTone(a,'D3',440,.5);

while 1

    distance = readDistance(ultsonObj); %reads the ultrasonic sensor (ultsonObj) as a distance and assignes the value to distance
    fprintf('Object is %f away.\n',distance)
    %pause (2)

    if distance < .2 % 5 is just a place holder, change before exicution

    writeDigitalPin(a,'D6',1); % LED for photoresister on

    line = readVoltage(a,'A0'); % photo rsistor
    
            if line<.2
    
                writeDigitalPin(a,'D13',1);
                playTone(a,'D3',277.18,.5);
                pause(.2);
                playTone(a,'D3',277.18,.5);
                pause(.5);
                playTone(a,'D3',554.37,1);
                pause(.5);
                playTone(a,'D3',440.00,1);
                pause(.8);
                playTone(a,'D3',415.30,1);
                pause(.5);
                playTone(a,'D3',392.00,1);
                pause(.5);
                playTone(a,'D3',349.23,1);
                pause(.5);
                playTone(a,'D3',293.66,.5);
                pause(.5);
                playTone(a,'D3',349.23,.5);
                pause(.5);
                playTone(a,'D3',392.00,.5);
            end

    elseif distance > .23

        writeDigitalPin(a,'D6',0);
           
    else

    writeDigitalPin(a,'D13',0);

    end

end
