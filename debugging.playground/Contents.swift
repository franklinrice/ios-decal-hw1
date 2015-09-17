//: # Homework 1 - Debugging and Swift Intro

//: To see markup format, go to Editor -> Show Rendered Markup


import UIKit


//: ## Q1: Optionals
//: The compiler is yelling at us. Why isn't this the correct way to unwrap optionals?

class Foo {
    
    var wordA : String?
    var wordB : String?
    
    init (words: [String?]) {
        wordA = words[0]
        wordB = words[1]
    }
    
//: [EXPLAIN YOUR ANSWER TO Q1 HERE]
//: The ! after the type declarations on lines 14 and 15 require that wordA and wordB always be strings
//: (as opposed to nil). However, the method of unwrapping the optionals on lines 17-19 with the ? implies
//: that wordA and wordB can both be nil, which violates the previous statement and an error at compile time.

    
//: ## Q2: Variable Types and Function Types
//: Why does the compiler dislike the for loop? Also, what should we return?
    
    func arePalindromes(words: [String]) -> Bool! {
        let reversedWords = words.map() {String($0.characters.reverse())}
        var numElements = words.count
        
        for var i = 0; i < numElements; i++ {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        
        return true
    }
    
//: [EXPLAIN YOUR ANSWER TO Q2 HERE]
//: The let type is reserved for variables that will not be changed. Because we (by the definition of the for loop) will be incrementing i,
//: it will be changing and should be instantiated as a var instead. Also, because the Boolean return type is mandatory, we must return true
//: as an alternative to false, not nil (this is also the logically correct thing to do).
    
    
//: ## Q3: More functions, and object initialization
//: The method should be returning true or false -- what's wrong?
//: Are we initializing the dictionary correctly?
    func isAnagram(wordA: String, wordB: String) -> Bool? {
        var countLetters = [Character : Int]()
        var lenA = wordA.characters.count
        var lenB = wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        var arrA = Array(wordA.characters)
        var arrB = Array(wordB.characters)
        
        for i in 0...lenA-1 {
            let letter = arrA[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (letter, count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
}

//: [EXPLAIN YOUR ANSWER TO Q3 HERE]
//: The syntax on the dictionary instantiation was incorrect. Also, as mentioned in Q2, the alternative to
//: false is true, not nil (and a return value of nil will not be tolerated by the compiler if the return
//: type of Bool has an ! after it, marking it as mandatorily non-nil, although this is not the case here).

//: **Do not** change anything below.
//: You should be able to call the methods as is.
Foo.isAnagram("anagram", wordB: "managra")
Foo.isAnagram("hello", wordB: "what")

var palindromes = ["hih", "racecar", "mom", "wow"]
var notPalindromes = ["gene", "shawn", "hello"]
Foo.arePalindromes(palindromes)
Foo.arePalindromes(notPalindromes)

