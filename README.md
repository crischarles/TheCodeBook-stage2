# Caesar Cipher

## Deciphering the text of the second stage of the book "The Code Book" with SHELL

In this second stage, despite being considered more difficult than the first by the author, it was much faster to decipher. First I count the number of encrypted letters to find out where the 3 biggest peaks are, inside of the script I named them "waves".

Once I have the waves mapped, I compare them to the "real" waves of presence of the letters A and E.
Here I am implying that the text is in a language that contains A and E among the 3 most frequent letters of the language, in other words, the text can be in English, French, Spanish, Portuguese, Esperanto, Italian, Turkish, Swedish or any other language that has A and E in the top 3 that it will work.

After running the script, you can see the result:
"faber est suae quisque fortunae appius claudius caecus dictum arcanum est neutron"

And researching the result on the internet I could see that it is in LATIN.
The message means something around:
"Every man is the artisan of his own fortune Appius Claudius Caecus the secret (or code) word is 'neutron'"

Again, this script will work to any ciphered message which the language has A and E among the 3 most frequent letters, the longer the ciphertext, the higher the accuracy of the script.
This script works only for Caesar Cipher text.

## Additional Information 

The ciphertext from the book is also in this repo, in case you want to try it.

To find out which other languages the script applies to, see the frequency of the letters in each language in:
https://en.wikipedia.org/wiki/Letter_frequency

how Caesar cipher works: 
https://en.wikipedia.org/wiki/Caesar_cipher

## How to run the script

You just have to give a ciphertext file to the script as a parameter, as below:

./script.sh file.txt

