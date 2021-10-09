[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/eLearningHub/pdf2video/main)
[![Pangeo](https://binder.pangeo.io/badge.svg)](https://binder.pangeo.io/v2/gh/eLearningHub/pdf2video/main)

# Installing: 

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
