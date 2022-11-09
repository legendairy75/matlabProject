%  This is a portion of the project that will output the distance of an object to
%  the command window every 5 seconds

clc, clear all, close all % clears all history and closes all running matlab programs

a = arduino('COM4','UNO',"Libraries","Ultrasonic"); % assignes the arduino to a
ultsonObj = ultrasonic(a,'D2','D4'); %assigns the ultrasonic sensor to ultsonObj

%disp(distance)
line = readVoltage(a,'A0'); % photo rsistor

playTone(a,'D3',440,2);
playTone(a,'D3',430,2);
playTone(a,'D3',450,2);

while 1

    distance = readDistance(ultsonObj); %reads the ultrasonic sensor (ultsonObj) as a distance and assignes the value to distance
    %fprintf('Object is %f away.\n',distance)
    %pause (2)

    if distance < .2 % 5 is just a place holder, change before exicution

        %load("tripWire.m")

   % writeDigitalPin(a,'D6',1); % LED for photoresister on

    

% photo resistor start
        %while 1%distance < .2
    
            %line = readVoltage(a,'A0'); % photo rsistor
    
          %  if line<1
    
          %      writeDigitalPin(a,'D13',1);
         %       playTone(a,'D3',440,2);
%
         %   elseif distance > .2
        %        break
            
       %     end

      %  end
%Photoresister stop

    else

    writeDigitalPin(a,'D13',0);

    end

end
