from os import environ, path

from pocketsphinx.pocketsphinx import *
from sphinxbase.sphinxbase import *


# stop mycroft speech and audio service
# sudo service mycroft-audio stop
# sudo service mycroft-speech-client stop


HOMEDIR = '/home/pi/'
config = Decoder.default_config()
config.set_string('-hmm', '/usr/local/lib/python2.7/site-packages/mycroft_core-0.9.17-py2.7.egg/mycroft/client/speech/recognizer/model/en-us/hmm')
config.set_string('-lm', path.join(HOMEDIR, 'localstt.lm'))
config.set_string('-dict', path.join(HOMEDIR, 'localstt.dic'))
config.set_string('-logfn', '/dev/null')
decoder = Decoder(config)

import pyaudio
p = pyaudio.PyAudio()
stream = p.open(format=pyaudio.paInt16, channels=1, rate=16000, input=True, frames_per_buffer=1024)
stream.start_stream()

in_speech_bf = False
decoder.start_utt()
while True:
    buf = stream.read(1024)
    if buf:
        decoder.process_raw(buf, False, False)
        if decoder.get_in_speech() != in_speech_bf:
            in_speech_bf = decoder.get_in_speech()
            if not in_speech_bf:
                decoder.end_utt()
                print 'Result:', decoder.hyp().hypstr
                decoder.start_utt()
    else:
        break
decoder.end_utt()
