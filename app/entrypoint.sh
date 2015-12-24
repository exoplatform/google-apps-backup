#!/bin/bash

cp /config/settings.yml .

python brive.py -v --keep-on-crash --keep-dirs

# docker run -ti --rm -v $PWD/settings:/config -v $PWD/data:/data brive
python brive.py -v -d --keep-dirs --keep-on-crash --preferred-formats xlsx docx pdf
