Joseph Francia\
Professor Gaston Sanchez\
Stats 159\
30 September 2016

------------------------------------------------------------------------

Abstract
========

------------------------------------------------------------------------

       Although reproducibility in research may seem like a basic
concept, even very intelligent, well-respected academics can fail to
achieve reproducibility in their work. All it takes is a little
carelessness and some bad luck to destroy the reputations of honest
researchers. As a result, in this report, I am going to spend time
talking about tools that can help prevent errors and mistakes that can
compromise a project's reproducibility. Version control software
([Git](https://git-scm.com/)), remote repositories
([GitHub](http://github.com)), and **Makefiles** are some examples of
these tools that help maintain a projct's reproducibility. I am also
going to talk about computing tools that are useful for making project
reports. Specifically, I'm going to focus on **Markdown**, an intuitive
formatting syntax that converts easily to **HTML**, and **Pandoc**, a
document converter.

------------------------------------------------------------------------

Introduction
============

------------------------------------------------------------------------

       My intention for this project is for it to to be useful even
after the class has ended. I want to be able to refer back to this
project in the future in case I run into problems using any of these
computing tools. As a result, I will be providing clear, intuitive
explanations of the computing tools that we have learned thus far
(**Git**, **Make**, **Pandoc**, etc.).\
       Since this is my first time using some of these tools, I also
plan on discussing how I solved some of the issues I ran into when doing
this project. Throughout this essay, I reference helpful articles and
blogposts that helped me debug some of the issues that I faced. In
short, I want this report to help me produce reproducible project
results in the future.

------------------------------------------------------------------------

Discussion
==========

------------------------------------------------------------------------

       So what's the big deal about reproducibility? To tackle this
vague question, lets first answer another question: what does it mean
for a paper's results to be reproducible? Reproducibility simply means
that a third party (peer reviewer, fellow researcher, etc.) can
reproduce a paper's results, using the computational methods described
in the paper. As a result, it can mean a couple things if a paper's
results fail to be reproducible.\
       For one, it could simply mean that a paper's results were not
reproducible because of a simple coding/computational error (e.g.
[Reinhart-Rogoff
controversy](https://en.wikipedia.org/wiki/Growth_in_a_Time_of_Debt)).
In this case, checking for reproducibiility in one's paper would help
because the authors would have discovered a coding error when figuring
out why their results were not reproducible.\
       Secondly, it could also mean that the paper's results were
actually correct, but just not reproducible. How does this happen? Maybe
the author's computations and results were all totally correct, but the
author's paper was ambiguous or unclear about how certain computations
were made. As a result, making this kind of paper reproducible would
result in a paper that is much more clear and forthcoming about its
computational methodology.\
       Now that we have shown how a lack of reproducibility can be
symptomatic of more serious flaws, lets talk about the software tools
that help us keep our research reproducible.\
                  ![Git](https://raw.githubusercontent.com/ucb-stat159/stat159-fall-2016/master/projects/proj01/images/git-logo.png)

       Here's a quick definitional introduction to what **Git** is.
**Git** is version-control software that allows us to keep track of
changes that we have made in a file over time. It also allows a user to
explore various versions of a file. Without **Git**, a user only has
access to the most recently saved version of a file. With **Git**,
however, a user can have access to previously committed versions of a
file.\
      Why might this be useful? Lets look at an example. For instance,
lets say that a user decides that some code he or she deleted awhile
back might actually turn out to be useful for the next phase of the
project. Without **Git**, this user would have to rewrite all this code
that had already been written. However, if this user had used **Git**,
this user would have access to all previous versions of the project,
thus allowing the user to simply copy-paste some of the old code that
had been deleted.\
       Another advantage to using **Git** has to do with
reproducibility. **Git** essentially forces us to explicitly document
the changes we’ve made to a file with relevant, detailed comments. Thus,
if months after a project we decide that we want to try to reproduce the
results of our project, we can look at the previous versions and the
associated comments in order to make sense of what exactly it is that we
did (The command “git log” allows us to take a look at all the previous
versions of our file and all of the associated comments).\
       While **Git** is useful for tracking changes in our personal
projects or code, it is not sufficient for tracking changes in group
projects. For that task, **Github** is a nice tool that accompanies
**Git**.

                  ![Github](https://raw.githubusercontent.com/ucb-stat159/stat159-fall-2016/master/projects/proj01/images/github-logo.png)

       It’s important to highlight the differences between **GitHub**
and **Git** because from my experience, people often conflate the two.
**GitHub** is essentially an extension of **Git**. While **Git** allows
a single user to track changes on a file, **GitHub** is an online
repository that allows multiple users to track each other’s changes on
the same file.\
      **Github** is an online repository that allows its users to store
their **Git** repositories online. By allowing people to share
repositories, **Github** helps people collaborate on a project with
greater ease. For instance, one can have multiple branches for a single
project on **Github**, thus allowing project partners to work separately
on certain branches while collaborating on others. Moreover, **Github**
allows project partners to see what changes or contributions that their
partners have made to files on certain branches.\
       For this paper, I used both **Git** and **Github**. While I may
not have needed to use **Github** because I was not working with a
group, I found it good practice, learning how to use basic git commands.
In lab, I was running into issues with **Git** where I kept getting the
error "*permission denied (publickey)*". As a result, I used a nice
[Github
article](https://help.github.com/articles/error-permission-denied-publickey/)
that helped me debug this issue (I just had to setup an SSH key). Other
than this bug, I had no other issues using **Git** for this project. In
the next section of this paper, I am going to be talking about another
tool that helps us make our projects reproducible: **Makefiles**.\
       So what's a **Makefile**? A **Makefile** is a special file that,
along with the tool **Make**, allows us to run shell commands with ease.
Running the **Makefile** on your terminal will cause some commands in
the **Makefile** to be run. **Makefiles** are important for quite a few
reasons. For one, they can save us quite a bit of time. Instead of
having to type out a bunch of shell commands (and potentially forgetting
which shell commands to type), running the **Makefile** will run some of
the shell commands on your **Makefile**. When navigating through various
datasets and files one is using for a large project, we can potentially
save a lot of time using a **Makefile**. More importantly, however,
using **Makefiles** makes reproducing one’s code much easier.\
       Up until this class, I have never had any experience with
**Makefiles** before. In addition, I have never had experience with a
language that needed to be compiled before, so I did not quite
understand why **Makefiles** could be so useful. To be honest, this was
the most challenging part of the project for me. As a result, I had to
refer frequently back to [Lab
4](http://www.cirosantilli.com/markdown-style-guide/) in order to
refresh my understanding of the basics of **Makefiles**. I found Lab 4
super helpful because it was very example-oriented. In other words, I
was able to very easily follow along with the sample code and terminal
commands that were provided. Eventually, I was able to create a
**Makefile** that used **Pandoc** to convert this paper from a
**Markdown** format to an **HTML** format. Speaking of **Pandoc**, lets
transition over to my next section.

![Pandoc](https://raw.githubusercontent.com/ucb-stat159/stat159-fall-2016/master/projects/proj01/images/pandoc-logo.png)\
       **Pandoc** is a universal document converter. It allows us to
convert a document from one type of format into another. For instance,
if one wants to convert a **Markdown** file into an **HTML** file, one
can use the following terminal command:

    pandoc -s document.md -o document.html  

      While it is pretty neat that we can convert a document into
different formats from the **Terminal**, are these **Pandoc** commands
any better than traditional ways of converting a file? After all, one
can just save a **Markdown** file as an **HTML** by clicking “Save As.”
The advantage of using **Pandoc** commands is that we can write these
**Pandoc** commands into a **Makefile**, thus allowing us to automate
and document our file conversion process. Instead of having to manually
open a bunch of files and combining them into one document, we can
instead write our commands to a **Makefile** and then convert them all
at once with a few simple commands in Terminal. In the next section, we
are going to discuss one of the file types that Pandoc works with:
**Markdown**.\
![Markdown](https://raw.githubusercontent.com/ucb-stat159/stat159-fall-2016/master/projects/proj01/images/markdown-logo.png)\
       **Markdown** is an alternative to Word and plain text editors,
and it allows us to format our essays or reports with ease. As the
[Github website](https://guides.github.com/features/mastering-markdown/)
succinctly describes it, “Mostly Markdown is just regular text with a
few non-alphabetical characters thrown in there like `#` or `*`." In
addition to their ease of use, **Markdown** files also have the
advantage of being easily convertible into HTML. This makes **Markdown**
files very useful for writing articles or essays that will be posted on
a blog or website.\
       As someone who has always used Google Docs or Microsoft Word, it
was a whole new experience using **Markdown** files. In **Markdown**, I
found myself formatting syntax by typing, rather than pointing and
clicking. Although I initially had to refer the [Markdown
cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#code)
quite often, I quickly got the gist of the syntax, and I found that
formatting in **Markdown** was actually faster than in Google Docs or
Microsoft Word. For me, learning how to use **Markdown** files was
actually the easiest part of the project. Sure, I had to learn a new
syntax, but it was often quite intuitive. And when syntax wasn't super
intuitive (I had syntax issues embedding images into my **Markdown**
file), I just referred to the resources that Professor Sanchez provided.

------------------------------------------------------------------------

Conclusion
==========

------------------------------------------------------------------------

       So now that we have covered all the relevant tools, lets talk
more about what I had to do in order to get this project done. All in
all, I would say that I have spent 12 hours, working on this project. I
would say that 70 percent of my time was spent writing the content for
this essay, and another 20 perent was spent referring back to lab
resources for clarification on certain topics (I spent the most time
trying to understand and learn how to use **Makefiles**). The last 10
percent of the project was spent on applying the tools I used. For
example, I put in a decent amount of time setting up my **Github**
repository and syncing it to **Git**.\
       Surprisingly enough, aside from one **Github** article with
regards to setting up an SSH key, the resources I used were just limited
to the resources that Professor Sanchez provided. I didn't feel the need
to look to other resources like [Stackoverflow](Stackoverflow.com) or
[Quora](Quora.com). I did, however, ask Sindhuja for some help using
these tools. For instance, in lab, she taught the me how I can push my
files from my local repository to **Github**. In addition, I spoke to my
fellow classmate and friend Nick Saber about Makefile syntax,
specifically the syntax regarding automatic variables and wildcards.\
      To conclude, I'm just going to talk about aspects of the project
that I really liked. First of all, by having me write extensively about
the tools that I've learned in this class, this project really forced me
to reference labs and articles in order to really clarify my
understanding of these tools. In short, one's understanding of tools and
concepts really increases when one has to explain them. In addition, I
also really appreciated how this project forced us to apply some of
these tools that we've learned. For instance, I had to push my project
to the **Github** repository, write a **Makefile**, and write this whole
essay in **Markdown**. Thanks to this project, I not only have
experience using these tools, but I also now have an essay I can
reference back to in case I need help with these tools in the future.
