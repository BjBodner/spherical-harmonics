% This is a Spherical Harmonics Simulation Generator
% To run the simulation: enter "l" and "m" of the desired mode of oscillation.
% Then, select the form in which you wish to see these oscillations:
%   1. Radialwaves
%   2. Chargewaves
%   3. SphericalWaveFunction

% To record your video enter "RecordVideo = 1;"
% It will apear in the same folder as "Spherical Harmonics Video.avi"

% Enjoy,
% Benjamin Bodner
Radialwaves = 0;          %if you want to see the waves as radial waves enter "Radialwaves = 1", if not enter "Radialwaves = 0"
Chargewaves = 0;            %if you want to see the waves as Charge waves enter "Chargewaves = 1", if not enter "Chargewaves = 0"
SphericalWaveFunction = 0;    %if you want to see a Spherical Wave Function enter SphericalWaveFunction = 1", if not enter "SphericalWaveFunction = 0"
BouncyBall = 0;%if you want to see a Bouncy Ball enter BouncyBall = 1", if not enter "SBouncyBall = 0"
choice5 = 0;

M = 0;

while choice5 <= 1
choice1 = menu(sprintf('Choose the number of Azimuthal Waves you would like to see \n L = ?'),'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20');
l = choice1
choice2 = menu(sprintf('Choose the number of Longitudinal Waves you would like to see \n M = ?'),'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20');
m = choice2-1
if m>l
    while m>l
        choice2 = menu(sprintf('The M you cose is too large \n please choose an M smaller or equal to L = %g',l),'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20');
        m = choice2-1
    end
end

choice3 = menu(sprintf('In what form would you like to see these waves in?'),'Radial Waves','Charge Density Waves', 'Spherical Wave-Function', 'Bouncy Ball');

Radialwaves = 0;          
Chargewaves = 0;            
SphericalWaveFunction = 0;    
BouncyBall = 0;

switch choice3
    case {1}
        Radialwaves = 1
    case {2}
        Chargewaves = 1
    case {3}
        SphericalWaveFunction = 1
    case {4}
        BouncyBall = 1
    otherwise
        choice3 = 0;
end
%l = 3
%m = 1
%Radialwaves = 0;          %if you want to see the waves as radial waves enter "Radialwaves = 1", if not enter "Radialwaves = 0"
%Chargewaves = 0;            %if you want to see the waves as Charge waves enter "Chargewaves = 1", if not enter "Chargewaves = 0"
%SphericalWaveFunction = 1;    %if you want to see a Spherical Wave Function enter SphericalWaveFunction = 1", if not enter "SphericalWaveFunction = 0"
%BouncyBall = 0;%if you want to see a Bouncy Ball enter BouncyBall = 1", if not enter "SBouncyBall = 0"





if Radialwaves == 1
    choice8 = menu(sprintf('Do yo want to see the original sphere too? \n \n To better see the amplitude of the waves'),'yes','no');
    [M] = MovieOf_SphericalHarmonics_As_RadialWaves(l,m,choice8);
end
if Chargewaves == 1
    [M] = MovieOf_SphericalHarmonics_As_Chargewaves(l,m);
   % [M] = MovieOf_SphericalHarmonics_As_Chargewaves2(l,m);

end
if SphericalWaveFunction == 1
    [M] = MovieOf_SphericalHarmonics_As_SphericalWaveFunction(l,m);
end

if BouncyBall == 1
     choice8 = menu(sprintf('Do yo want to see the original sphere too? \n \n To better see the amplitude of the waves'),'yes','no');
    [M] = MovieOf_SphericalHarmonics_As_BouncyBall(l,m,choice8)
end


choice4 = menu(sprintf('Do you want to save this video, as an AVI file? \n \n \n (the video will be named: "Spherical Harmonics Video.avi", and will be save in the current folder)'),'Yes','No');


    if choice4 ==1
        v = VideoWriter('Spherical Harmonics Video.avi','Uncompressed AVI');
        open(v)
        writeVideo(v,M)
        close(v)
    end
    if choice4 ==2
        M = 0;
    end

    choice5 = menu(sprintf('Want to see another one?'),'Yes','No');
    A = [ choice5 choice4 choice3 choice2 choice1 ];
    B = [ 0 0 0 0 0];
    eq(A,B)
    

    if sum(eq(A,B))>= 1
        % error message if input not selected
        choice6 = menu(sprintf('You didnt enter one or more of the menu options\n\n\n Please run the script again if you wish to see \n \n -(make sure you enter all the needed inputs)-'),'Ok');
        choice5 = menu(sprintf('Want to see another one?'),'Yes','No');
        
        % error message if not selected to continue or not
            while choice5 < 1
                choice6 = menu(sprintf('You didnt enter one or more of the menu options\n\n\n Please run the script again if you wish to see \n \n(make sure you enter all the needed inputs)'),'Ok');
                choice5 = menu(sprintf('Want to see another one?'),'Yes','No');
            end
    end
    

end