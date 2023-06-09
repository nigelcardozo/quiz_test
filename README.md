# quiz_test - A Quiz Test Sample Application


## Why

QUIZ_TEST was a learning project for me. I come from an Android background and have a strong
knowledge of Kotlin and Java. I had already completed a Udemy Flutter course which gave me a good
basic understanding of Dart and Flutter.

What I felt was lacking in the course I had completed was consideration for how a project should be
architected, as well as how code could be separated in terms of UI and business logic. Equally there
seemed to be little consideration for code reuse and/or splitting up the UI in any sensible fashion.

In addition testing was not considered and thus neither was dependency injection. My intent for this
project was to apply my knowledge from my Android work to my learning of Flutter.

## What I learnt

I can't say that this is perfect and along the way I found the need to rearchitect my code several
times. For instance I found quite early that unlike Android there seemed to be no consideration
inherently for localisation and thus wanted to understand that. I believe that code that is not
aesthetically pleasing is generally not good code. If code looks clunky and messy, it's not quite
right. So I looked to create utilities for the UI to be able to reuse some of what I was doing and
to split the code into manageable testable functions.

After I chose to adopt MVVM for this work I had to rearchitect my code, and, what I found quite
difficult was testing. This led to the need to use dependency injection. Initially I tried
Provider but had trouble achieving what I wanted, which is when I moved to using get_it. I think in
future I'd like to switch to RiverPod as I believe this is meant to be much better.

Finally although it's different to the Android version I used Mockito to help with my testing.

## Still to do

This project is provided as/is and is all my own work. It is not perfect and at the time of writing
I know I can do much to improve it, i.e, the file names lack consistency, my folder structure is a
bit of a strange mix of 'clean' and I'd like to add more tests. Equally in terms of functionality
at this point there is no logic to handle progression, i.e, unlocking levels as a user completes
one, or to keep track of any scores.

I may add it to this project for completeness at some stage in the future but as I feel I've
got from this project what I wanted to, my time will now be spent on a branch creating a quiz
product for app store deployment.

## License

I hope that you find this useful and if so, please let me know. You are free to use it for your
own projects should you wish to do so, but, if you do, please consider a credit. That would be
appreciated. I take absolutely no responsibility for any loss or damage that is incurred by the use
of this project and by cloning or forking the branch, you do so at your own risk.

## Follow me on Medium
- [Follow me on Medium --> https://nigelcardozo.medium.com/](https://nigelcardozo.medium.com/)

## Download my Apps
- [Elnimijo Games on Google Play](https://play.google.com/store/apps/developer?id=elnimijo+games)


