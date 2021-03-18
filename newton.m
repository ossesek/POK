function [x,fval,info]=newton(f,df,x0)
    %Input:
    %f- wskaznik do funkcji ktorej zera szukamy przy czym zwracana wartosc
    %df - wskaznik funkcji do pochodnej funkcji postaci y=df(x) ktorej zera szukamy
    %x0 - punkt startowy         Output:
    %X - przyblizenie miejsca zerowego
    %fval - wartosc f(x), info - wynik 0 - zbieznosc;
    %             1   brak zbieznosci - przekroczyl max ilosc iteracji
    %             2 - df(x) - zero nie mozna policzyc kolejnego przyblizenia
    fx=f(x0); fval=fx(1); it=0;info=0;
    epsr = 1e-7; %wzgledna tolerancja
    epsa = 1e-9; %bezwgledna tolerancja
    maxit = 30;
    eps=0.5*(epsr*abs(fval)+epsa);x=x0;
    while((abs(fval)>eps) && (it<maxit))
        dfx=df(x);  %liczymy pochodna
        if(abs(dfx)>1e-12)
            x=x - fval/dfx;
        else
            info=2; %pochodna df jest zerowa
            return;
        end
        it=it+1;
        fx=f(x);
        fval=fx(1);
    end
    if((abs(fval)>eps))
        info=1; %brak zbieznosci
    end
end