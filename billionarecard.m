clc;

businessCard = imread('businessCard.png');

ocrResults = ocr(businessCard);

ocrResults.Text

bboxes = locateText(ocrResults, 'MathWorks','IgnoreCase', true);

Iocr = insertShape(businessCard,'FilledRectangle', bboxes);

figure

imshow(Iocr)