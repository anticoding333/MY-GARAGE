#20240107_114634
#20240107_114943   
#
#
from ultralytics import YOLO
import cv2
import easyocr
import torch

model = YOLO(r"C:\Users\Anass\Desktop\best.pt")


image_path = r"C:\Users\Anass\Desktop\20240107_114634.jpg"
image = cv2.imread(image_path)


results = model(image, save_crop=True)[0]
reader = easyocr.Reader(['en'], gpu=True)

clas=results.boxes.cls
bo=results.boxes.xyxy
cls_sort=torch.argsort(clas)
box_sort=bo[cls_sort]
b_ID=box_sort
c=0
trmeez=""
Num=""
plate=""
dash="-"
for b in b_ID:
   x1=int(b[0].item())
   y1=int(b[1].item())
   x2=int(b[2].item())
   y2=int(b[3].item())
   c=c+1
   if c==2:
      crop=image[y1:y2,x1:x2, :]
      
      gray = cv2.cvtColor(crop, cv2.COLOR_BGR2GRAY)
      
      blurred = cv2.GaussianBlur(gray , (5, 5), 0)
      
      denoised = cv2.bilateralFilter(blurred, 11, 17, 17)
      
      _, thresholded = cv2.threshold(denoised, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)
      
      inverted = cv2.bitwise_not(thresholded)
      ocr_it=reader.readtext(inverted)
      for ocr in ocr_it:
         
         trmeez=str(ocr[1])
         print(trmeez)
      
      
   if c==3 :
      crop=image[y1:y2,x1:x2, :]
      
      gray = cv2.cvtColor(crop, cv2.COLOR_BGR2GRAY)
      
      blurred = cv2.GaussianBlur(gray , (5, 5), 0)
      
      denoised = cv2.bilateralFilter(blurred, 11, 17, 17)
      
      _, thresholded = cv2.threshold(denoised, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)
      
      inverted = cv2.bitwise_not(thresholded)
      ocr_it=reader.readtext(inverted)
      for ocr in ocr_it:
         
         Num=str(ocr[1])
         print(Num)
         
      
plate=trmeez+dash+Num
print("Plate Number is "+plate)
   
   


