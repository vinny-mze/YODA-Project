<h1>Creating a Digital Accelarator for Image Processing and Edge Detection using an FPGA</h1>
<h2>Abstract</h2>
<p>Assisted parking is an emerging technology that aims to improve parking accuracy and safety. One of the key components of an assisted parking system is image processing. This allows the detection of obstacles and the identification of suitable parking spaces.</p>
<br>
<p>Edge detection is a common technique used in image processing that identifies the edges of objects in an image. In this context, edge detection can be used to identify parking space boundaries and the location of obstacles. One popular algorithm for edge detection is the Sobel edge detection algorithm. This calculates the gradient of the image intensity at each pixel to detect areas of high contrast. To improve the accuracy of the edge detection algorithm, a median filter can be applied to the image to remove noise and smooth out the edges. We shall use the median filter along with sobel edge detection to create an effective assisted parking system that helps drivers navigate even the most challenging parking situations.</p>
<br>
<p>Image processing requires alot of processing power since the data is processed as it is received. In order to keep up with incoming data and processing we shall make use of FPGA implementation of the above algorithms. FPGAs are known for their high processing speeds and efficient parallel programming. The two algorithms will be written in Vivado using verilog programming language model.
</p>
