# linux-training

This is a simple and minimalistic script that outputs a random question from a customizable set of problems. It is a mnemonics and self-training tool which can be made to work with all sorts of exam topics, although what you will see here is an example to learn some basic Linux sysadmin administration tasks.

Assuming you know what topics to cover very well or the kinds of problems you are supposed to be able to solve, it will generate a set number of questions taking them randomly from the pool you created.

Where you source these sample exam questions from is up to you. The point of the tool is to provide a randomized and non-sequential exam-like presentation of the questions. The larger the amount of possible questions, the more useful the script becomes and the more unexpected the generated question will be. 

The general idea is that the script is run continuously until you never hit a question that you can't solve. 

It's suggested to begin with a small question set and add more questions when the initial set becomes 'easy'. You can add questions to the pool in a disabled state, if you wish, following the syntax and instructions inside the linux-random.sh itself. 

Removing old questions is not suggested, since memory recall tends to [fade with time](https://en.wikipedia.org/wiki/Decay_theory) if a certain question is not practiced anymore for a long time.

Note: For a lot of tasks, the script often assumes you have set up at least 2 hosts named server 1 and 2, which will usually have the role of server and client.


# Usage

Generate a new question each time ENTER is pressed:

> sh linux-random.sh

Generate  20 questions at once and then exit:

> sh linux-random.sh 20


