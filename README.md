[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/eLearningHub/pdf2video/main)
[![Pangeo](https://binder.pangeo.io/badge.svg)](https://binder.pangeo.io/v2/gh/eLearningHub/pdf2video/main)

# Installing

* Install [Docker](https://docs.docker.com/get-docker/)
* Configure [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) and make sure you have access to [AWS Polly](https://docs.aws.amazon.com/polly/latest/dg/setting-up.html)
* Define text2talk functions with: `source define-text2talk.sh`
* If you want to keep the text2talk functions, run: 
```
curl https://raw.githubusercontent.com/eLearningHub/text2talk/main/install-text2talk.sh | bash
```

# Using Pandoc to make PDF slides
To convert Markdown files to PDF, you can use [pandoc](https://pandoc.org/). With Text2Talk, you can run the following command without installing pandoc locally:
```
text2pdf -t beamer SLIDES.md -o SLIDES.pdf
```
Run `text2pdf --help` to get more information about pandoc options. 

# Using pdf2video to make videos
* You need to have a PDF file and the text file for the speech: FILENAME.pdf and FILENAME.txt
* Run:
```
pdf2talk SLIDES.pdf SLIDES.txt --voice Matthew --neural --conversational SLIDES.mp4
```
SLIDES.mp4 will be generated in the same path.

For more information about the options and the format of the text file, run `pdf2talk --help` and see [pdf2video](https://github.com/tjunttila/pdf2video).

# Files

## SLIDES.md

```
% Eating Habits
% John Doe
% March 22, 2005

# In the morning

- Eat eggs
- Drink coffee

# In the evening

- Eat spaghetti
- Drink wine

# Conclusion

- And the answer is...
- $f(x)=\sum_{n=0}^\infty\frac{f^{(n)}(a)}{n!}(x-a)^n$ 
```

## SLIDES.txt
```
#page introduction
Hello! My name is Matthew. I have just joined the company as the chief learning officer. I am very excited to work with you.
#10
I have a secret to share with you. I am not a real person.
#10
Now that we got that out of the way, I am going to help you share your knowledge with your coworkers.  
#10
Today, we will be talking about Markdown.

#page markdown
The slides that you see here have been generated using a tool called pandoc from text files in the markdown format.
#10
It is amazing isn't it? You can manage your slides similar to how you manage your code.
#10
I am sure you have seen GitHub readme files. That is markdown. 
#20

#page pandoc
Pandoc is a great command line tool for working with markdown files.
#10
You can publish markdown files in more than 10 output formats including PDF, HTML, PowerPoint and Word.
#10  
In one of my previous jobs, I would write my reports in #ph/LaTeX/leI tEk/ and create my slides in PowerPoint.
#10
Including #ph/LaTeX/leI tEk/ math formulas in PowerPoint was a big headache.
#10
Later, when I switched to Markdown. I would write the content in Markdown and then publish all the reports and slides that I wanted in a very coherent form.
#10

#page LaTeX
The best part is that you can write #ph/LaTeX/leI tEk/ in markdown. 
#10
You can get the best quality of the most simple format.
#10
I hope you are now interested to know more about Markdown.
#10
Please do your own research but take a look at #ph/RStudio/Ar studio/. It is one of the best things that has happened to markdown. You will like it! 
```

## SLIDES.mp4

<iframe width="560" height="315" src="https://www.youtube.com/embed/qMgkA0EmfxQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>