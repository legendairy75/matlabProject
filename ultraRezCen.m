%  This is a portion of the project that will output the distance of an object to
%  the command window every 5 seconds

clc, clear all, close all % clears all history and closes all running matlab programs

%%%%Defining important components/component functions in the workspace%%%%
a = arduino('COM4','UNO',"Libraries","Ultrasonic"); % assignes the arduino to the variable "a"
ultsonObj = ultrasonic(a,'D2','D4'); %assigns the ultrasonic sensor to ultsonObj        
line = readVoltage(a,'A0'); % photo resistor
%%%%------------------------------------------------------------------%%%%

playTone(a,'D3',440,.5);  %The initial speaker sound.
pause(.5);                %ensures speaker is functional and also signals
playTone(a,'D3',440,.5);  %activation.

while 1 

    distance = readDistance(ultsonObj); %reads the ultrasonic sensor (ultsonObj)
    fprintf('Object is %f away.\n',distance) %as a distance and 
    %pause (2)                            %assignes the value to distance

    if distance < .2 % The distance needed for the LED to turn on
                 %and for the photoresistor to activate

    writeDigitalPin(a,'D6',1); % LED for photoresister on.   
                               %Also acts as the light source

    line = readVoltage(a,'A0'); %command to read photoresistor voltage
    
            if line<.2  %Photo resistor Voltage needed for "alarm" to play
                        %and for integrated LED 13 to turn on
                writeDigitalPin(a,'D13',1);
                playTone(a,'D3',277.18,.5);  %D3 is the speaker pin
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

        writeDigitalPin(a,'D6',0);  %Turns off the photoresistor LED
           
    else

    writeDigitalPin(a,'D13',0); %Turns off

    end

end
