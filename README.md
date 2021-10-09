[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/eLearningHub/pdf2video/main)
[![Pangeo](https://binder.pangeo.io/badge.svg)](https://binder.pangeo.io/v2/gh/eLearningHub/pdf2video/main)

# Usage: 

* Install [Docker](https://docs.docker.com/get-docker/)
* Configure awscli and make sure you have access to AWS Polly
* You need to have a PDF file and the text file for the speech: FILENAME.pdf and FILENAME.txt
* Run:
```
text2talk.sh FILENAME --voice Matthew --neural --conversational
```
FILENAME.mp4 will be generated in the same path.

For more information about the options and the format of the text file, see [pdf2video](https://github.com/tjunttila/pdf2video).
