function [outputArg1] = bereichAuswaehlen(inputArg1)

Hilfe = ones(700000,2);

for test = 1:700000
    Hilfe(test,:) = inputArg1(test,:);    
end

outputArg1 = Hilfe;

end

