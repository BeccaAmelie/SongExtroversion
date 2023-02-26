# SongExtroversion
Upon opening, the application shows instructions and a start button. When clicking the 
button, a UI-Booster window opens. Plasticity traits like extraversion are associated 
with music taste. Since extraverted people like energetic music (Miranda et al., 2010), 
the program creates a list of low (<.04) and high (>.09) energy songs, which are 
presented in pairs on the UI-Booster. When the user selects the first song, the 
instructions disappear and bubbles appear that stay during the selection process. The 
user selects a song or they may use the don’t know button. Then, the next pair is
shown.
This is repeated until ten choices were made, when the results will automatically be 
shown and no further choices can be made. Alternatively, the user can view their 
preliminary results when having chosen at least five songs by clicking the “Show 
Results” button. Thereafter, further choices can be made until ten responses have 
been recorded. If the user wants to see the results before 5 answers have been given, 
the sketch shows a message, that not enough answers have been recorded to give 
answers. If the user has given at least 5 answers and all songs have been shown the 
results are shown, otherwise the “Sorry, out of songs!” message appears. 
For showing the results, the sketch computes the extroversion of the user by 
calculating the average energy of the chosen songs. The result can be: highly 
extroverted, extroverted, ambivert, introverted and highly introverted. While the five 
personality poles were used as a guide, these labels were chosen arbitrarily since this 
is not an actual experiment and to give more nuanced results. The sentiment analysis 
based on the lyrics and valence for the musical sentiment are represented using bars 
varying in length depending on the average score.
The sketch uses the NOW-Kaggle-dataset.csv file with the songs (Kaggle, 2017), the 
UI booster library, java collections, the VADER sentiment analyser (2021) and lyrics 
website that is processed as JSOUP elements (Musixmatch, 2022). 
References
Kaggle. (2017). https://www.kaggle.com/athontz/nowthatswhaticallmusic 
Miranda, D., Morizot, J., & Gaudreau, P. (2010). Personality metatraits and music 
preferences in adolescence: a pilot study. International Journal of Adolescence and 
Youth, 15(4), 289-301.
Musixmatch. (2022). https://www.musixmatch.com/lyrics
Spotify. (2020). https://developer.spotify.com/documentation/webapi/reference/tracks/get-audio-features/
Vader Sentiment Analyser. (2021).
https://github.com/apanimesh061/VaderSentimentJava
