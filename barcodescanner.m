clc;clear;
camobj = webcam (1) ;
preview (camobj);
while (1)
    img = snapshot (canObj);
    [msg] = readBarcode(img) ;
    if msg ==''
        continue;
    else
        clc;
        disp(msg) ;
        break;
    end
imshow(img); pause (1);
end