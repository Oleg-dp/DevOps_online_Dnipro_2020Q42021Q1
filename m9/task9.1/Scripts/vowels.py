def count_vowels(phrase):
    vowels = ["a", "e", "i", "o", "u"]    
    return len([char for char in phrase if char in vowels])

print ('First phrase', count_vowels('Two roads diverged in a yellow wood \
            And sorry I could not travel both \
            And be one traveler, long I stood \
            And looked down one as far as I could \
            To where it bent in the undergrowth.') )
print ('Second phrase', count_vowels('zzzzzzzsssssssdddddddfffffggggggg'))
print ('Third phrase', count_vowels('abc'))
