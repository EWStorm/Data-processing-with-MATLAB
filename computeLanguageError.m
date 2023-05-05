
function E = computeLanguageError(freq) 
%letterFrequency('small_text.txt');

%freq='small_text.txt'; %Variable F_text
freq_letters_lang=readtable('letter_frequencies.csv'); %var. F_language

%extract frequencies from Table , example Englis. 
eng=freq_letters_lang{:,2}' ;%returns data matrix for English language frequencies  
%writes as a row vector 
fr=freq_letters_lang{:,3}';
ger=freq_letters_lang{:,4}';
span=freq_letters_lang{:,5}';
port=freq_letters_lang{:,6}';
esperanto=freq_letters_lang{:,7}';
it=freq_letters_lang{:,8}';
turk=freq_letters_lang{:,9}';
swed=freq_letters_lang{:,10}'; 
pol=freq_letters_lang{:,11}'; 
dutch=freq_letters_lang{:,12}'; 
danish=freq_letters_lang{:,13}';
ice=freq_letters_lang{:,14}'; 
fin=freq_letters_lang{:,15}';
czech=freq_letters_lang{:,16}';


SE_english=sum((freq-eng).^2) ; %9.0393
SE_fr=sum((freq-fr).^2) ;
SE_ger=sum((freq-ger).^2) ;
SE_span=sum((freq-span).^2) ;
SE_port=sum((freq-port).^2) ;
SE_esperanto =sum((freq-esperanto).^2) ;
SE_it=sum((freq-it).^2) ;
SE_turk =sum((freq-turk).^2) ;
SE_swed=sum((freq-swed).^2) ;
SE_pol=sum((freq-pol).^2) ;
SE_dutch =sum((freq-dutch).^2) ;
SE_danish=sum((freq-danish).^2);
SE_ice=sum((freq-ice).^2) ;
SE_fin=sum((freq-fin).^2) ;
SE_czech=sum((freq-czech).^2) ;

E=[SE_english, SE_fr, SE_ger,SE_span, SE_port, SE_esperanto,SE_it, SE_turk,...
    SE_swed, SE_pol, SE_dutch, SE_danish, SE_ice, SE_fin, SE_czech];
end 
