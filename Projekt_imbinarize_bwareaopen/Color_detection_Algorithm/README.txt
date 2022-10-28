Hello Guys,

Welcome to my Fileexchange project. Its very easy if you follow the steps. Its long but worth reading. I will explain you 
the project code and steps to be followed. I have a youtube video explaining the code clearly. U can watch that too.

WARNING: The below information was chosen by myself under my own interest. Those data's will surely help you complete 
the project
 
                                                      Let's Begin.


STEP 1: You need few components to proceed.           1)Matlab
                                                      2)Webcam          (these two things are enough for color detection)

        But for Separation you will need the following.
                                                           
                                                      3)Arduino
                                                      4)Servo motor
                                                      5)A  belt conveyer mechanism (of your own)
                                                      6)Proper lightings.

           
       The above components are used to make the complete project....... youtube video link in the links.txt

STEP 2: Understanding the code... is very important to work with it.

        Open Matlab and run color_detection_basics.m file to understand the code. Read the green comments.
        I have a video clearly explaining the program line by line... 
        
        Code Working:   (https://www.youtube.com/watch?v=o84z4ZfK-SA&feature=youtu.be)
        Code Explained: (https://youtu.be/RrX-RyPieT8)

        This basic code will let you understand how to detect RGB colors from an image.

        Once its done then run the color_detection_using_webcam.m file to detect RGB colors from live stream video  

        The below link teaches how to interface webcam in matlab for live stream video 

        https://www.youtube.com/watch?v=Ekl21W7by_k&list=PLEo-jHOqGNyUWoCSD3l3V-FjX9PnHvx5n&index=28&t=0s  

        Code Working:   (https://www.youtube.com/watch?v=o84z4ZfK-SA&feature=youtu.be)
        Code Explained: (https://youtu.be/RrX-RyPieT8)
 
STEP 3: If you are succeeded with the above steps then it becomes easy....  

        Install the MATLAB Support Package for Arduino Hardware from the Add-ons in Matlab software.
        
        Use the below link to learn the interface between Matlab and arduino and controlling servo.

        https://www.mathworks.com/help/supportpkg/arduinoio/examples.html  

        Now open the color_detection_and_separation.m file and run......... If its a Success hurrayyyy...

        Don't worry if it doesn't work, It took me weeks to complete.  

NOTE: 1) Make sure you have enough lightings to the detecting object.
      2)It can be used to detect Red, Green and blue objects only.
      3)If your object is not detected using my code... you need to alter the following until detected...

            bw_r=imbinarize(diff_r,0.2);       //for red color i used 0.2 as threshold value. it can be 
                                                 any value between 0 and 1.

            bw_g=imbinarize(diff_g,0.071);     //0.071 for green as threshold value

            bw_b=imbinarize(diff_b,0.2);       //These are tested values for my object. It may or may not 
                                                 work for you. So change if needed.
   
      4)Position the camera exactly over the object to avoid background noise. Mostly use a light background (white)
      5)Make sure whether the arduino is connected to the right COMPORT and servo to the right Digital pin (D3 in our case)
     
                