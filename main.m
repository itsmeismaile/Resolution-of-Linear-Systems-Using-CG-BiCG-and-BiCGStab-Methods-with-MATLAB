clc;
clear;
while true
    disp('==================== MAIN MENU ====================');
    disp('1 - Comparison of Gradient Descent Methods');
    disp('2 - Verification of Theoretical Results');
    disp('3 - Have Fun with the Game');
    disp('4 - Exit');
    disp('===================================================');
    choice = input('Please enter your choice (1-4): ');
    switch choice
        case 1
            disp('You chose the comparison of gradient descent methods.');
            comp_;
        case 2
            disp('You chose the verification of theoretical results.');
            verif_th_intera;
        case 3
            disp('You chose an interactive game.');
            jeu;
        case 4
            disp('Thank you for using this program. See you soon!');
            break;
        otherwise
            disp('Invalid choice. Please enter a number between 1 and 4.');
    end
end
