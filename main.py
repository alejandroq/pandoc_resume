import sys
import pdfkit

reload(sys)  
sys.setdefaultencoding('utf8')

options = {
    'page-size': 'Letter',
    'dpi':'750',
    'margin-top': '0.75in',
    'margin-right': '0.75in',
    'margin-bottom': '0.75in',
    'margin-left': '0.75in',
    'encoding': "UTF-8",
    'custom-header' : [
        ('Accept-Encoding', 'gzip')
    ],
    'cookie': [
        ('cookie-name1', 'cookie-value1'),
        ('cookie-name2', 'cookie-value2'),
    ],
    'no-outline': None
}

with open('dist/resume.html') as f:
    pdfkit.from_file(f, 'dist/resume.pdf', options=options)
