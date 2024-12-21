

% Demander les choix à l'utilisateur
rc = input("Do you want to compare methods with a dense (Enter 1) or sparse (Enter 2) matrix: ");
rg = input("Do you want us to generate a matrix for you (Enter 1) or do it yourself (Enter 2): ");

% Traitement en fonction des choix de l'utilisateur
if (rc == 1)
    if (rg == 1)
        generer;
        comp;
    elseif (rg == 2)
        choisir;
        comp;
    else
        disp('Problem in input ... exiting! Try again.');
        return;
    end
elseif (rc == 2)
    if (rg == 1)
        generer1;
        comp2;
    elseif (rg == 2)
        choisir1;
        comp2;
    else
        disp('Problem in input ... exiting! Try again.');
        return;
    end
else
    disp('Invalid choice for matrix type. Exiting...');
    return;
end
