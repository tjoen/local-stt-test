# local-stt-test
testing pocketsphinx local-tts with limited vocab on mark1
This seems to work great for english, and ok for dutch, mainly because the model is not vey good.
The speed is good though.

## stop mycroft speech-client before testing first
- sudo service mycroft-speech-client stop

in a skill you can also use the naptime. 

# test words for skill
These english words were converted using http://www.speech.cs.cmu.edu/tools/lmtool-new.html
The dutch model has a simple bash tool, that generates a custom lm and dict, from a file called words.txt
Just edit the wordlist and use the provided models, which are not great, but do work most of the time. 


one 
two 
three
four
five 
six
seven
eight 
nine
ten
repeat
stop
pauze
end
start
quit
never
mind
help
play
yes
no
