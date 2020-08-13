#!/bin/bash

text=$(xclip -o -selection primary)
translation=$(trans -show-translation-phonetics n -show-dictionary n \
                    -show-alternatives n -no-ansi\
                    en:ru "$text")
brief_with_phon=$(echo "$translation" | rg -Uo '(/.?*/)?\n\n(.?*)\n' -r '$1 $2')
echo "$brief_with_phon"

notify-send 'Translate:' "$brief_with_phon"

