# linux-training

This is a simple and minimalistic script that outputs a random question from a customizable set of problems. It is a mnemonics tool which can be made to work with all sorts of exam topics, not just IT related.

It can be used as a self-training tool to auto generate exams for all kinds of certifications and to make sure you remember the solution you have learned for each of the questions you have listed.

Where you source these sample exam questions from is up to you. The point of the tool is to provide a randomized and non-sequential exam-like presentation of the questions. Suggested places to source these or more questions are online courses, of which a lot are free and on Youtube itself, along with your own creativity in making your own life difficult.

The larger the amount of possible questions, the more useful the script becomes and the more unexpected the generated question will be. 

The general idea is that the script is run continuously until you never hit a question that you can't solve. At that point, you can add more questions to the list. Removing old questions is not suggested, since memory recall tends to [fade with time](https://en.wikipedia.org/wiki/Decay_theory) if a certain question is not practiced anymore for a long time.


Note: For a lot of tasks, the script often assumes you have set up at least 2 hosts named server 1 and 2, which will usually have the role of server and client.


# Usage

Generate a new question each time ENTER is pressed:

> sh linux-random.sh

Generate  20 questions at once and then exit:

> sh linux-random.sh 20


