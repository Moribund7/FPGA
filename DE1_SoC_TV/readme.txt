



INSTRUKCJA:

SW[9] and SW[8]
 wykrywanie kolorów określonych przy pomocy trzech parametórw: dzielnik - int ustalany przy kompilacji pliku( ze względu
na zbyt małą liczbę przełączników do ustalanaia parametórw) oraz dwa inty przy pomocy SW[5-3] drugi SW[2-0] - kontorlują kolory,
Przykładowe ustawienia: 
--dzielnik=3,SW[3],SW[2] ustawienie wykrywania koloru czlowieka


SW[9] and ~SW[8] zamienia kolory parami przy pomocy przełączników 2-0


SW[8] and ~SW[9] 
ustawia kolejne kombinacje kolorów (wszystkich jest 27): na każdy z trzech kolorów na wyjściu ustawiamy jeden z trzech kolorów na wejściu. Kolejne kombinacje wywołuje się przy pomocy ustawienia odpowiedniej wartości za pomocą przełączników 4-0


SW[7] and ~SW[6]
wyświetla cztery obrazy każdy z inną jasnością


~SW[7] and SW[6]
wyswietla cztery obrazy każdy bez jednego podstawowego koloru


SW[7] and SW[6]
wyświetla cztery obrazy w każdym wybiera filtrowany  kolor ustawiony przy pomocy przełączników SW[5-0] a następnie wycina wszystkie inne kolory poza tym wybranym ( który jest wyświetlany jedynie za pomocą kolorów RGB {nie rzeczywsity tylko jeden z podstawowych})
