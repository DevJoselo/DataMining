# -*- coding: utf-8 -*-
"""
Created on Wed Apr  5 21:10:09 2018
@author: Jose
Working with Text in Python
"""

#Senteces/ imputs strings
text1 = "Este es un texto prueba"

#Characters in the string
len(text1)

#Words in the string
text2 = text1.split('')
len(text2)

#Long words: Words that are most than 3 letter long
[w for w in text2 if len (w) > 3]

#Capitalized words
[w for w in text2 if w.istitle()]

#Words that end with s
[w for w in text2 if w.istitle('s')]

#Finding unique words: using set()
text3 = 'To be or not to be'
text4 = text3.split('')

len(set(text4))

#Finding unique words: using set()
text3 = 'To be or not to be'
text4 = text3.split(' ')

len(set(text4))
set (text4)
len(set([w.lower() for w in text4]))
set([w.lower() for w in text4])

#Checking the text
s.startswith(t)
s.endtswith(t)
t in s
s.isupper();s.islower();s.istitle()
s.isalpha();s.isdigit();s.isalnum()

#String Operations
s.lower(); s.upper(); s.titlecase()
s.split(t)
s.splitlines()
s.join(t)
s.strip(); s.rstrip()
s.find(t); s.rfind(t)
s.replace(u,v)

text5 = 'ouagadougou'
text6 = text5.split('ou')
text6
'ou'.join(text6)
text6

#individual caracters
list(text5)
text5.split(' ')
[c for c in text5]

#exemple
text8 = '  A quick brown fox jumped over the lazy dog. '
text8
text8.split(' ')

#Clean the caracters both from the star and the end
text9 = text8.strip()
text9

#Changing text
#find and replace
text9.find('o')
text9.rfind('o')
text9.replace('o', 'O')

#Handling larger texts
#Reading files line by line
f = open('cosntitucionPeru1993.txt', 'r')
f.readline()

#Reading the full file
f.seek(0)
text12 = f.read()
len(text12)

text13 = text12.splitlines()
len(text13)

#File operations
f = opoen(filename, mode)
f.readline();f.read();f.read(n)
for line in f:doSomething(line)
f.seek(n)
f.write(message)
f.close()
f.closed

#Issues with reading text files
f = open('cosntitucionPeru1993.txt', 'r')
text14 = f.readline()

#How do you remove the last newline character?
text14.rstrip()











