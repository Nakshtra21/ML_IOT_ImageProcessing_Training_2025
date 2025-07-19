clc; clear; close all;

camObj = webcam();

preview(camObj);

faceDetector = vision.CascadeObjectDetector('FrontalFaceCART');

while(1)

    I = snapshot(camObj);

    imshow(I);

    bboxesface = step(faceDetector, I); % Detect faces

    if isempty(bboxesface)

    else

        UserInput=char('Gamer Detected');

        NET.addAssembly('System.Speech');

        obj = System.Speech.Synthesis.SpeechSynthesizer;

        Speak(obj,UserInput);

        IFaces = insertObjectAnnotation(I, 'rectangle', bboxesface, 'Face');

        imshow(IFaces);

        pause(1);

    end

end