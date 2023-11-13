[f p fi]=uigetfile({'*jpg'},'Select the image');
Iim1=imread([p f]);
Iim1=rgb2gray(Iim1);
%Iim1=imresize(Iim1,[100,100]);
figure,imshow(Iim1)

Iim=imnoise(Iim1,'salt & pepper',0.01);
figure,imshow(Iim)

[peaksnr,snr]=psnr(Iim,Iim1);

fprintf('\n The peak-SNR value is %0.4f',peaksnr);
fprintf('\n The SNR value is %0.4f \n',snr);

fid=fopen('img.txt','w');
for i=1:100
    for j=1:100

        fprintf(fid,'%d',Iim(i,j));
        fprintf(fid,'\n');
    end
end

k = textread("denoised.txt");
k=abs(k);
k=uint8(k);
for i=1:98
    for j=1:98
        %l=l+1;
        Iim(i+1,j+1)=k(1);
    end
end
figure,imshow(Iim);
[peaksnr1,snr1]=psnr(Iim,Iim1);
fprintf('\n The peak-SNR value is %0.4f',peaksnr1);
fprintf('\n The SNR value is %0.4f \n',snr1);

