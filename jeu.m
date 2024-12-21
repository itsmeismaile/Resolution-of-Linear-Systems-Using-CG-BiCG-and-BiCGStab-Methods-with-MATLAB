function battle_math_hard_mode()
    clc;
    disp('Bienvenue dans Battle Math - Mode difficile!');
    disp('Préparez-vous à un combat intense.');
    disp('Répondez rapidement et correctement pour vaincre le boss.');

    % Initialiser les points de vie
    player_hp = 100;
    boss_hp = 150; % Le boss est plus puissant
    question_time_limit = 7; % Réduire le temps pour répondre
    turn = 1; % Compteur de tours

    while player_hp > 0 && boss_hp > 0
        fprintf('\n=== Tour %d ===\n', turn);
        fprintf('Votre HP : %d | Boss HP : %d\n', player_hp, boss_hp);

        % Générer une question mathématique complexe
        [question, correct_answer] = generate_hard_question();
        disp(['Question : ' question]);

        % Compte à rebours visible
        for t = question_time_limit:-1:1
            fprintf('Temps restant : %d secondes...\n', t);
            pause(1);
        end

        % Prendre la réponse du joueur
        tic;
        user_answer = input('Votre réponse : ');
        elapsed_time = toc;

        % Vérification de la réponse
        if elapsed_time > question_time_limit
            disp('Temps écoulé! Vous subissez des dégâts massifs.');
            player_hp = player_hp - 30;
        elseif user_answer == correct_answer
            disp('Bonne réponse! Vous infligez de lourds dégâts au boss.');
            boss_hp = boss_hp - 35;
        else
            disp('Mauvaise réponse! Vous subissez des dégâts.');
            player_hp = player_hp - 25;
        end

        % Attaque spéciale du boss tous les 3 tours
        if mod(turn, 3) == 0 && boss_hp > 0
            disp('Le boss prépare une attaque spéciale!');
            if randi([1, 3]) == 1
                disp('Une question bonus vous est posée pour contrer l''attaque!');
                [bonus_question, bonus_answer] = generate_hard_question();
                disp(['Bonus : ' bonus_question]);
                bonus_response = input('Votre réponse : ');
                if bonus_response == bonus_answer
                    disp('Vous avez esquivé l''attaque spéciale!');
                else
                    disp('Vous avez échoué... Le boss inflige des dégâts critiques.');
                    player_hp = player_hp - 40;
                end
            else
                disp('Pas de chance, le boss vous frappe directement!');
                player_hp = player_hp - 20;
            end
        end

        turn = turn + 1;
    end

    % Résultat final
    if player_hp <= 0
        disp('Vous avez perdu... Le boss vous a vaincu.');
    elseif boss_hp <= 0
        disp('Félicitations! Vous avez vaincu le boss en mode difficile!');
    end
end

% Générer une question mathématique complexe
function [question, answer] = generate_hard_question()
    % Opérations disponibles
    operations = {'+', '-', '*', '/', '^'};
    op1 = operations{randi([1, length(operations)])};
    op2 = operations{randi([1, length(operations)])};

    % Générer trois nombres aléatoires
    num1 = randi([1, 20]);
    num2 = randi([1, 20]);
    num3 = randi([1, 10]);

    % Construire la question avec parenthèses
    question = sprintf('(%d %s %d) %s %d', num1, op1, num2, op2, num3);
    answer = eval(question);

    % Arrondir pour les divisions ou puissances
    if ~isempty(strfind(question, '/')) || ~isempty(strfind(question, '^'))
        answer = round(answer);
    end
end
