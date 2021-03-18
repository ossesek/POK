function x = bisekcja(f, a, b)
    %Metoda Bisekcji
    %Input:
    % f- wskaznik do funkcji
    % a,b poczatek i koniec odcinka
    % itmax - max ilosc iteracji
    %Output:
    % x- przyblizone miejsce zerowe
    % Zakladamy, ze uzytkownik poda dwa punkty a<b w ktorych f(a)f(b)<0 i
    % należą do dziedziny fukncji
    ya = f(a);
    yb = f(b);
    it = 0;
    tol = 1e-4; %kryterium stopu funkcji (dokladnosc)
    itmax = 500;
    x = (a+b) / 2;
    while( (b-a>tol) && (it<itmax))
        y = f(x);
        if(sign(y) == sign(ya))
            ya = y;
            a = x;
        else
            yb = y;
            b = x;
        end
        x = (a+b) / 2
        it=it+1;
    end
end